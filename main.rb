require 'httparty'
require 'thread'

$print_lock = Mutex.new  # Declare print_lock as a global variable

counter = 0
list_url = File.read(File.join(__dir__, 'list_url.txt')).split("\n")
list_url_download = File.read(File.join(__dir__, 'list_url_download.txt')).split("\n")

puts <<~MAvEn
Exploring possibilities... created by Maven
Important: Respect others and avoid causing harm.
MAvEn


number_of_thread = 0

print 'Enter Number Of Thread 10-100: '
number_of_thread = gets.chomp.to_i
exit if number_of_thread <= 0 || number_of_thread > 100


def attack(url)
  puts "Attempting: #{url}"
  global_counter = 0

  global_counter += 1
  begin
    response = HTTParty.get(url, timeout: 3)

    if response.body.include?('Index of /vendor/phpunit/phpunit/src/Util/PHP')
      File.open('save.txt', 'a') { |file| file.puts("[+] FOUND URL LFD #{url}") }
    elsif response.body.include?('eval-stdin.php')
      $print_lock.synchronize do
        puts "[+] FOUND URL LFD #{url}"
        File.open('save.txt', 'a') { |file| file.puts(url) }
      end
    else
      $print_lock.synchronize do
        global_counter += 1
        print "[-] Bad Url :#{url} Attempts: #{global_counter}[-]\r"
      end
    end

  rescue StandardError => e
    puts e.message
  end
end

q = Queue.new

def threading1(q)
  loop do
    q_str = q.pop.to_s
    attack(q_str)
  end
end

list_url.each do |m|
  list_url_download.each do |i|
    url = "#{m}/=#{i}"

    if url.include?('http')
      q << url
    else
      url = "http://#{m}/=#{i}"
      q << url
    end
  end
end

number_of_thread.times do
  Thread.new { threading1(q) }
end

sleep(1) until q.empty?
