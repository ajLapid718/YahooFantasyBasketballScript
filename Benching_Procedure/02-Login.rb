def start_browser_session
  @browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --headless])
end

def go_to_yahoo
  begin
    @browser.goto("https://basketball.fantasysports.yahoo.com")
  rescue
    puts "There's been an error with accessing the website. This is a troubling start."
  end
end

def click_on_profile
  begin
    @browser.element(:id => 'yucs-profile').click
  rescue
    puts "There's been an error with clicking on the Sign In link. Will refresh and try again!"
    sleep(1)
    @browser.refresh
    sleep(1)
    retry
  end
end

def log_user
  puts " "
  puts "Currently logging in..."
  @browser.tap { |b| b.text_field(:id => 'login-username').set(YAHOO_EMAIL_ADDRESS) }.send_keys(:enter)
  @browser.tap { |b| b.text_field(:id => 'login-passwd').set(YAHOO_PASSWORD) }.send_keys(:enter)
  puts "Successfully logged in. Navigating to My Team now."
end

# Invoke Login Process
start_browser_session
go_to_yahoo
click_on_profile
log_user
