
using PsalterApi.Dtos.Psalters;

namespace PsalterApi.Services
{
    public interface IPsalterService
    {
        public Task<IEnumerable<GetPsalterResponse>> GetAllPsalters();
        public Task<GetPsalterResponse> GetPsalterById(int id);
        public Task<GetPsalterResponse> CreatePsalter(CreatePsalterRequest request);
        public Task<GetPsalterResponse> UpdatePsalter(int id, CreatePsalterRequest request);
        public Task<bool> DeletePsalter(int id);
    }
}