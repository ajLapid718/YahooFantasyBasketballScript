## Background

In any fantasy sport, having as much information as possible facilitates opportunities for better decision making. By running this script, ideally on a Monday, an individual will have a spreadsheet containing all of the totals of last week's matchups. Once a new week starts, it's a bit tedious to go to the previous week for each individual matchup. In a twelve team league, you'd have to go to each specific matchup, copy and paste the results, and then repeat that sequence of events five more times. Instead of doing all of that, this script automates the process.

With the collected information, a user can see side-by-side where he or she stands down to the decimal. Specifically, a user can determine how he or she will fare against the current opponent of the week based on a comparison of how his or her team performed last week relative to how his or her opponent performed last week. Another advantage involves the added transparency of the league's needs. Trades can be proposed with pertinent data on hand to make a strong cases. Categories can be analyzed in order to see which teams are focusing on which statistics. All in all, more insight is provided and the user can capitalize on the information as he or she sees fit.

## Prompts

In the terminal, the prompts will inquire about your:

- Yahoo E-Mail/Yahoo Username
- Yahoo Password
- Password Confirmation

***A blank set of the prompts***
```
Enter your Yahoo e-mail address (example: person123):
Enter your password:
Confirm your password:
```

***A set of the prompts with valid input***
```
Enter your Yahoo e-mail address (example: person123): yahooligan123
Enter your password: ********
Confirm your password: ********
```

## Expected Output
```
DevTools listening on...

Opened a browser session with Google Chrome.
Successfully opened Yahoo's Fantasy Basketball website.

Currently typing in your username...
Currently typing in your password...
Successfully logged in. Navigating to the League link now.

Created a blank spreadsheet file.
Currently storing values in the spreadsheet...
Lap 1.
3 matchups left to go.
Lap 2.
2 matchups left to go.
Lap 3.
1 matchups left to go.
Lap 4.
0 matchups left to go.

Everything is all taken care of!
Goodbye!
Time elapsed: 177 seconds.
```
