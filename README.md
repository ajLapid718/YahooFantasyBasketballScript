# Yahoo Fantasy Basketball

##### Step By Step Functionality

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

##### From Configuration to Implementation

- To be continued...
- Type in `ruby "Start_Active_Players.rb"` in your terminal and press enter
- ...to be continued

##### Three Potential Things That Need Improvement

- I could improve upon the exception handling and consider reducing the global default timeout (30 seconds) to speed things up since the code moves on after being rescued from the timeout error
  - This could be achieved with calling `Watir.default_timeout = 10` at the beginning of the script
- I could create a folder called `Shared` which can house certain overlapping functionality such as the acquiring user information process, certain instances of navigation and clicking, and some of the logic of some of the loops
  - This would allow `require_relative 'Shared/Foo'` to be called and would apply the DRY principle
- I could combine string interpolation and a ternary operation so that a user can type into the command line if they would like to use a particular web browser and whether or not they would like to use Google's Incognito Mode or the Headless Chrome feature
  - The following code could be an option to approach this.
  - ```ruby
  print "Press and enter the 5 button for incognito mode or any other character for headless mode: "
  mode = gets.chomp.to_i
  incognito = ["--log-level=3", "--incognito"]
  headless = ["--log-level=3", "--headless"]
  browser = Watir::Browser.new(:chrome, switches: mode == 5 ? incognito : headless)
  ```
