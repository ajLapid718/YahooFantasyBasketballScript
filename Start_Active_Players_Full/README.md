## Prompts

You will receive prompts when you run this version of the script. The prompts will ask you for the following:

- Yahoo E-Mail Address
- Yahoo Password
- Password Confirmation
- Your Team Name
- Your Opponent's Team Name

The prompts will look like this:

```
Enter your Yahoo e-mail address (example: person123):
Enter your password:
Confirm your password:
Enter the name of your team:
Enter the name of your opponent's team:
```

A valid prompt will end up resembling something along these lines:

```
Enter your Yahoo e-mail address (example: person123): abc321
Enter your password: ********
Confirm your password: ********
Enter the name of your team: Balling on a Budget
Enter the name of your opponent's team: Milk and Cereal
```

## Expected Output

You should see something that resembles the following:

```
DevTools listening...
Currently logging in...
Successfully logged in. Navigating to My Team now.

Currently setting active players from October, 30, 2017 to November, 05, 2017...

Successfully set: You have 8 players who have a game on October, 30, 2017!
6 day[s] left to go!

Successfully set: You have 5 players who have a game on October, 31, 2017!
5 day[s] left to go!

Successfully set: You have 11 players who have a game on November, 01, 2017!
The following players remain on the bench, you may want to review this day:
1) Draymond Green GS - SF,PF,C and he does not have a game
2) DeMarre Carroll Bkn - SF,PF Out and he does not have a game
3) Kawhi Leonard SA - SG,SF Injured and he does not have a game
4 day[s] left to go!

Successfully set: You have 3 players who have a game on November, 02, 2017!
3 day[s] left to go!

Successfully set: You have 11 players who have a game on November, 03, 2017!
The following players remain on the bench, you may want to review this day:
1) Al-Farouq Aminu Por - SF,PF and he does not have a game
2) DeAndre Jordan LAC - C and he does not have a game
3) Eric Bledsoe Pho - PG,SG Out and he is playing against @NY
2 day[s] left to go!

Successfully set: You have 4 players who have a game on November, 04, 2017!
1 day[s] left to go!

Successfully set: You have 9 players who have a game on November, 05, 2017!
0 day[s] left to go!

Your opponent's starts per day from October, 30, 2017 to November, 05, 2017
Your opponent has 10 players who have a game on October, 30, 2017!
Your opponent has 2 players who have a game on October, 31, 2017!
Your opponent has 8 players who have a game on November, 01, 2017!
Your opponent has 4 players who have a game on November, 02, 2017!
Your opponent has 9 players who have a game on November, 03, 2017!
Your opponent has 2 players who have a game on November, 04, 2017!
Your opponent has 11 players who have a game on November, 05, 2017!

Everything is all set for 7 day[s] (including today)!
You have a total of 51 starts and your opponent has a total of 46 starts! Whoa!
This script took 242 seconds to complete!
Goodbye!
```

Today starts Week 3 for Yahoo Fantasy Basketball for my league. In just four minutes, this script helped me out while I closed my eyes for a little bit.

Not only did it set my players for the week, the report also let me know to check on two of the days where I had more than 10 players playing. For the first instance, on November 1st, I did not bother checking it out. The reason for this is because I know I have Isaiah Thomas in the IL spot. Because my program counts all of the players who have a game that day and because all of the players on the bench did not have a game that day, I knew that all my players who could play were already accounted for. For the second instance, on November 3rd, I had to see why Eric Bledsoe was on the bench. At first I thought it had to do with the IL spot again, but that wasn't it. Then I thought that maybe the position slots were actually filled up, but that wasn't the whole story. It turns out the Start Active Players put Kawhi Leonard in the rotation instead of Eric Bledsoe...which is its normal behavior...whatever that behavior may be. Knowing that Kawhi is injured, I decided to manually switch Bledsoe to make sure all affairs were in order. That's the response/reaction I was looking to get from this report and overall I am happy with the way it turned out.

Things get tricky with the IL/IR spot because some leagues will differ in the amount they set and some might not even permit them at all. Similarly, the count of starts is impacted by INJ, GTD, and Out statuses. So the count needs to be offset appropriately depending on your situation. For example, the 51 starts I supposedly have will be reduced heavily since a lot of my players are not healthy at the moment and because I have a player in IL. I imagine that because this script is most useful on Monday as a report-for-the-week type of thing, one solution would be for me to make a different script file altogether for the count_accurate_starts logic. This way, that script can be ran without setting players and that way the procedure is handling one responsibility. The thing is...certain things, specifically, being GTD, would be a very niche thing to select for since it's so dynamic and last-minute at times. I'm a bit iffy though for another reason. Players can get added and dropped at any given moment. This makes the count inherently variable, and a heads-up/overview might be the best case scenario in-practice. In any case, at least I know that in a reality where half my team wasn't injured, I would have had more starts :(

Usually there's a relatively even amount of starts between opponents, so it does raise the question of: "Is all of this necessary?" I'd propose that it can be a difference-maker. It's nice to have a heads-up for that one fateful day where you have 2 players and on that very same day your opponent has 10 players, and vice-versa. That way when you check in throughout the week, you aren't fully surprised by the highs and lows. I would imagine this is especially important during the playoffs where more information is always welcomed.

If you do not find yourself in need of the player report or the player count, or if you are planning to set your roster for longer than a week, you may be better suited running the Lite version of this script.

## There's Always Room for Improvement

Should I import the colorize gem? Hmm...

*"Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away"* - Antoine de Saint-Exupery

Although I have reservations about the term perfection, the sentiment of this quote steers my rationale of the following:

- I could improve upon the exception handling and consider reducing the global default timeout (30 seconds) to speed things up since the code moves on (in practice so far) after being rescued from the timeout error; I could also be more specific about the errors the code should be rescued from
  - This could be achieved with calling `Watir.default_timeout = 10` at the beginning of the script
  - I could specify `rescue Watir::Exception::UnknownObjectException, Timeout::Error`
    - At the moment, after numerous test runs, these additions are unnecessary for the desired functionality

- I could create a folder called `Shared` which can house certain overlapping functionality such as the acquiring user information process, certain instances of navigation and clicking, and some of the logic of some of the loops
  - This could allow `require_relative 'Shared/Foo'` to be called and would apply the DRY (Do-Not-Repeat-Yourself) principle so that if changes needed to be made, I would only need to change one part of the code, et cetera
    - At the moment, I do not see this as urgent for all intents and purposes but I fully understand that it is critical for a maintainable program and that I can't always get away with spaghetti code

- I believe that the semi-pseudo code to adjust the count more accurately might look like:

```ruby
if (browser.table(:id => "statTable0")[15][1].text == "IL") && !(browser.table(:id => "statTable0")[15][4].text.empty?)
  amount_of_starts -= 1
end

if ["Injured", "Out", "GTD"].include?(browser.table(:id => "statTable0")[2..14][2].text)
  amount_of_starts -= 1
end
```

- I could write up a ternary operation so that a user can type into the command line the particular web browser and whether or not they would like to use Google's Incognito Mode or the Headless Chrome feature
  - If a user downloads this repository and wants to springboard off of that idea, the segment of code below could be one approach
    - At the moment, I do not believe that this will be a make-or-break scenario from a user-experience (UX) perspective
```ruby
print "Press and enter the 5 button for incognito mode or any other character for headless mode: "
mode = gets.chomp.to_i
incognito = ["--log-level=3", "--incognito"]
headless = ["--log-level=3", "--headless"]
browser = Watir::Browser.new(:chrome, switches: mode == 5 ? incognito : headless)
```
