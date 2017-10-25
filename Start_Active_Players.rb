require 'watir'
require 'date'

browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --headless])

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

number_of_days = 7
puts "Currently setting active players from #{Time.now.strftime("%B, %d, %Y")} to #{(DateTime.now + (number_of_days-1)).strftime("%B, %d, %Y")}"
number_of_days.times do |counter|
	amount_of_starts = browser.as(:target => "sports").size
	sleep(2)
	puts "There are #{amount_of_starts} players who have a game on #{(DateTime.now + counter)}.strftime("%B, %d, %Y")}!"
	browser.element(:class => ["Btn", "Btn-short", "Btn-primary", "Mend-med"], text: /^Start Active Players$/).click
	browser.element(:class => "Js-next").click
	puts "#{number_of_days - (counter + 1)} day[s] left to go!"
	sleep(3)
end

sleep(1)
puts "Everything is all set for #{number_of_days} day[s] (including today)!"
sleep(1)
puts "Goodbye!"
sleep(1)
browser.close
