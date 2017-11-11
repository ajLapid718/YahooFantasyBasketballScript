require 'watir'
require 'highline/import'

def get_email
  print "Enter your Yahoo e-mail address (example: person123): "
  return gets.chomp
end

def get_password
  begin
    yahoo_password = ask("Enter your password: ") { |q| q.echo = "*" }
    password_confirmation = ask("Confirm your password: ") { |q| q.echo = "*" }
    if yahoo_password == password_confirmation
      return yahoo_password
    else
      raise Exception.new("Your passwords do not match. Try again.")
    end
  rescue Exception => error_msg
    puts error_msg
    retry
  end
end

def start_browser_session
  @browser = Watir::Browser.start("https://basketball.fantasysports.yahoo.com", :chrome, switches: %w[--log-level=3 --headless])
  Watir.default_timeout = 10
  puts "Successfully opened to Yahoo Fantasy Basketball's website."
end

def click_on_sign_in
end

def enter_email
end

def enter_password
end

def click_on_league
end

def generate_report
end

def shutdown
end

def grab_all_stats
end

if __FILE__ == $PROGRAM_NAME
  EMAIL = get_email
  PASSWORD = get_password
  grab_all_stats
end
