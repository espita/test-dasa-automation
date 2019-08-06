# Test for Dasa using the website automationpractice

This is automated test designed using Ruby as language, Cubumber as BDD framework, SitePrism and Docker.

### Requirement

* Ruby version 2.5.5  - [Ruby](https://www.ruby-lang.org/pt/documentation/installation/)
* Google Chrome
* ChromeDriver - This is a driver for default browser [ChromeDriver](https://chromedriver.chromium.org/)
* Firefox
* GeckoDriver - This is a driver for browser Firefox [GeckoDriver](https://github.com/mozilla/geckodriver)

### Dependencies

* Capybara [Gem Capybara](https://github.com/teamcapybara/capybara)
* Cucumber [Gem Cucumber](https://github.com/cucumber/cucumber-ruby)
* Rspec    [Gem Rspec](https://github.com/rspec/rspec)
* Selenium-webdriver [Gem Selenium-Webdriver](https://github.com/SeleniumHQ/selenium/tree/master/rb)
* Webdrivers [Gem Webdrivers](https://github.com/titusfortner/webdrivers)
* Pry [Gem Pry](https://github.com/pry/pry)
* SitePrism [Gem SitePrism](https://github.com/site-prism/site_prism)
* Faker [Gem Faker](https://github.com/faker-ruby/faker)

### Installation Instructions

 >copy the project 
 
```bash
$ git clone https://github.com/espita/test-dasa-automation.git
```

Within the project folder

>install bundler

```bash
$ gem install bundler
```
>install dependencies

```bash
$ bundle install
```

# Run Test

To run automated tests we will use the commands listed below straight from the root folder.

### Run all tests with default browser "Chrome" 

```bash
$ bundle exec cucumber
```

### Run all tests with browser Firefox 

```bash
$ bundle exec cucumber -p firefox
```

### Run all tests with browser Chrome headless mode

```bash
$ bundle exec cucumber -p chrome_headless
```

### Run all tests with browser Firefox headless mode

```bash
$ bundle exec cucumber -p firefox_headless
```

### Run with json and htm report format chooses brwoser

>examples

```bash
$ bundle exec cucumber -p firefox -p report 
$ bundle exec cucumber -p chrome -p report 
```

# Environment Docker

### Requirement

>install Docker
 
 Docker [Docker](https://docs.docker.com/install/)

### Create image 

```bash
$ docker build . -t automationpractice-test:0.1
```

>show docker images

```bash
$ docker images
```

#### Browser options:

* chrome_headless
* firefox_headless

### How do you run : 

>if you can export volume reports 

>create folder for reports

```bash
$ mkdir ~/reports
```

>docker run browser chrome generating screenshot

```bash
$ docker run -v ~/reports:/automationpractice/reports -e BROWSER=chrome_headless automationpractice-test:0.1
```

>docker run browser firefox generating screenshot

```bash
docker run -v ~/reports:/automationpractice/reports -e BROWSER=firefox_headless automationpractice-test:0.1
```
>docker run browser firefox generating screenshot and html/json 

```bash
docker run -v ~/reports:/automationpractice/reports -e REPORT=true -e BROWSER=firefox_headless automationpractice-test:0.1
```

>docker run browser chrome generating screenshot and html/json 

```bash
docker run -v ~/reports:/automationpractice/reports -e REPORT=true -e BROWSER=chrome_headless automationpractice-test:0.1
```

# Author

Edson Pita            
E-mail - <edson.pita.sp@gmail.com>        
Linkedin - [Linkedin](https://www.linkedin.com/in/edsonpita/)