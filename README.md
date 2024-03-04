# REC-Scanner-Ruby
## Description

A multi-threaded web scanner script designed to explore and identify potential vulnerabilities in web applications. Created by Maven, this tool emphasizes responsible use and urges users to respect others, avoiding any harmful activities.

## Usage

1. Ensure you have Ruby installed.
2. Clone the repository and navigate to the script's directory.
3. Provide a list of URLs in 'list_url.txt' and 'list_url_download.txt'.
4. Run the script, specifying the desired number of threads when prompted.

```bash
$ git clone https://github.com/Abo5/REC-Scanner-Ruby.git
$ cd REC-Scanner-Ruby
$ gem install httparty thread
$ ruby main.rb
```
## Key Features

- Utilizes HTTParty for making HTTP requests.
- Implements multi-threading to enhance scanning speed.
- Parses lists of URLs from 'list_url.txt' and 'list_url_download.txt' for targeted exploration.
- Reports potential vulnerabilities, such as 'Index of /vendor/phpunit/phpunit/src/Util/PHP' and 'eval-stdin.php', to a 'save.txt' file.

## Warning

This script is intended for educational purposes and ethical hacking only. Unauthorized scanning or exploiting vulnerabilities without proper authorization is illegal and against ethical standards.

## Contributing

Feel free to contribute by reporting issues, suggesting enhancements, or submitting pull requests.

## Author

Maven
