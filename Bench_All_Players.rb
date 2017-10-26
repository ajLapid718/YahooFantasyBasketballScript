require 'watir'
require 'date'
require 'highline/import'
START_TIME = Time.now

print "Enter your Yahoo e-mail address (example: person123): "
YAHOO_EMAIL_ADDRESS = gets.chomp

begin
	yahoo_password = ask("Enter your password: ") { |q| q.echo = "*" }
	password_confirmation_attempt = ask("Confirm your password: ") { |q| q.echo = "*" }
	if yahoo_password == password_confirmation_attempt
		yahoo_password = yahoo_password
	else
		raise Exception.new("Your passwords do not match. Try again.")
	end
rescue Exception => error_message
	puts "#{error_message}"
	retry
end

print "Enter the name of your team: "
MY_TEAM = gets.chomp

browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --headless])

begin
	browser.goto("https://basketball.fantasysports.yahoo.com")
rescue
	puts "There's been an error regarding accessing the website. This is a troubling start."
end

begin
	browser.element(:id => 'yucs-profile').click
rescue
	puts "There's been an error regarding clicking on the Sign In link. Will refresh and try again!"
	sleep(1)
	browser.refresh
	sleep(1)
	retry
end

puts " "
puts "Currently logging in..."
browser.tap { |b| b.text_field(:id => 'login-username').set(YAHOO_EMAIL_ADDRESS) }.send_keys(:enter)
browser.tap { |b| b.text_field(:id => 'login-passwd').set(yahoo_password) }.send_keys(:enter)
puts "Successfully logged in. Navigating to My Team now."

begin
	browser.element(:class => 'F-link', text: MY_TEAM).click
rescue
	puts "There's been an error regarding clicking on your team name."
	sleep(1)
	browser.refresh
	sleep(1)
	retry
end

puts " "
puts "Currently benching all players for #{Time.now.strftime("%B, %d, %Y")}"
10.times do |i|
	sleep(1)
	player_name = browser.table(:id => "statTable0")[i+2][2]
	puts "Currently putting #{player_name.text} on the bench!"
	player_name.click
	sleep(3)
	browser.table(:id => "statTable0").trs.last.click
	sleep(3)
end

sleep(1)
puts " "
sleep(1)
puts "Everything is all set for today!"
sleep(1)
puts "All your players on the bench!"
sleep(1)
puts "This script took #{(Time.now - START_TIME).to_i} seconds to complete!"
sleep(1)
puts "Goodbye!"
sleep(1)
browser.close
