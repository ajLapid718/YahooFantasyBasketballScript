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
    player_name = @browser.table(:id => "statTable0")[i+2][2]
    next if player_name.text == "(Empty)"
    puts "Currently putting #{player_name.text} on the bench!"
    sleep(3)
    player_name.click
    sleep(3)
    @browser.elements(:css, "tr[data-pos='BN']").last.click
  end
end

# Invoke Bench All Players Functionality
click_on_my_team
bench_roster
