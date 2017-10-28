# Start Active Players Lite

#### Import the necessary gems and/or libraries

Requiring a gem follows the idea of importing zipped up data that is already housed on your local system. Without these two lines of code, a user cannot interact with the Watir library or the `DateTime` Ruby class. Starting up a browser session with `browser = Watir::Browser.new(:chrome)` or `browser.goto("www.google.com")` would throw up error messages.

In order for the `require 'watir'` call to process correctly, a user should have already ran `gem install watir` in their terminal at some point in the past. That can also be done right now. Since the aforementioned has more to do with configuration, please refer to the repository's main `README.md` file where you will find information about an executable file called chromedriver.exe, PATH setup, and more.

```ruby
require 'watir'
require 'date'
```

#### Input pertinent information

Some information is required in order for this activity to be properly automated. For this version
of the script to work, it is necessary for a user to manually edit the source code. In other words, once you have downloaded this repository (a term that refers to a folder on GitHub) or copied the script `Start_Them.rb` to your computer, you will have to manually type in your Yahoo e-mail address within the quotation marks. The same goes for your password in addition to your team name. The same applies toward the amount of days (default value is seven days) you would like to set your lineup for...except the value of `NUMBER_OF_DAYS` should be an integer, so it does not need quotation marks around it. The result should be three strings and one integer. An example of a valid entry would be:

- `YOUR_EMAIL_ADDRESS = "person123"` or `YOUR_EMAIL_ADDRESS = "person123@yahoo.com"`
- `YOUR_PASSWORD = "password321"`
- `YOUR_TEAM_NAME = "Concrete Jungle"`
- `NUMBER_OF_DAYS = 14`

It is typically unsafe to have your private information in any file on your computer, so you may have to keep re-entering and removing your information in a back-and-forth manner each time you would like to set your active players. That could get pretty irritating. However, the plus side to this is that if you are comfortable with leaving your information in the file, then you may never have to retype your information again for the rest of the fantasy season unless you change your password. You could just open the terminal and run the script with less hassle involved. Keep in mind that once these variables (constants) are filled out here, you do not have to alter any other part of the source code at any point.

```ruby
YOUR_EMAIL_ADDRESS = ""
YOUR_PASSWORD = ""
YOUR_TEAM_NAME = ""
NUMBER_OF_DAYS = 7
```

#### Start a browser session

An instance of the Browser class is initialized and is stored in the instance variable `@browser` (could have named it anything), which will be accessed throughout the series of function calls. Check out the difference between local variables and instance variables if you would like to know more about the accessibility (scope) of a variable. One look at the Watir documentation (essentially a place to see which functions can be invoked as well as updates) shows us that an instance of the browser class can be passed information regarding the type of web browser to open and switches (similar to options or preferences). For emphasis, documentation is sort of like the instruction booklet that comes with console or handheld video games that lets you know which buttons do what. Documentation, often referred to as docs, is significantly related to other terms such as API (Application Programming Interface) and a library. Check those terms out and dig in!

Knowing the who, what, when, where, and why of any subject matter is crucial...and this is no exception to that rule. The code originally has a skeleton template of `Watir::Browser.new(browser, *args)` as detailed in their documentation. When a function appears like that, the contents of the parentheses are known as parameters. When the parameters are filled in, like they are in the example below, then they become known as arguments. Not all functions are designed to accept parameters, such as `start_browser`(could have been named anything) demonstrates below. For future reference, `start_browser` could also be written as `start_browser()`.

The future is now. A tangent, but the `self.maximize` chained at the end of `@browser.window` (where `@browser` replaces the `self` keyword) is an instance method that belongs to instances of the Window Class. A good way to understand classes is to check out tutorials or articles about Ruby that use examples involving animals, playing cards, or vehicles. Anyway. This instance method can be called without parameters and technically can be written as `@browser.window.maximize()` where the empty parentheses indicates no parameters are taken. This differs from `do_some_addition` which is a public method and has two designated parameters. I hope that little blurb helps guide your search! You may also want to check out your programming language's style guide of choice where certain conventions (soft yet strongly encouraged rules and guidelines) are displayed. Ruby's style guide explains that snake_case is favored over camelCase or PascalCase and it also goes into why empty parentheses at the end of functions are omitted...among other things.

Back to business. Below is one way to expand on a difference between a parameter and an argument. Hopefully the example helps with demystifying what is going on in the body of functions throughout the actual script.

```ruby
def do_some_addition(num1, num2) # The parameters are: num1 and num2
  num1 + num2 # Ruby has implicit returns; there's no need (also no harm) to explicitly type: return num1 + num2
end # The do_some_addition function becomes defined so that it can be called at some later point in time

do_some_addition(6, 4) # The function is called and is passed in (given) the arguments of: 6 and 4
```

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

