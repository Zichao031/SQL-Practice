namespace _02UnderstandingTypes;

public static class CreateHackerName
{
    public static void GetHackerName()
    {
        Console.Write("Enter your favorite color: ");
        string? color = Console.ReadLine();

        Console.Write("Enter your astrology sign: ");
        string? userSign = Console.ReadLine();

        Console.Write("Enter your street address number: ");
        string? userStreetNumber = Console.ReadLine();

        string hackerName = color + userSign + userStreetNumber;
        Console.WriteLine($"Your hacker name is \"{hackerName}\"");
    }
}