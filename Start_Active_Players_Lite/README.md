# Start Active Players Lite

#### Import the necessary gems and/or libraries

Requiring a gem follows the idea of importing zipped up data that is already housed on your local system. Without these two lines of code, a user cannot interact with the Watir library. Starting up a browser session with `browser = Watir::Browser.new(:chrome)` or `browser.goto("www.google.com")` would throw up error messages. In order for the `require 'watir'` call to process correctly, a user should have already ran `gem install watir` in their terminal at some point in the past. Since that has more to do with configuration, please refer to the repository's main `README.md` file where you will find information about an executable file called chromedriver.exe, PATH setup, and more.

```ruby
require 'watir'
require 'date'
```

#### Input pertinent information

Some information is required in order for this activity to be properly automated. For this version
of the script to work, it is necessary for a user to manually edit the source code. In other words, once you have downloaded this repository (a term that refers to a folder on GitHub) or copied the script `Start_Them.rb` to your computer, you will have to type in your Yahoo e-mail address within the quotation marks. The same goes for your password in addition to your team name. An example of a valid entry would be:

- `YOUR_EMAIL_ADDRESS = "person123"` or `YOUR_EMAIL_ADDRESS = "person123@yahoo.com"`
- `YOUR_PASSWORD = "password321"`
- `YOUR_TEAM_NAME = "Concrete Jungle"`

It is typically unsafe to have your information out in the open, so you may have to keep re-entering your information each time you would like to set your active players. However, the plus side to this is that if are comfortable with leaving your information in the file, then you may never have to retype your information again for the rest of the fantasy season unless you change your password. You could just open the terminal and run the script with less hassle involved. Keep in mind that once these variables (constants) are filled out here, you do not have to alter any other part of the source code at any point.

```ruby
YOUR_EMAIL_ADDRESS = ""
YOUR_PASSWORD = ""
YOUR_TEAM_NAME = ""
```

#### Start a browser session

An instance of the Browser class is initialized and is store in the instance variable `@browser` (could have named it anything), which will be accessed throughout the series of function calls. Check out the difference between local variables and instance variables if you would like to know more about the accessibility of a variable (scope). One look at the Watir documentation (essentially a place to see which functions can be invoked as well as updates), an instance of the browser class can be passed information such as the type of web browser to open and switches (similar to options or preferences). The code originally has a skeleton template of `Watir::Browser.new(browser, *args)`. When a function looks like that, the contents of the parentheses are known as parameters. When the parameters are filled in, such as in the example below, then they are known as arguments. That's that for this section.

```ruby
def start_browser
  @browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --incognito])
  @browser.window.maximize
end
```

#### Type the website url into the address bar
```ruby
def type_url
  begin
    @browser.goto("https://basketball.fantasysports.yahoo.com")
  rescue
    puts "You've been rescued from an error! Yay!"
  end
end
```

#### Click on the Sign In button

In order for the button to be located, Watir provides an instance method (see: instance methods, class methods, functions) known as `#element` which accepts the argument of `:id` and the id is an HTML attribute. Some level of HTML and CSS as well as the Inspector Tools (right-click + inspect) is helpful for understanding what is going on under the hood. Basically, the sign-in button is labeled with the id of `yucs-profile` and the driver (term of the mechanism performing the automated actions) locates the element (piece of information) and clicks on it, just as a person would do manually.

```ruby
def sign_in
  begin
    @browser.element(:id => 'yucs-profile').click
  rescue
    puts "You've been rescued from an error! Yay!"
    sleep(1)
    retry
  end
end
```

#### Type in e-mail address and press enter

Not only can you instruct the driver to type in information, but you can also send it keystroke commands such as hitting `:enter` after typing in a password or the common hotkey combination of `[:control, "a"]` to select all.

```ruby
def enter_email
  @browser.tap { |b| b.text_field(:id => 'login-username').set(YOUR_EMAIL_ADDRESS) }.send_keys(:enter)
end
```

#### Type in password and press enter
```ruby
def enter_password
  @browser.tap { |b| b.text_field(:id => 'login-passwd').set(YOUR_PASSWORD) }.send_keys(:enter)
end
```

#### Navigate to My Team
```ruby
def click_on_team_name
  begin
    @browser.element(:class => 'F-link', text: YOUR_TEAM_NAME).click
  rescue
    puts "You've been rescued from an error! Yay!"
    sleep(1)
    retry
  end
end
```

#### Click the Set Active Players button
The instance variable `number_of_days` is initially set to a value of seven. By default, if you run this on a Monday then it will set your players for: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday aka 7 days. Feel free to change the value of the `number_of_days` instance variable accordingly. It may be in your best interest to be mindful of the time of day when you are running this script; Yahoo fantasy basketball moves on to the next day starting at 3:00am or 4:00am Eastern Standard Time. As a result, this script might undershoot or overshoot the `number_of_days` you had intended by a day or so. Approach this as you see fit! Things that might catch your eye here: loops such as `@number_of_days.times do`, Ruby blocks with a variable within pipes `|counter|`, string interpolation aka `"#{@number_of_days - 1 (counter + 1)}"`, keywords such as `puts`, and regular expressions aka regexp such as `/^Start Active Players$/`.
```ruby
def set_active_players
  @number_of_days = 7
  puts "Currently setting active players from #{Time.now.strftime("%B, %d, %Y")} to #{(DateTime.now + (@number_of_days-1)).strftime("%B, %d, %Y")}"
  @number_of_days.times do |counter|
    browser.element(:class => ["Btn", "Btn-short", "Btn-primary", "Mend-med"], text: /^Start Active Players$/).click
    browser.element(:class => "Js-next").click
    puts "#{@number_of_days - (counter + 1)} day[s] left to go!"
    sleep(3)
  end
end
```

#### Recap and farewell messages as well as browser shutdown
```ruby
def farewell
  sleep(1)
  puts "Everything is all set for #{@number_of_days} days (including today)!"
  sleep(1)
  puts "Goodbye!"
  sleep(1)
  browser.close
end
```

#### Call the steps aka helper functions inside a main function
```ruby
def start_active_players_lite
  start_browser
  type_url
  click_profile
  enter_email
  enter_password
  click_on_team_name
  set_active_players
  farewell
end
```

#### Invoke the main method when this file is executed from the terminal
```ruby
if __FILE__ == $PROGRAM_NAME
  start_active_players_lite
end
```
