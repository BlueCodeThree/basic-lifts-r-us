# Lifts R Us

A coding challenge involving writing software for an elevator company

## The Challenge

"You are in charge of writing software for an elevator (lift) company.

Your task is to write a program to control the travel of a lift for a 10 storey building.

A passenger can summon the lift to go up or down from any floor. Once in the lift, they can choose the floor they'd like to travel to.

Your program needs to plan the optimal set of instructions for the lift to travel, stop, and open its doors."

## Design Choices

The lift currently does not have a ground floor but has floors numbered 1-10

The lift operates so that the doors only open if a passenger is intending to travel the same direction that the lift is currently travelling.

The lift also calculates what the max floor and min floors it needs to travel to, so it does not have to travel the whole length of the building if the lift is not required to.

If there are no further instructions the lift will sit idle on the floor it is currently on.

Currently there is no error handling, the program assumes that the user will input the correct instructions.

## Tech Stack

Ruby command line with Rspec for testing

## Installing Dependencies

This is built with ruby version 2.6.3. Check what version you have with
```ruby -v```

- [Information to install ruby](https://www.ruby-lang.org/en/documentation/installation/)

You will also need to have Bundler installed. You can check to see if it is installed with `bundle -v`

To install bundler, use the following command - `gem install bundler`

Once ruby is installed on your machine, navigate to the main directory and install the dependencies using bundler

`bundle install`

This should install rspec on to your machine. Rspec is used for testing the code.

## How To Run

Clone this repo to your computer, then navigate in the terminal to the main directory.

Run the program with the command -

```ruby app.rb```

This is a command line interface for the lift.

## Commands

- "up pressed on level 4"
- "3"
- "pass" or "p"

Example usage: -

- To call a lift to come to you (calling a lift from outside the lift), use the following command:

```up pressed on level 4```

You can replace "up" with "down" and the number with any number from 1 to 10. Another example:

```down pressed on level 6```

- When the doors open, there will be a prompt to enter the floor number the passenger wishes to travel to. All that is needed to be entered is the level number. For example -

```3```

As many levels can be entered at any time there is a prompt. A passenger can call for a lift from another floor while the doors are open and other passengers are entering the floor they wish to go to.

```LIFT DOORS OPEN
What level would you like to go to?
> up pressed on level 4
> 3```

- To get the lift moving/stop entering instructions, enter the word "pass" or simply "p"

## Testing

You can test the lift by navigating to the main directory of this repo in your terminal and running the command:

```rspec -f documentation```
