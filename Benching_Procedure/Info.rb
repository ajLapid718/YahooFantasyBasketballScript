print "Enter your Yahoo e-mail address (example: person123): "
YAHOO_EMAIL_ADDRESS = gets.chomp

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

YAHOO_PASSWORD = get_password

print "Enter the name of your team: "
MY_TEAM = gets.chomp
