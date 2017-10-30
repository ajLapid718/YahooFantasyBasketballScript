def start_browser_session
  @browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --headless])
  Watir.default_timeout = 10
  puts "Opening browser session..."
end

def go_to_yahoo
  begin
    @browser.goto("https://basketball.fantasysports.yahoo.com")
  rescue
    puts "There's been an error with accessing the website. This is a troubling start."
  end
end

def click_on_sign_in
  begin
    @browser.element(:id => 'yucs-profile').click
  rescue
    puts "There's been an error with clicking on the Sign In link. Umm."
  end
end

def enter_email
  puts " "
  puts "Currently logging in..."
  begin
    @browser.tap { |b| b.text_field(:id => 'login-username').set(YAHOO_EMAIL_ADDRESS) }.send_keys(:enter)
  rescue
    puts "Moving on from the e-mail field..."
  end
end

def enter_password
  begin
    @browser.tap { |b| b.text_field(:id => 'login-passwd').set(YAHOO_PASSWORD) }.send_keys(:enter)
  rescue
    puts "Moving on from the password input..."
  end
  puts "Successfully logged in. Navigating to your roster now..."
end

# Invoke Login Process
start_browser_session
go_to_yahoo
click_on_sign_in
enter_email
enter_password
