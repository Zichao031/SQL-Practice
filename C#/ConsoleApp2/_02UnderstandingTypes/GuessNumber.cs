namespace _02UnderstandingTypes;

public class GuessNumber
{
    public GuessNumber(int min, int max)
    {
        Min = min;
        Max = max;
    }
    public int Min { get; set; }
    public int Max { get; set; }
    public void StartGame(int guess=5)
    {
        Console.WriteLine($"Guess Game starts now! Are you ready?! I will generate a number between {Min} and {Max} inclusively.");
        int randomNumber = new Random().Next(Min, Max+1);
        Console.WriteLine(randomNumber);
        Console.Write("I have generated the number, guess what is the number: ");
        int num = GetUserInput();
        while (num != randomNumber && guess > 0)
        {
            if (num > randomNumber && num <= Max)
            {
                Console.Write("OH TOO HIGH BRO, try again: ");
            }
            else if (num < randomNumber && num >= Min)
            {
                Console.Write("ooooh too low low low low, try again: ");
            }
            else
            {
                Console.Write("OUT OF RANGE, try again: ");
            }
            // new guess
            num = GetUserInput();
            guess--;
        }

        if (num == randomNumber)
        {
            Console.WriteLine("Congrats!");
            return;
        }
        Console.WriteLine("Run out of guess times. Better luck next time!");
    }
    
    public int GetUserInput()
    {
        string number = Console.ReadLine();
        int num;
        if (int.TryParse(number, out var parsedValue))
        {
            num = parsedValue;
        }
        else
        {
            Console.WriteLine("Only numerical input are valid (MAD FACE)");
            num = int.MinValue;
        }

        return num;
    }
}

