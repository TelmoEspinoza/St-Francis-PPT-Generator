using PsalterApi.Dtos.Prayers;

namespace PsalterApi.Services
{
    public interface IPrayerService
    {
       
        public Task<IEnumerable<GetPrayersResponse>> GetAllPrayers();
        public Task<GetPrayersResponse> GetPrayerById(int idIdPrayer);
        public Task<GetPrayersResponse> CreatePrayer(CreatePrayerRequest request);

        public Task<GetPrayersResponse> UpdatePrayer(int IdPrayer, UpdatePrayerRequest request);
        public Task<bool> DeletePrayer(int IdPrayer);
       
    }
}