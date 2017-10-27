# Import the watir gem/library...formerly known as 'watir-webdriver'
require 'watir'
# Require the date class for more descriptive dates in the terminal
require 'date'

# Opens a Web Browser Session for Google Chrome (Either in Headless Mode or in Incognito Mode)
browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --headless])
browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --incognito])

# Maximizes the Web Browser Window (This is unnecessary in Headless Mode)
browser.window.maximize

# Goes to Web Address
begin
	browser.goto("https://basketball.fantasysports.yahoo.com")
rescue
	puts "You've been rescued from an error! Yay!"
end

# Clicks on Sign In
begin
	browser.element(:id => 'yucs-profile').click
rescue
	puts "You've been rescued from an error! Yay!"
	sleep(1)
	retry
end

# Types in Email Address and Presses Enter
browser.tap { |b| b.text_field(:id => 'login-username').set("YOUR_EMAIL_ADDRESS") }.send_keys(:enter)

# Types in Password and Presses Enter
browser.tap { |b| b.text_field(:id => 'login-passwd').set("YOUR_PASSWORD") }.send_keys(:enter)

# Navigates to My Team
begin
	browser.element(:class => 'F-link', text: /^YOUR_TEAM_NAME$/).click
rescue
	puts "You've been rescued from an error! Yay!"
	sleep(1)
	retry
end

# Set Active Players for X Amount of Days (Default is 7)
# By default, if you run this on Monday it will set your players for: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday aka 7 days
# Change the value of the number_of_days variable accordingly
number_of_days = 7
puts "Currently setting active players from #{Time.now.strftime("%B, %d, %Y")} to #{(DateTime.now + (number_of_days-1)).strftime("%B, %d, %Y")}"
number_of_days.times do |counter|
	browser.element(:class => ["Btn", "Btn-short", "Btn-primary", "Mend-med"], text: /^Start Active Players$/).click
	browser.element(:class => "Js-next").click
	puts "#{number_of_days - (counter + 1)} day[s] left to go!"
	sleep(3)
end

# Farewell Messages and Closing the Browser Session
sleep(1)
puts "Everything is all set for #{number_of_days} days (including today)!"
sleep(1)
puts "Goodbye!"
sleep(1)
browser.close
