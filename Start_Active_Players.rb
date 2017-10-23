# Import the watir gem/library...formerly known as 'watir-webdriver'
require 'watir'

# Opens the Google Chrome Web Browser
browser = Watir::Browser.new :chrome

# Goes to Web Address
browser.goto("https://basketball.fantasysports.yahoo.com")

# Clicks on Sign In
browser.element(:id => 'yucs-profile').click

# Types in Email Address
browser.text_field(:id => 'login-username').set("YOUR_EMAIL_ADDRESS")

# Clicks on Next
browser.element(:id => 'login-signin').click

# Types in Password
browser.text_field(:id => 'login-passwd').set("YOUR_PASSWORD")

# Clicks on Sign In
browser.element(:id => 'login-signin').click

# Click on My Team
browser.element(:class => 'F-link', text: /^YOUR_TEAM_NAME$/).click

# Set Active Players for X Amount of Days (Default is 7)
number_of_days = 7
number_of_days.times do
	browser.element(:class => ["Btn", "Btn-short", "Btn-primary", "Mend-med"], text: /^Start Active Players$/).click
	browser.element(:class => "Js-next").click
end
# Hey
# Sleep. Quit. Exit. Boom.
