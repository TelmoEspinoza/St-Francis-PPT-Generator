namespace PsalterApi.Dtos.Prayers
{
    public class GetPrayersResponse
    {
        public int IdPrayer { get; set; }
        public int Code { get; set; }
        public string Description { get; set; } = null!;
        public string DescriptionShort { get; set; } = string.Empty;
    }
}