require 'watir'
require 'highline/import'
require 'csv'

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
  begin
    @browser.element(:id => "yucs-profile").click
  rescue
    puts "Moving on..."
  end
end

def enter_email
  puts " "
  puts "Currently logging in..."
  begin
    @browser.tap { |b| b.text_field(:id => "login-username").set(EMAIL) }.send_keys(:enter)
  rescue
    puts "Moving on..."
  end
end

def enter_password
  begin
    @browser.tap { |b| b.text_field(:id => "login-passwd").set(PASSWORD) }.send_keys(:enter)
  rescue
    puts "Moving on..."
  end
  puts "Successfully logged in. Navigating to the League link now."
end

def click_on_league
  begin
    @browser.a(:text => "League").click
  rescue
    "Moving on..."
  end
  puts "Successfully clicked on the League tab."
end

def initialize_csv
  today = Time.now.strftime("%F")
  @new_spreadsheet = CSV.open("Matchups#{today}.csv", "wb")
  puts "Created a blank spreadsheet file."
end

def generate_report
  matchups = @browser.divs(:class => /^Grid-table Phone-px-med$/)
  amount_of_matchups = matchups.count
  puts "Currently storing values in the spreadsheet..."
  amount_of_matchups.times do |current_matchup|
    matchups[current_matchup].click
    @new_spreadsheet << @browser.tr(:class => /^First Last$/).text.split("\n")
    @new_spreadsheet << @browser.tr(:class => "First").text.split("\n")
    @new_spreadsheet << @browser.tr(:class => /^Alt Last$/).text.split("\n")
    puts "#{(amount_of_matchups) - (current_matchup + 1)} matchups left to go."
    click_on_league
  end
  @new_spreadsheet.close
end

def grab_all_stats
  start_browser_session
  click_on_sign_in
  enter_email
  enter_password
  click_on_league
  initialize_csv
  generate_report
end

def shutdown
  sleep(1)
  puts "Everything is all taken care of!"
  sleep(1)
  puts "Goodbye!"
  sleep(1)
  @browser.close
end

if __FILE__ == $PROGRAM_NAME
  START_TIME = Time.now
  EMAIL = get_email
  PASSWORD = get_password
  grab_all_stats
  shutdown
  puts "Time elapsed: #{(Time.now - START_TIME).to_i} seconds."
end
