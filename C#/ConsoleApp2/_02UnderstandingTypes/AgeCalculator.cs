namespace _02UnderstandingTypes;

public class AgeCalculator(DateTime birthDate)
{
    private DateTime BirthDate { get; set; } = birthDate;

    public void CalculateAgeAndAnniversary()
    {
        var pastTime = DateTime.Now - BirthDate;
        var daysOfAge = (int)pastTime.TotalDays;
        Console.WriteLine($"birthday: {BirthDate}; days of age is {daysOfAge}");

        int daysToNextAnniversary = 10000 - daysOfAge % 10000;
        DateTime dateOfNextAnniversary = DateTime.Now.AddDays(daysToNextAnniversary);
        Console.WriteLine($"Date of Next 10000-day Anniversary is {dateOfNextAnniversary}");
    }
}


