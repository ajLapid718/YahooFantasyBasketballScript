@browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --headless])

begin
	@browser.goto("https://basketball.fantasysports.yahoo.com")
rescue
	puts "There's been an error regarding accessing the website. This is a troubling start."
end

begin
	@browser.element(:id => 'yucs-profile').click
rescue
	puts "There's been an error regarding clicking on the Sign In link. Will refresh and try again!"
	sleep(1)
	@browser.refresh
	sleep(1)
	retry
end

puts " "
puts "Currently logging in..."
@browser.tap { |b| b.text_field(:id => 'login-username').set(YAHOO_EMAIL_ADDRESS) }.send_keys(:enter)
@browser.tap { |b| b.text_field(:id => 'login-passwd').set(YAHOO_PASSWORD) }.send_keys(:enter)
puts "Successfully logged in. Navigating to My Team now."
