using PsalterApi.Dtos.PsalterDetail;

namespace PsalterApi.Dtos.Psalters
{
    public class GetPsalterResponse
    {
    public int IdPsalter { get; set; }
    public int? Code { get; set; }
    public string? Description { get; set; }
    public string? Template { get; set; }
    public ICollection <GetPsalterDetailResponse> PsalterDetails { get; set; } = new List<GetPsalterDetailResponse>();
    
    }
}