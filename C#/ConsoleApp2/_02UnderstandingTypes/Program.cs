// See https://aka.ms/new-console-template for more information
using _02UnderstandingTypes;
// // ReadLine(), WriteLine(), Write()
CreateHackerName.GetHackerName();


// 1. Practice number sizes and ranges:
// Output the number of bytes in memory that each of the following types uses
// Output the minimum and maximum
// sbyte, byte, short, ushort, int, uint, long, ulong, float, double, and decimal

// Size:
PracticeSizeAndRange.PrintSize();
// maximum and minimum
PracticeSizeAndRange.PrintMaxAndMin();


// // 2. Write a program: enter a integer number of centuries and convert it into years, days, hours, minutes, seconds
// // milliseconds, microseconds, nanoseconds.
ConvertCentury.Convert();
// 1. What happens when you divide an int variable by 0?
// throw an error: divide by zero
// Console.WriteLine(1/0); 

// // 2. What happens when you divide a double variable by 0?
// return infinity
Console.WriteLine(10.0/0); 
// // 3. What happens when you overflow an int variable, that is, set it to a value beyond its range?
// Console.WriteLine(int.MaxValue);
// Cannot implicitly convert type 'long' to 'int'
// int x = 21474836470; 
//
// // 4. What is the difference between x = y++; and x = ++y;?
// int x, y = 0;
// x = y++; 
// Console.WriteLine($"x = {x}, y = {y}");
// //
// int a, b = 0;
// a = ++b;
// Console.WriteLine($"a = {a}, b = {b}");
// 5. What is the difference between break, continue, and return when used inside a loop statement?
// for (int i = 0; i < 10; i++)
// {
//     
//     if (i == 6)
//     {
//         break; // break will end the iteration and exit the loop immediately
//     }
//     Console.WriteLine(i);
// }
//
// for (int i = 0; i < 10; i++)
// {
//     
//     if (i == 6)
//     {
//         return; // return will exit the current method and return the specific values
//     }
//     Console.WriteLine(i);
// }
//
// for (int i = 0; i < 10; i++)
// {
//     
//     if (i == 6)
//     {
//         continue; // continue will skip the current iteration and move on to the next iteration
//     }
//     Console.WriteLine(i);
// }

// 6. What are the three parts of a for statement and which of them are required?
// initializer: initialize the loop control variable
// condition: required determine whether the loop should continue executing or not
// iterator: executed after each iteration

// 7. What is the difference between the = and == operators?
// =: assignment operator
// ==: equality operator check if the two variable' values or expression are the same

// 8. Does the following statement compile? for ( ; true; ) ;
// Yes, it creates infinite loop

// // 9. What does the underscore _ represent in a switch expression?
// int number = 4;
//
// string result = number switch
// {
//     1 => "One",
//     2 => "Two",
//     3 => "Three",
//     _ => "Other" // '_' is used to discard the value for other cases
// };
// Console.WriteLine(result);

// What interface must an object implement to be enumerated over by using the foreach statement?
// IEnumerable<> interfaces, use GetEnumerator() method to get IEnumerator<> object
// then the IEnumerator object has two methods: MoveNext() and Reset(); 
// MoveNext() will advance to the next element
// Reset() will reset the IEnumerator to its initial state

// FizzBuzz is a group word game for children to teach them about division. Players take turns
// to count incrementally, replacing any number divisible by three with the word /fizz/, any
// number divisible by five with the word /buzz/, and any number divisible by both with /
// fizzbuzz/.
// Create a console application in Chapter03 named Exercise03 that outputs a simulated
// FizzBuzz game counting up to 100. The output should look something like the following
// screenshot:
FuzzBuzz.Start();


// Q: Create a console application and enter the preceding code. Run the console application and view the output. What happens?
// ANSWER: This program output the numbers from 0 to 255 over and over again. Since the condition of i < max is always true
// int max = 500;
// for (byte i = 0; i < max; i++)
// {
//     Console.WriteLine(i);
// }

