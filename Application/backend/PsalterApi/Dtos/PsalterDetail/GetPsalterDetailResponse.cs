using PsalterApi.Models;

namespace PsalterApi.Dtos.PsalterDetail
{
    public class GetPsalterDetailResponse
    {
        public int IdPsalterDetail { get; set; }
        public int IdTypePrayer { get; set; }
        public string TypePrayer { get; set; } = string.Empty;
        public int IdPrayer { get; set; }
        public string Prayer { get; set; } = string.Empty;
        public int DayInt { get; set; }
        public string Description { get; set; } = string.Empty!;
        public int? Position { get; set; }


    }
}