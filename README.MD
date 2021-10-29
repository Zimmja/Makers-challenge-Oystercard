# Oystercard Challenge :credit_card:

Task from Week 2 on the Makers bootcamp. This task was completed daily during pair-programming sessions with a new partner daily.

Day 1 partner --> [Ginny Thomas](https://github.com/ginnyamazed) - Challenges 1 to 7 completed. We paired using the driver-navigator technique to push-pull commits to our own machines as we took turns. I also felt that we took our time to carefully read, digest and discuss the requirements of each challenge extensively which made writing the tests and the code go smoothly.

Day 2 partner --> [Andy Bird](https://github.com/Andybird88) - Challenges 8 to 11 completed. Andy and I paired together on Day 2 after our respective allocated pairing parters were unavailable due to having prior commitments. We paired using the driver-navigator technique to push-pull commits to our own machines as we took turns. We took the time to plan each challenge and clearly communicated our thoughts to one another before agreeing on how to proceed.

Day 3 partner --> [Dylan James](https://github.com/DylanRJ) - Challenges 11 to 12 completed, challenge 13 in progress. We paired using the driver-navigator technique to push-pull commits to our own machines as we took turns. We took our time once again to make sure we digested the information set out in the user stories before starting to write the code. This planning helped us write succinct code.

## About the task

This week's challenge went back over the basics we covered last week in [Boris Bikes](https://github.com/RPGrimes/Boris_Bikes), giving us the chance to reinforce what we learned last week. We were then challenged to build a more complex system which should really stretch your skills in Ruby, TDD and object-oriented design.

## Challenges
#### Challenge 1 - Create Gemfile
**Learning Objectives covered**
- Construct a valid Gemfile  :white_check_mark:
- Specify a correct source for gems :white_check_mark:
- Specify the latest Ruby version :white_check_mark:
- Add the `rspec` gem to 'test' and 'development' groups :white_check_mark:
- Commit only this Gemfile :white_check_mark:

#### Challenge 2 - Create RSpec Conventional Files
**Learning Objectives covered**
- Generate conventional files (helper and config) for an RSpec project using a command-line option of the rspec executable file :white_check_mark:
- Follow RSpec naming convention for files and folders :white_check_mark:
- Create a test file for the Oystercard class without any tests but with a `describe` block (doesn't exist yet) :white_check_mark:

#### Challenge 3 - Learn Debugging Basics
**Learning Objectives covered**
- Write down the tyoe of error in the issue comments :white_check_mark:
- Write down the file path where the error happened :white_check_mark:
- Write down the line number of the error :white_check_mark:
- Use the Ruby Documentation to find out what the error means :white_check_mark:
- Suggest one way of solving the error :white_check_mark:

#### Challenge 4 - Add the Balance
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Create a unit test for the `Oystercard` class :white_check_mark:
- Write a failing test that checks that a new card has a `balance` :white_check_mark:
- Write code that will make this test pass :white_check_mark:
- Now refactor by setting the balance in `initialize` using an instance variable :white_check_mark:
- Remove the balance method entirely and replace with an `attr_reader` :white_check_mark:

#### Challenge 5 - Enable 'top up' Functionality
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Write a test for the `.top_up` method :white_check_mark:
- Make sure the test fails before implementing the method :white_check_mark:
- Implement the method to make the test pass :white_check_mark:

#### Challenge 6 - Enforce Maximum Balance
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Write a test that checks the `.top_up` method throws an exception if the new balance would exceed the limit :white_check_mark:
- Use a constant to store the limit :white_check_mark:
- Implement the limit in the `.top_up` method. Use an inline `if` statement to check if the limit would be exceeded :white_check_mark:
- Make the error message include the limit value :white_check_mark:
- Use interpolation to keep your code DRY :white_check_mark:

#### Challenge 7 - Deduct the Money
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Write a test for the `deduct method, see it fail :white_check_mark:
- Implement the method, see the test pass :white_check_mark:

**Self-imposed stretch tasks**
- Enforce minimum balance. We wrote a test that checks the `.deduct` method throws an exception if the new balance would fall below a set minimum value. We set a `MIN_BALANCE` default value of `0` to prevent the `Oystercard` from going into a negative balance. Upon initializing `@min_balance` was created with a user input value to potentially allow an overdraft feature to be added in the future. If no value for `@min_balance` was stated, it defaulted to a value of `0` :sunglasses:

#### Challenge 8 - Add touch in/out Support
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Write tests for `in_journey?`, touch_in and touch_out :white_check_mark:
- Write implementation of these methods that will make the tests pass :white_check_mark:
- Use an instance variable to track whether the card is in use :white_check_mark:
- Use an RSpec predicate matcher to check if the card is in use :white_check_mark:
- Use boolean values to store the state of the card :white_check_mark:

#### Challenge 9 - Checking Minimum Balance on touch in
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Write a test that checks that an error is thrown if a card with insufficient balance is touched in :white_check_mark:
- Write the implementation :white_check_mark:
- Update existing tests, if necessary, to make sure they still pass :white_check_mark:
- Refactor to remove any magic numbers and replace with a constant :white_check_mark:

#### Challenge 10 - Charging for the Journey
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Write a test that uses `expect {}.to change{}.by()` syntax to check that a charge is made on touch out :white_check_mark:
- Update the touch_out method to make the test pass :white_check_mark:
- Make `'#deduct'` a private method :white_check_mark:
- Keep the code DRY :white_check_mark:

#### Challenge 11 - Saving the Entry Station
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Using a double, write a test that expects the card to remember the entry station after the touch in :white_check_mark:
- Update the `touch_in` method to accept the entry station :white_check_mark:
- Update existing tests to pass a station to the `touch_in` method - you may need to declare your double in a `let` statement at the top of your describe block :white_check_mark:
- Expose `entry_station` instance variable using an attribute reader :white_check_mark:
- Make the card forget the entry station on touch out by setting it to `nil` :white_check_mark:
- When your tests are all green, refactor to remove the `in_journey` variable. Rewrite the `in_journey?` method to infer its status based on whether or not there is an entry station :white_check_mark:

#### Challenge 12 - Adding Journey History
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Store the list of journeys as an instance variable and expose it with an attribute reader - you will need to refactor the touch_out method to accept an exit station :white_check_mark:
- Use a hash to store one journey (set of an entry and exit stations) :white_check_mark:
- Write a test that checks that the card has an empty list of journeys by default :white_check_mark:
- Write a test that checks that touching in and out creates one journey :white_check_mark:
- Keep all code including tests DRY :white_check_mark:

#### Challenge 13 - Creating the Station Class
**Learning Objectives covered**
- Write up a plan for how you will interact with your code and manually test in IRB :white_check_mark:
- Test drive the creation of a Station class that exposes a name and a zone variable :hourglass_flowing_sand: *in progress*
- Use only one expectation per test :hourglass_flowing_sand: *in progress*

## Reminder of this week's goals from the [Week Outlines](https://github.com/makersacademy/course/blob/main/week_outlines.md)

By the end of the week all developers can:

* Use all of week 1's skills (don't underestimate the importance of this)
* Break one class into two classes that work together, while maintaining test coverage
* Unit test classes in isolation using mocking
* Explain some basic OO principles and tie them to high level concerns (e.g. ease of change)
* Review another person's code and give them meaningful feedback

Start attending [process workshops](https://github.com/makersacademy/skills-workshops/tree/main/process_review) to focus on your developer process. Anyone from any cohort ever can attend.

Attending process workshop will help you improve your processes, which in turn makes you a better developer and more prepared for reviews and interviews.

### Wider course goals this week should help with (see all [course goals here](https://github.com/makersacademy/course/blob/main/goals/course_goals.md)):

<dl>
  <dt>I write code that is easy to change</dt>
  <dd>Writing easy to change software is highly prized amongst developers and employers. By developers because most of a developer's time is spent changing software. By employers because their teams can deliver value to customers faster.</dd>
  <dt>I can test-drive my code</dt>
  <dd>Tested software is easier to change because you can tell when it's broken just by running a command, even the tricky edge cases.</dd>
  <dt>I can build with objects</dt>
  <dd>Most code in the world is structured in small pieces called objects. This is done because it is easier to change than having everything in one place.</dd>
</dl>

## Weekly challenge user stories

Here are the user stories you will be working on for this project:

```
1)
In order to use public transport
As a customer
I want money on my card

Class: card & ?? Money
Noun(s): money & card ; Verb: on (balance)
method: balance

2)
In order to keep using public transport
As a customer
I want to add money to my card

class: card
Nouns: money & card.  Verb: add
method: card.add (money)

3)
In order to protect my money
As a customer
I don't want to put too much money on my card

Class: card
Nouns: money & card.  Verb: to put
method: card.limit (money)

4)
In order to pay for my journey
As a customer
I need my fare deducted from my card