// Q: What code could you add (don’t change any of the preceding code) to warn us about the problem?
// CODE:
int max = 500;
for (byte i = 0; i < max; i++)
{
    if (i == byte.MaxValue)
    {
        Console.WriteLine("Warning: loop counter reach the maximum value for byte type");
        break;
    }
    Console.WriteLine(i);
}

// Question 1
// Your program can create a random number between 1 and 3 with the following code:
// int correctNumber = new Random().Next(3) + 1;
// Write a program that generates a random number between 1 and 3 and asks the user to
//     guess what the number is. Tell the user if they guess low, high, or get the correct answer.
//     Also, tell the user if their answer is outside of the range of numbers that are valid guesses
//     (less than 1 or more than 3). You can convert the user's typed answer from a string to an
// int using this code:
// int guessedNumber = int.Parse(Console.ReadLine());
// CODE:

GuessNumber game = new GuessNumber(1, 3);
game.StartGame(5);

// Question 2
// Print-a-Pyramid.Like the star pattern examples that we saw earlier, create a program that
// will print the following pattern: If you find yourself getting stuck, try recreating the two
// examples that we just talked about in this chapter first. They’re simpler, and you can
// compare your results with the code included above.
// This can actually be a pretty challenging problem, so here is a hint to get you going. I used
// three total loops. One big one contains two smaller loops. The bigger loop goes from line
// to line. The first of the two inner loops prints the correct number of spaces, while the
// second inner loop prints out the correct number of stars.

Pyramid p = new Pyramid(30);
p.PrintPyramid();

// Question 3 is the same as question 1

// Question 4
// Write a simple program that defines a variable representing a birth date and calculates
// how many days old the person with that birth date is currently.
// For extra credit, output the date of their next 10,000 day (about 27 years) anniversary.
// Note: once you figure out their age in days, you can calculate the days until the next
// anniversary using int daysToNextAnniversary = 10000 - (days % 10000); .
// CODE:

DateTime me = new DateTime(2000, 4, 7);
DateTime him = new DateTime(1999, 4, 7);
AgeCalculator ac = new AgeCalculator(me);
AgeCalculator acHim = new AgeCalculator(him);
ac.CalculateAgeAndAnniversary();
acHim.CalculateAgeAndAnniversary();

// Question 5
// Write a program that greets the user using the appropriate greeting for the time of day.
// Use only if , not else or switch , statements to do so. Be sure to include the following
// greetings:
// "Good Morning"
// "Good Afternoon"
// "Good Evening"
// "Good Night"
// It's up to you which times should serve as the starting and ending ranges for each of the
// greetings. If you need a refresher on how to get the current time, see DateTime
// Formatting. When testing your program, you'll probably want to use a DateTime variable
// you define, rather than the current time. Once you're confident the program works
// correctly, you can substitute DateTime.Now for your variable (or keep your variable and just
// assign DateTime.Now as its value, which is often a better approach)
GreetByTime gbt = new GreetByTime();
// now
gbt.Greeting(DateTime.Now);
// morning
DateTime morning = new DateTime(2024, 2, 20, 8, 0, 0);
gbt.Greeting(morning);
// Afternoon
DateTime afternoon = new DateTime(2024, 2, 20, 14, 0, 0);
gbt.Greeting(afternoon);
// Evening
DateTime evening = new DateTime(2024, 2, 20, 20, 0, 0);
gbt.Greeting(evening);
// Evening
DateTime night = new DateTime(2024, 2, 20, 0, 0, 0);
gbt.Greeting(night);

// Question 6
// Write a program that prints the result of counting up to 24 using four different increments.
// First, count by 1s, then by 2s, by 3s, and finally by 4s.
// Use nested for loops with your outer loop counting from 1 to 4. You inner loop should
// count from 0 to 24, but increase the value of its /loop control variable/ by the value of the /
// loop control variable/ from the outer loop. This means the incrementing in the /
// afterthought/ expression will be based on a variable.
// Your output should look something like this:
// 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24
// 0,2,4,6,8,10,12,14,16,18,20,22,24
// 0,3,6,9,12,15,18,21,24
// 0,4,8,12,16,20,24
CountInFourWays.Count();