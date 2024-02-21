namespace _02UnderstandingTypes;

public class GreetByTime
{
    public void Greeting(DateTime time)
    {
        DayOfWeek dayOfWeek = time.DayOfWeek;
        int hour = time.Hour;
        // Console.WriteLine($"Today is {dayOfWeek}, hour is {hour}");
        if (hour >= 6 && hour < 12)
        {
            Console.WriteLine($"Good Morning!");
        }
        if (hour >= 12 && hour < 18)
        {
            Console.WriteLine($"Good Afternoon!");
        }
        if (hour >= 18 && hour < 22)
        {
            Console.WriteLine($"Good Evening!");
        }
        if (hour >= 22 || hour < 6)
        {
            Console.WriteLine($"Good Night!");
        }
    }
}