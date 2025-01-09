# Countdown - numbers game solver

Countdown (https://en.wikipedia.org/wiki/Countdown_(game_show)) is a
UK game show which includes a numbers puzzle: a random target numbers
has to be computed from six semi-random input numbers by using only
basic arithmetic (addition, subtraction, multiplication, division).

This just follows the hard work already done by Christoph Jennings
here: https://cgjennings.ca/articles/countdown-numbers/. He solved the
algorithm, explained it in detail and presented his code. This package
is just a re-implementation of his work in elisp as an educational
exercise for me. 

## Full Game Rules

1. You are to solve for a target number given 6 other operating
   numbers.
2. The target number is chosen at random between 100 and 999. 
3. The six operating numbers can be either "large numbers" or "small
   numbers". 
   - The player picks from 0 to 4 large numbers, which are drawn at
     random from the pool of [25, 50, 75, 100].
   - The remaining (6 - large numbers) small numbers are drawn at
     random from the set of numbers from 1 to 10, doubled (so [1, 1,
     2, 2, 3, 3, ..., 10, 10]).
4. The object of the game is to reach the target number using the six
   operating numbers using only basic arithmetic operations (+, -, *,
   /).
   - No number may be used more than once
   - Only intermediate results of positive integers are allowed: No
     fractions, no negative numbers. 
   - There is no guarantee of a solution. Getting as close as possible
     to the target number (within +- 10) also qualifies for points. 

