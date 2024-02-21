namespace _02UnderstandingTypes;

public static class PracticeSizeAndRange
{
    public static void PrintSize()
    {
        Console.WriteLine($"the size of sbyte is {sizeof(sbyte)} bytes");
        Console.WriteLine($"The size of byte is {sizeof(byte)} bytes");
        Console.WriteLine($"The size of short is {sizeof(short)} bytes");
        Console.WriteLine($"The size of ushort is {sizeof(ushort)} bytes");
        Console.WriteLine($"The size of int is {sizeof(int)} bytes");
        Console.WriteLine($"The size of uint is {sizeof(uint)} bytes");
        Console.WriteLine($"The size of long is {sizeof(long)} bytes");
        Console.WriteLine($"The size of ulong is {sizeof(ulong)} bytes");
        Console.WriteLine($"The size of long is {sizeof(long)} bytes");
        Console.WriteLine($"The size of float is {sizeof(float)} bytes");
        Console.WriteLine($"The size of char is {sizeof(char)} bytes");
        Console.WriteLine($"The size of double is {sizeof(double)} bytes");
        Console.WriteLine($"The size of decimal is {sizeof(decimal)} bytes");
    }

    public static void PrintMaxAndMin()
    {
        Console.WriteLine($"{sbyte.MinValue} <= sbyte <= {sbyte.MaxValue}");
        Console.WriteLine($"{byte.MinValue} <= byte <= {byte.MaxValue}");
        Console.WriteLine($"{short.MinValue} <= short <= {short.MaxValue}");
        Console.WriteLine($"{ushort.MinValue} <= ushort <= {ushort.MaxValue}");
        Console.WriteLine($"{int.MinValue} <= int <= {int.MaxValue}");
        Console.WriteLine($"{uint.MinValue} <= uint <= {uint.MaxValue}");
        Console.WriteLine($"{long.MinValue} <= long <= {long.MaxValue}");
        Console.WriteLine($"{ulong.MinValue} <= ulong <= {ulong.MaxValue}");
        Console.WriteLine($"{float.MinValue} <= float <= {float.MaxValue}");
        Console.WriteLine($"{double.MinValue} <= double <= {double.MaxValue}");
        Console.WriteLine($"{decimal.MinValue} <= decimal <= {decimal.MaxValue}");
    }
}