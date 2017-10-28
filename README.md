## Navigation

Jump To: [Preface](https://github.com/ajLapid718/YahooFantasyBasketballScript#preface)

Jump To: [Introduction](https://github.com/ajLapid718/YahooFantasyBasketballScript#introduction)

Jump To: [Functionality](https://github.com/ajLapid718/YahooFantasyBasketballScript#step-by-step-functionality-summarized)

Jump To: [Configuration](https://github.com/ajLapid718/YahooFantasyBasketballScript#from-configuration-to-implementation)

Jump To: [Thoughts](https://github.com/ajLapid718/YahooFantasyBasketballScript#final-thoughts-and-things-to-consider)

Jump To: [Potential Improvements](https://github.com/ajLapid718/YahooFantasyBasketballScript#possible-areas-with-room-for-improvement)

## Preface

**Word Count**: ~2050

**Estimated Amount of Time to Read**: ~15 minutes

**From Square One to Running the Program**: ~Not too long

Hello! You have found your way through the universe and stumbled upon GitHub at this point in time, specifically my GitHub profile so-to-speak. Welcome to my repository that houses three of my Yahoo Fantasy Basketball automation script files written in Ruby. You are currently reading the primary README file, the one with the markdown file extension. Any folder that has README gets this fancy little spot at the bottom of the folder. If you click on the README.md file above, you will have this information, but because you are directly in the file and not at the folder level, you will not see those files above it. This is a cool, safe space.

Normally, a README file is suggested to include details about one's environment configuration in order to properly get the contents of the repository up and running. Some things that are suggested by default are: Ruby version, system dependencies, configuration, database creation, database initialization, how to run the test suite, services (job queues, cache servers, search engines, etc.), deployment instructions. This README will not be normal.

I vividly remember how overwhelmingly lost I was when I wanted to run a program from GitHub on my personal computer...this time last year (the current date: October 2017). In light of that, I will make my best attempt to cover those bases in a way where I make little to no assumptions about what you may or may not know. In other words, I will make an effort to be as detailed and verbose as possible.

**The Ideal Outcome**: You successfully set up the necessary components for your personal computer and can interact with your Yahoo Fantasy Basketball roster in real-time as described. Hopefully this also succeeds in giving you ideas to explore programming and/or automate other things on your web browser or in general! Let's get to it.

## Introduction

I love sports and I'm an especially huge fan of basketball. For the 2015-2016 NBA season, my family-friends and I decided to participate in Fantasy Basketball via Yahoo. I was also thrown into a second league with my friends from college. After getting a full experience of fantasy basketball, I took the 2016-2017 season off. Recently, my good friends wanted to do fantasy basketball for the 2017-2018 season.

This is my first time participating in Yahoo Fantasy basketball with somewhat of a budding background in coding. I started to see things differently and I also started to explore certain things with the Google Chrome Inspector Tools. I noticed details about how the page was loading...things of that nature...that I could previously describe on a higher-level, but now I have a clearer idea of what is going on behind the curtain.

Combining my curiosity with my friend who guided me through the concept of automation, the idea of these three automation scripts was incepted. The grind to build them began, but it was more fun and less frustrating because I got really into it.

**How Things Look Like On My End**: Because my computer environment is all set already, all I have to do is open my command line, navigate to the proper directory, type in `ruby 'Start_Active_Players.rb'` or `ruby 'Bench_All_Players'`, and send the enter keystroke to it.

**In Other Words**: I downloaded the necessary files, have the necessary programs, open the command prompt, journey through the folders via the command prompt, type in what I type in, and press the enter button. Then the script is executed and the magic happens. What was once done manually, can now be done with hands-free automation. I will try to explain things with simplicity in mind.

**The Result**: The script, using the ChromeDriver file you'll need to install, acts on my behalf! It will actually result in logging into my Yahoo account, submitting my e-mail address and password, and hit the Start Active Players button as well as the Next Day arrow icon. If you are using the Incognito Mode option in the script file, you can actually witness this happening step by step! If you are using the Headless Mode option in the script file, the ChromeDriver will do this without you seeing anything! It's awesome and amazing. Depending on which script is being used, you will either have your active players started for a certain period of time, bench all your players, and additional features (in the Full Version). In the Full Version, you can discover the amount of starts both your team and your opponent's team has each day and for the week. In the event that you have more than 10 players who have a game for that day, the script will tell you in the command line who is on the bench after it has started the active players.

## Step By Step Functionality Summarized

***Please refer to the README.md file in the Start_Active_Players_Lite folder for a more detailed breakdown***

1. Opens a web browser session
2. Maximizes the web browser window
3. Goes to the Yahoo Fantasy Basketball website
4. Clicks on sign in
5. Fills out your e-mail address
6. Submits your e-mail address
7. Fills out your password
8. Submits your password
9. Navigates to My Team
10. Clicks on the "Start Active Players" button
11. Clicks on the "Next Day" arrow icon
12. Repeats both Step 10 and Step 11 until the desired amount of days are covered and handled
  - If you are running `ruby Start_Active_Players_Full.rb`, then more features are involved
    - 12a) From here, navigates to your opponent's team
    - 12b). Counts the amount of players who have a game on that day
    - 12c). Clicks the "Next Day" arrow icon
    - 12d). Repeats the previous two steps
    - 12e). Reports information to you
13. Closes the browser session

## From Configuration to Implementation!

- **My Ruby Version**: Ruby 2.3.3 (enter the command `ruby 'ruby -v'` in your command line to determine which version you have)
  - You can go to Google and download Ruby with RubyInstaller for Windows! The instructions are clear and concise!
- **My Operating System**: Windows 10
  - You can most likely run these scripts on other Operating Systems as well (Mac OS X, Ubuntu, etc.)!
- **My Preferred Web Browser**: Google Chrome
  - The source code (fancy way of saying the contents of the files) uses Chrome, but you can edit it to use Firefox or Internet Explorer, too!
- **My Preferred Text Editor**: Atom
  - This text editor has a user-friendly download process and will help you organize and view the code!
  - A text editor is sort of like the Microsoft Word for lines of code!
  - With that analogy in mind, GitHub is like a public Google Docs or Google Drive!
- **My Watir Version**: 6.8.4
  - Enter the command `gem install watir` to add this gem/library to your computer!
  - Certain operations are deprecated (no longer supported) in older versions, so this is important!
- **My Watir-Webdriver Version**: 0.9.9
  - This is the engine which makes direct calls to the browser. This gets things going!
- **My Terminal**: Git Shell/Windows Power Shell
  - User-friendly tailored command line, but it can be unnecessary for your purposes!
- **My PATH**:
  - Put chromedriver.exe into your Local Disc (C:)!
  - Check out the YouTube videos for installing chromedriver by DevNami or Artur Spirin!
  - If all else fails, be sure to check out the "Getting Started" section of Google's ChromeDriver support page
- **My Highline Version**: 1.7.8
  - This is necessary for the Full Version to operate properly!
  - The command for this is `gem install highline`, and feel free to check out their GitHub!
  - This allows you to type your password into the command line with asterisks replacing each character!

Let's do a quick recap. First, you'll need to download Ruby onto your computer. This will give you the ability to interact with the programming language and the scripts. Your computer needs to be able to know what language you're talking to it in.

Second, you'll need to install the Watir gem with your command line. Ruby has some gems and libraries loaded up already, but the default setup does not include some gems or libraries. This is the reason why we need to install Watir individually. This is also the same reason why you'll need to install Highline individually.

Following that, you will need to do a couple of `cd` commands in your command line and journey through to the folder that has the scripts you may have downloaded from this repository. A quick tutorial could probably get you up to speed. Try to put the folder in your Desktop as opposed to your Downloads; this might make things more intuitive.

Inevitably, you will type in one of the three commands to run the script of your choice: `ruby 'Start_Them.rb'`, `ruby 'Start_Active_Players.rb'`, or `ruby 'Bench_All_Players.rb'`.

## Final Thoughts and Things to Consider

Check out the `README.md` in `Start_Active_Players_Lite` before reading this section! All of this might seem like a lot of work, but now you're more familiar with a little bit of the ins-and-outs of script files, environment setup, and programming. Yes, yes, yes...you can also set up your lineup for the week or bench your players for the day as well as get a mini-report about your opponent's amount of starts for the week...but you've become a part of the community. Whether you are someone deciding to study computer science, computer engineering, software engineering or if you are someone who wants to use the script in a one-and-done manner, you now have a clearer idea of what programmers potentially work with. As I've been told many times, it is important to know where to look and what to ask. In light of that, don't hesitate to use your flavor of search engine (Google, Bing, Quora) to come across answers to questions you may have. Word of advice, please check out StackOverflow as well.

By the way, if you take a look at the actual source code (lines of code in the scripts), you can probably figure out what most of the code is doing. Ruby is generally known for being semantic (readable) and was designed with being as close to English statements as possible. Once you sift through all of the vocabulary (what), find reliable sources of information (who), develop intuition for what goes where (where), get to know rationales for certain designs and principles (why), and keep in mind that there's a time and place for everything (when)...then you'll ride up the learning curve fairly quickly! Patience and confidence helps, too...just like anything else. At the root of it, that's what I'm trying to express: coding is like learning how to learn and is a lot like things you may have had too learn before. Just like any language, there's the read-write-speak domains with separate but related perspectives. Use analogies...use metaphors...use whatever is necessary.

Now if you know you'll be busy or if you anticipate being on vacation for a while, you can run this script so that your active players are on board. Maybe you can just draft all 13 players and set your lineup for the rest of the year...that'd be interesting. In any case, I hope this helps you on your journey, despite how lengthy it turned out to be. On one final note, I like to believe that lightweight automation is not necessarily meant to be faster or better than what a person can do. The primary point is for the tasks to be done by the computer and not by the person for any reason the user justifies. It's nice to have optimized speeds, but the main intent is just to get the job done on your behalf. Other than that, take care.

Best,

Allan James Lapid

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
