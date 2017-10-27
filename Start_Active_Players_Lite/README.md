# Start Active Players Lite

###### Import the necessary gems or libraries
```ruby
require 'watir'
require 'date'
```

###### Input pertinent information
```ruby
YOUR_EMAIL_ADDRESS = ""
YOUR_PASSWORD = ""
YOUR_TEAM_NAME = ""
```

###### Start a browser session with Google Chrome in Incognito Mode with a maximized window
```ruby
def start_browser
  @browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --incognito])
  @browser.window.maximize
end
```

###### Type the website url into the address bar
```ruby
def type_url
  begin
    @browser.goto("https://basketball.fantasysports.yahoo.com")
  rescue
    puts "You've been rescued from an error! Yay!"
  end
end
```

###### Click on the Sign In button
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

###### Type in e-mail address and press enter
```ruby
def enter_email
  @browser.tap { |b| b.text_field(:id => 'login-username').set(YOUR_EMAIL_ADDRESS) }.send_keys(:enter)
end
```

###### Type in password and press enter
```ruby
def enter_password
  @browser.tap { |b| b.text_field(:id => 'login-passwd').set(YOUR_PASSWORD) }.send_keys(:enter)
end
```

###### Navigate to My Team
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

Set Active Players for X Amount of Days (Default is 7)
By default, if you run this on Monday it will set your players for: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday aka 7 days
Change the value of the number_of_days variable accordingly

###### Click the Set Active Players button
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

###### Recap and farewell messages as well as browser shutdown
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

###### Call the steps aka helper functions inside a main function
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

###### Invoke the main method when this is executed from the terminal
```ruby
if __FILE__ == $PROGRAM_NAME
  start_active_players_lite
end
```