Class: journey
Nouns: fare & card.  Verb: deducted
method journey.fare.deduct (balance - fare)

5)
In order to get through the barriers
As a customer
I need to touch in and out

Class: station  or journey with 2 barrier methods.  Class: card
Noun: I   Verb: to touch
method(s): touch in 
touch out

6)
In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

Class: journey
Noun: journey, balance.  Verb: to have
method: check balance >= fare

7)
In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

Class: journey
noun: journey.  Verb: to pay
method: balance.pay (balance - fare)

8)
In order to pay for my journey
As a customer
I need to know where I've travelled from

class: Station   
noun: I  verb: travelled from
method: station.origin (based on touch_in)

9)
In order to know where I have been
As a customer
I want to see to all my previous trips

class: journey
noun: I, trips  Verb: see
method: journey.view_trips

10)
In order to know how far I have travelled
As a customer
I want to know what zone a station is in

Class: station
Noun: I, zone, station.  Verb to know
method: station.zone (based on touch in?)

11)
In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

class: card, ?station (based on touch in / touch out methods)
noun: charge, I.  Verb: deducted, to touch
method: card.penalty

12)
In order to be charged the correct amount
As a customer
I need to have the correct fare calculated

Class: journey
noun: fare.  Verb: calculated
Method: Journey.calculate_fare

