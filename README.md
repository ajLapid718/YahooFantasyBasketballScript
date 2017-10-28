## Preface

Hello! You have found your way through the universe and stumbled upon GitHub at this point in time, specifically my GitHub profile so-to-speak. Welcome to my repository that houses three of my Yahoo Fantasy Basketball automation script files written in Ruby. You are currently reading the primary README file, the one with the markdown file extension.

Normally, a README file is suggested to include details about one's environment configuration in order to properly get the contents of the repository up and running. Some things that are suggested by default are: Ruby version, system dependencies, configuration, database creation, database initialization, how to run the test suite, services (job queues, cache servers, search engines, etc.), deployment instructions.

I vividly remember how overwhelmingly lost I was when I wanted to run a program from GitHub on my personal computer...this time last year (the current date: October 2017). In light of that, I will make my best attempt to cover those bases in a way where I make little to no assumptions about what you may or may not know. In other words, I will make an effort to be as detailed and verbose as possible.

**The ideal scenario**: You successfully set up the necessary components for your personal computer and can interact with your Yahoo Fantasy Basketball roster in real-time. Hopefully this also succeeds in giving you ideas to explore programming and/or automate other things on your web browser or in general! Let's get to it.

## Step By Step Functionality

1. Opens a web browser session
2. Maximizes the web browser window
3. Goes to the Yahoo Fantasy Basketball website
4. Clicks on sign in
5. Fills out your e-mail address
6. Submits your e-mail address
7. Fills out your password
8. Submits your password
9. Navigates to My Team
10. Clicks on the "start active players" button
11. Clicks on the "next day" arrow
12. Repeats step 10 and step 11 until the desired amount of days are covered and handled
13. Closes the browser session

## From Configuration to Implementation

- To be continued...
- Type in `ruby "Start_Active_Players.rb"` in your terminal and press enter
- ...to be continued

## Possible Areas With Room for Improvement

- I could improve upon the exception handling and consider reducing the global default timeout (30 seconds) to speed things up since the code moves on (in practice so far) after being rescued from the timeout error; I could also be more specific about the errors the code should be rescued from
  - This could be achieved with calling `Watir.default_timeout = 10` at the beginning of the script
  - I could specify `rescue Watir::Exception::UnknownObjectException, Timeout::Error`
    - At the moment, after numerous test runs, these additions are unnecessary for the desired functionality

- I could create a folder called `Shared` which can house certain overlapping functionality such as the acquiring user information process, certain instances of navigation and clicking, and some of the logic of some of the loops
  - This could allow `require_relative 'Shared/Foo'` to be called and would apply the DRY (Do-Not-Repeat-Yourself) principle so that if changes needed to be made, I would only need to change one part of the code, et cetera
    - At the moment, I do not see this as urgent for all intents and purposes but I fully understand that it is critical for a maintainable program and that I can't always get away with spaghetti code

- I could write up a ternary operation so that a user can type into the command line the particular web browser and whether or not they would like to use Google's Incognito Mode or the Headless Chrome feature
  - If a user downloads this repository and wants to springboard off of that idea, the following segment of code could be one approach:

```ruby
print "Press and enter the 5 button for incognito mode or any other character for headless mode: "
mode = gets.chomp.to_i
incognito = ["--log-level=3", "--incognito"]
headless = ["--log-level=3", "--headless"]
browser = Watir::Browser.new(:chrome, switches: mode == 5 ? incognito : headless)
```
