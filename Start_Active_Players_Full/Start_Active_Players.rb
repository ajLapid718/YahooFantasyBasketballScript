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
print "Enter the name of your opponent's team: "
TEAM_NAME_OF_YOUR_OPPONENT = gets.chomp

browser = Watir::Browser.new(:chrome, switches: %w[--log-level=3 --headless])
Watir.default_timeout = 5
begin
  browser.goto("https://basketball.fantasysports.yahoo.com")
rescue
  puts "There's been an error regarding accessing the website. This is a troubling start."
end

begin
  browser.element(:id => 'yucs-profile').click
rescue
  puts "There's been an error regarding clicking on the Sign In link. Moving on..."
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
number_of_days = 7
your_amount_of_starts = 0
puts "Currently setting active players from #{Time.now.strftime("%B, %d, %Y")} to #{(DateTime.now + (number_of_days-1)).strftime("%B, %d, %Y")}"
number_of_days.times do |counter|
  amount_of_starts = browser.as(:target => "sports").size
  sleep(2)
  puts " "
  puts "Successfully set: You have #{amount_of_starts} players who have a game on #{(DateTime.now + counter).strftime("%B, %d, %Y")}!"
  begin
    browser.element(:class => ["Btn", "Btn-short", "Btn-primary", "Mend-med"], text: /^Start Active Players$/).click
  rescue
    puts "Moving on..."
  end

  if amount_of_starts >= 11
    puts "The following players remain on the bench, you may want to review this day: "
    a, b = [browser.table(:id => "statTable0")[12][2].text.split("\n").join(" "), browser.table(:id => "statTable0")[12][4].text]
    c, d = [browser.table(:id => "statTable0")[13][2].text.split("\n").join(" "), browser.table(:id => "statTable0")[13][4].text]
    e, f = [browser.table(:id => "statTable0")[14][2].text.split("\n").join(" "), browser.table(:id => "statTable0")[14][4].text]
    puts "1) #{a} and he #{b.empty? ? "does not have a game" : "is playing against #{b}"}"
    puts "2) #{c} and he #{d.empty? ? "does not have a game" : "is playing against #{d}"}"
    puts "3) #{e} and he #{f.empty? ? "does not have a game" : "is playing against #{f}"}"
  end

  begin
    browser.element(:class => "Js-next").click
  rescue
    "Moving on..."
  end

  puts "#{number_of_days - (counter + 1)} day[s] left to go!"
  your_amount_of_starts += amount_of_starts
end

begin
  browser.a(text: /^Basketball '17$/).click
rescue
  puts "Could not find Matchups or a timeout happened. Will refresh and try again!"
  sleep(1)
  browser.refresh
  sleep(1)
  retry
end

begin
  browser.element(:class => 'F-link', text: TEAM_NAME_OF_YOUR_OPPONENT).click
rescue
  puts "Can not find the opponent's team name. Will refresh and try again!"
  sleep(1)
  browser.refresh
  sleep(1)
  retry
end

puts " "
number_of_days = 7
their_amount_of_starts = 0
puts "Your opponent's starts per day from #{Time.now.strftime("%B, %d, %Y")} to #{(DateTime.now + (number_of_days-1)).strftime("%B, %d, %Y")}"
number_of_days.times do |counter|
  amount_of_starts = browser.as(:target => "sports").size
  puts "Your opponent has #{amount_of_starts} players who have a game on #{(DateTime.now + counter).strftime("%B, %d, %Y")}!"
  begin
    browser.element(:class => "Js-next").click
  rescue
    puts "Moving on..."
  end
  their_amount_of_starts += amount_of_starts
  sleep(2)
end

sleep(1)
puts " "
sleep(1)
puts "Everything is all set for #{number_of_days} day[s] (including today)!"
sleep(1)
puts "You have a total of #{your_amount_of_starts} starts and your opponent has a total of #{their_amount_of_starts} starts! Whoa!"
sleep(1)
puts "This script took #{(Time.now - START_TIME).to_i} seconds to complete!"
sleep(1)
puts "Goodbye!"
sleep(1)
browser.close
