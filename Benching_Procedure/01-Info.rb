def get_email
  print "Enter your Yahoo e-mail address (example: person123): "
  return gets.chomp
end

def get_password
  begin
    yahoo_password = ask("Enter your password: ") { |q| q.echo = "*" }
    password_confirmation_attempt = ask("Confirm your password: ") { |q| q.echo = "*" }
    if yahoo_password == password_confirmation_attempt
      return yahoo_password
    else
      raise Exception.new("Your passwords do not match. Try again.")
    end
  rescue Exception => error_message
    puts "#{error_message}"
    retry
  end
end

def get_team_name
  print "Enter the name of your team: "
  return gets.chomp
end

# Invoke the Acquiring Information Process
YAHOO_EMAIL_ADDRESS = get_email
YAHOO_PASSWORD = get_password
MY_TEAM = get_team_name
