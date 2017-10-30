def click_on_my_team
  begin
    @browser.element(:class => 'F-link', text: MY_TEAM).click
  rescue
    puts "There's been an error regarding clicking on your team name."
    sleep(1)
    @browser.refresh
    sleep(1)
    retry
  end
end

def bench_roster
  puts " "
  puts "Currently benching all players for #{Time.now.strftime("%B, %d, %Y")}"
  10.times do |i|
    player_row = @browser.table(:id => "statTable0")[i+2][2]
    player_name, player_condition = player_row.split("\n").join(" ")
    next if player_name.text == "(Empty)"
    puts "Currently putting #{player_name} on the bench!"
    sleep(3)
    player_row.click
    sleep(3)
    bottom_row = @browser.elements(:css => "tr[data-pos='BN']").last
    if bottom_row.text.include?("Empty")
      bottom_row.click
      if player_condition.nil?
        puts "Success! By the way, he has a player condition of: Healthy and Available"
      else
        puts "Success! By the way, he has a player condition of: #{player_condition}"
      end
    else
      puts "Sorry, #{player_name} is either playing already or has finished playing for the day!"
    end
  end
end

# Invoke Bench All Players Functionality
click_on_my_team
bench_roster
