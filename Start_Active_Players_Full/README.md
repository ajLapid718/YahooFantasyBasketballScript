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

## There's Always Room for Improvement

*"Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away"* - Antoine de Saint-Exupery

Although I have reservations about the term perfection, the sentiment of this quote steers my rationale of the following:

- I could improve upon the exception handling and consider reducing the global default timeout (30 seconds) to speed things up since the code moves on (in practice so far) after being rescued from the timeout error; I could also be more specific about the errors the code should be rescued from
  - This could be achieved with calling `Watir.default_timeout = 10` at the beginning of the script
  - I could specify `rescue Watir::Exception::UnknownObjectException, Timeout::Error`
    - At the moment, after numerous test runs, these additions are unnecessary for the desired functionality

- I could create a folder called `Shared` which can house certain overlapping functionality such as the acquiring user information process, certain instances of navigation and clicking, and some of the logic of some of the loops
  - This could allow `require_relative 'Shared/Foo'` to be called and would apply the DRY (Do-Not-Repeat-Yourself) principle so that if changes needed to be made, I would only need to change one part of the code, et cetera
    - At the moment, I do not see this as urgent for all intents and purposes but I fully understand that it is critical for a maintainable program and that I can't always get away with spaghetti code

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
