# Import the watir gem/library...formerly known as 'watir-webdriver'
require 'watir'
# Require the date class for more descriptive dates in the terminal
require 'date'

# Opens the Google Chrome Web Browser
browser = Watir::Browser.new(:chrome)

# Maximizes the Web Browser Window
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

# Click on My Team
begin
	browser.element(:class => 'F-link', text: /^YOUR_TEAM_NAME$/).click
rescue
	puts "You've been rescued from an error! Yay!"
	sleep(1)
	retry
end

# Set Active Players for X Amount of Days (Default is 7)
sleep(1)
number_of_days = 7
puts "Currently setting active players from #{Time.now.strftime("%B, %d, %Y")} to #{(DateTime.now + number_of_days).strftime("%B, %d, %Y")}"
sleep(1)
number_of_days.times do |counter|
	sleep(1)
	browser.element(:class => ["Btn", "Btn-short", "Btn-primary", "Mend-med"], text: /^Start Active Players$/).click
	sleep(1)
	browser.element(:class => "Js-next").click
	sleep(1)
	puts "#{number_of_days - (counter + 1)} day[s] left to go!"
end

# Farewell Messages and Closing the Browser Session
sleep(1)
puts "Everything is all set for #{number_of_days} days!"
sleep(1)
puts "Goodbye!"
sleep(1)
browser.close
