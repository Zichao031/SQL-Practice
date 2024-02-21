namespace _02UnderstandingTypes;

public static class ConvertCentury
{
    public static void Convert()
    {
        Console.Write("enter a integer number of centuries: ");
        string? centuries = Console.ReadLine();
        if (centuries == null && !int.TryParse(centuries, out int num))
        {
            Console.WriteLine("Invalid Input");
            return;
        }
        uint c = uint.Parse(centuries);
        uint years = c * 100;
        uint months = years * 12;
        uint days = years * 365;
        ulong hours = days * 24;
        ulong minutes = hours * 60;
        ulong seconds = minutes * 60;
        decimal milliseconds = minutes * 1000;
        decimal microseconds = milliseconds * 1000;  // decimal ?
        decimal nanoseconds = microseconds * 1000;
        Console.WriteLine($"{c} centuries = {years} years = {months} months = {days} days = {hours} hours = {minutes} minutes = " +
                          $"{seconds} seconds = {milliseconds} milliseconds = {microseconds} microseconds = {nanoseconds} nanoseconds");

    }
}