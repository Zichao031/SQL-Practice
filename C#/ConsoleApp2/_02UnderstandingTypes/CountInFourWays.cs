namespace _02UnderstandingTypes;

public static class CountInFourWays
{
    public static void Count()
    {
        for (int i = 1; i <= 4; i++)
        {
            for (int j = 0; j <= 24; j += i)
            {
                Console.Write(j + " ");
            }
            Console.WriteLine("");
        }
    }
}