# Opens the Google Chrome Web Browser
browser = Watir::Browser.new :chrome

# Goes to Web Address
browser.goto("https://basketball.fantasysports.yahoo.com")

# Clicks on Sign In
browser.element(:id => 'yucs-profile').click

# Types in Email Address
browser.text_field(:id => 'login-username').set("TYPE_IN_YAHOO_EMAIL_HERE")

# Clicks on Next
browser.element(:id => 'login-signin').click

# Types in Password
browser.text_field(:id => 'login-passwd').set("TYPE_IN_PASSWORD_HERE")

# Clicks on Sign In
browser.element(:id => 'login-signin').click

# Click on My Team
browser.div(text: /My Team/).click

# Click on Start Active Players
browser.div(text: /Start Active Players/).click