namespace _02UnderstandingTypes;

public class Pyramid
{
    public int Level { get; set; }
    public Pyramid(int level=5)
    {
        Level = level*2;
    }

    public void PrintPyramid()
    {
        for (int i = 0; i < Level; i+=2)
        {
            for (int j = 0; j < (Level - i) / 2; j++)
            {
                Console.Write(" ");
            }
            for (int k = 0; k < i+1; k++)
            {
                Console.Write("*");
            }
            for (int j = 0; j < (Level - i) / 2; j++)
            {
                Console.Write(" ");
            }
            Console.WriteLine("");
        }
    }
}