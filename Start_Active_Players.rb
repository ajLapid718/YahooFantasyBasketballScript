require 'watir'
require 'date'

browser = Watir::Browser.new(:chrome)
browser.window.maximize

begin
	browser.goto("https://basketball.fantasysports.yahoo.com")
rescue
	puts "You've been rescued from an error! Yay!"
end

begin
	browser.element(:id => 'yucs-profile').click
rescue
	puts "You've been rescued from an error! Yay!"
	sleep(1)
	retry
end

browser.tap { |b| b.text_field(:id => 'login-username').set("YOUR_EMAIL_ADDRESS") }.send_keys(:enter)
browser.tap { |b| b.text_field(:id => 'login-passwd').set("YOUR_PASSWORD") }.send_keys(:enter)

begin
	browser.element(:class => 'F-link', text: /^YOUR_TEAM_NAME$/).click
rescue
	puts "You've been rescued from an error! Yay!"
	sleep(1)
	retry
end

sleep(1)
number_of_days = 7
puts "Currently setting active players from #{Time.now.strftime("%B, %d, %Y")} to #{(DateTime.now + (number_of_days-1)).strftime("%B, %d, %Y")}"
sleep(1)
number_of_days.times do |counter|
	sleep(1)
	browser.element(:class => ["Btn", "Btn-short", "Btn-primary", "Mend-med"], text: /^Start Active Players$/).click
	sleep(1)
	browser.element(:class => "Js-next").click
	sleep(1)
	puts "#{number_of_days - (counter + 1)} day[s] left to go!"
end

sleep(1)
puts "Everything is all set for #{number_of_days} days (including today)!"
sleep(1)
puts "Goodbye!"
sleep(1)
browser.close
