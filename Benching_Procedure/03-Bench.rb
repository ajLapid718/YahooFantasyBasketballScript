def click_on_my_team
  begin
    @browser.element(:class => 'F-link', text: MY_TEAM).click
  rescue
    puts "There's been an error regarding clicking on your team name. Err."
  end
end

def bench_roster
  puts " "
  puts "Currently benching all players for #{Time.now.strftime("%B, %d, %Y")}"
  10.times do |i|
    player_row = @browser.table(:id => "statTable0")[i+2][2]
    player_name, player_condition = player_row.text.split("\n")
    next if player_name == "(Empty)"
    puts " "
    puts "Attempting to put #{player_name} on the bench!"
    sleep(3)
    player_row.click
    sleep(3)
    bottom_row = @browser.elements(:css => "tr[data-pos='BN']").last
    player_condition.nil? ? player_condition = "Healthy" : player_condition = "#{player_condition}"
    if bottom_row.text.include?("Empty")
      bottom_row.click
      if player_condition == "Healthy"
        puts "Success! By the way, he has a player condition of: Healthy"
      else
        puts "Success! By the way, he has a player condition of: #{player_condition}"
      end
    else
      puts "Sorry, #{player_name} is already locked in for his game and for the day!"
      puts "Reminder: he is #{player_condition}!"
    end
  end
end

# Invoke Bench All Players Functionality
click_on_my_team
bench_roster