We need to provide directions the way a copilot does or the way a GPS requires coordinates. Thus, in order for the button to be located, Watir provides an instance method (see: instance methods, class methods, public methods) known as `#element` which accepts the argument of `:id` and the id is an HTML attribute. Some level of HTML (structure) and CSS (style) as well as familiarity with the Inspector Tools (right-click + inspect) will assist in understanding what exactly is going on under the hood. Basically, the sign-in button is labeled with the id of `yucs-profile` and the driver (term for the mechanism performing the automated actions) locates the element (piece of information) and clicks on it (by scanning for the id), just as a person would do manually.

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

If all goes according to plan, then this reference to `YOUR_EMAIL_ADDRESS` will hold your password that you typed in at the top of this file. That means there should be no need to alter the body of this function. Mini-tutorial aside, this part might be the coolest thing to witness...to see automation first-hand.

```ruby
def enter_email
  @browser.tap { |b| b.text_field(:id => 'login-username').set(YOUR_EMAIL_ADDRESS) }.send_keys(:enter)
end
```

#### Type in password and press enter

If all goes according to plan, then this reference to `YOUR_PASSWORD` will hold your password that you typed in at the top of this file.
This part might be the second coolest thing to witness.

```ruby
def enter_password
  @browser.tap { |b| b.text_field(:id => 'login-passwd').set(YOUR_PASSWORD) }.send_keys(:enter)
end
```

#### Navigate to My Team

A begin and rescue block (sometimes an ensure block is used as well) is how Ruby handles exceptions and errors. Two errors, among many, that may be encountered include: a timeout error and an element_cannot_be_clicked error. A timeout error is when the web page is still loading and the time elapsed surpasses the default_timeout value of 30 seconds (can be altered). In this case, the team_name might be clickable and loaded, but the rest of the web page is holding things up (advertisements, images, etc). Error handling can help achieve the intended goal of clicking the desired element despite such a non-fatal error. The element_cannot_be_clicked error may occur in this case for similar reasons.

Those hailing from the Python programming language may know this underlying concept as a `try/except` sequence. Those hailing from JavaScript may know this underlying concept as a `try/catch` sequence.

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
The constant `NUMBER_OF_DAYS` is initially set to a value of seven. By default, if you run this on a Monday then it will set your players for: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday aka 7 days. Feel free to change the value of `NUMBER_OF_DAYS` accordingly.

It may be in your best interest to be mindful of the time of day when you are running this script; Yahoo fantasy basketball moves on to the next day starting at 3:00am or 4:00am Eastern Standard Time. As a result, this script might undershoot or overshoot the `NUMBER_OF_DAYS` you had intended by a day or so. Approach this as you see fit!

Things that might pique your interest: loops such as `NUMBER_OF_DAYS.times do`, Ruby blocks having a variable within pipes `|counter|`, string interpolation aka `"#{NUMBER_OF_DAYS - 1 (counter + 1)}"`, keywords such as `puts`, and regular expressions aka regexp such as `/^Start Active Players$/`.

I may have misled you earlier; this is probably the coolest thing to witness if you are sticking around to watch the driver automate the process!

```ruby
def set_active_players
  puts "Currently setting active players from #{Time.now.strftime("%B, %d, %Y")} to #{(DateTime.now + (NUMBER_OF_DAYS-1)).strftime("%B, %d, %Y")}"
  NUMBER_OF_DAYS.times do |counter|
    @browser.element(:class => ["Btn", "Btn-short", "Btn-primary", "Mend-med"], text: /^Start Active Players$/).click
    @browser.element(:class => "Js-next").click
    puts "#{NUMBER_OF_DAYS - (counter + 1)} day[s] left to go!"
    sleep(3)
  end
end
```

#### Recap and farewell messages plus browser shutdown

It is important to close the browser session because it takes up space and will run in the background otherwise.

```ruby
def farewell
  sleep(1)
  puts "Everything is all set for #{NUMBER_OF_DAYS} days (including today)!"
  sleep(1)
  puts "Goodbye!"
  sleep(1)
  @browser.close
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

The main function titled `start_active_players_lite` will be ran from the terminal if the file name typed appropriately matches the file name. In the shell, terminal, or command prompt, the command `ruby 'Start_Them'.rb` would be entered. The code would run from there, assuming that the command was called from the proper directory (folder path).

My command prompt resembles this: `~\Desktop\YahooFantasyBasketballScript\Start_Active_Players_Lite` and I would input `ruby 'Start_Them'.rb` on the side of that path where the text field exists.

Some experience with navigating the terminal using the command `cd` (cd: change directory aka change folder) and autocompleting folder names with the `tab` key will be tremendously helpful at this point. More to the point, if someone made a new folder on their desktop titled `foo` and dragged and dropped `Start_Them.rb` into it, then the path would reflect that directory (aka folder) accordingly like so: `~\Desktop\foo\` followed by typing in `ruby 'Start_Them.rb'`. You'll get the hang of the command line and running scripts on it, no worries! Just a matter of practice!

To clarify the order of operations behind the curtain, the only function being ran will be the `start_active_players_lite` function, which inherently calls the helper functions step by step. The functions are defined first; the body of a function does not run upon being declared...so we need to call them like so (see below).

```ruby
if __FILE__ == $PROGRAM_NAME
  start_active_players_lite
end
```