```

## Set up the project:

  1. [Create a Gemfile](01_create_gemfile.md)
  2. [Create RSpec conventional files](02_initialize_rspec.md)
  3. [Review debugging basics](03_debugging.md)

## Create a basic Oyster card:
  4. [Add the balance](04_adding_balance.md)
  5. [Enable top up functionality](05_top_up.md)
  6. [Enforce maximum balance](06_maximum_balance.md)
  7. [Deduct the money](07_deducting_money.md)

## Add touch in/out functionality:
  8. [Add touch in/out support](08_touch_in_out.md)
  9. [Checking minimum balance on touch in](09_min_balance_on_touch_in.md)
  10. [Charging for the journey](10_charge_on_touch_out.md)

## Record the journeys
  11. [Saving the entry station](11_saving_entry_station.md)
  12. [Adding journey history](12_journey_history.md)
  13. [Creating the station class](13_create_station_class.md)

## Refactor to extract Journey class
  14. [Handling a journey without a touch out](14_no_touch_in_or_out.md)

## Refactoring: get the code into shape
  15. [Extracting the journey log out of the Oystercard](15_extracting_journey_log.md)

## Make fares depends on zones
  16. [Calculating the fare between zones](16_fare_for_zones.md)

## [Example Code](walkthroughs/example_code)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=oystercard/README.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=oystercard/README.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=oystercard/README.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=oystercard/README.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/course&prefill_File=oystercard/README.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->