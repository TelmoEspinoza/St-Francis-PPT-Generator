using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using PsalterApi.Data;
using PsalterApi.Dtos.Prayers;
using PsalterApi.Models;

namespace PsalterApi.Services
{
    public class PrayerService : IPrayerService
    {
        private readonly SfpptsContext _context;
        public PrayerService(SfpptsContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<GetPrayersResponse>> GetAllPrayers()
        {
            var prayers = await _context.Prayers.ToListAsync();
            return prayers.Select(ToGetPrayersResponse).ToList();
        }

        public async Task<GetPrayersResponse> GetPrayerById(int IdPrayer)
        {
            var prayer = await _context.Prayers.FirstOrDefaultAsync(p => p.IdPrayer == IdPrayer);
            if (prayer == null)
            {
                throw new KeyNotFoundException($"Prayer with ID {IdPrayer} not found.");
            }
            return ToGetPrayersResponse(prayer);
        }

        public async Task<GetPrayersResponse> CreatePrayer(CreatePrayerRequest request)
        {
            var prayer = new Prayer
            {
                Code = request.Code,
                Description = request.Description,
                DescriptionShort = request.DescriptionShort
            };

            _context.Prayers.Add(prayer);
            await _context.SaveChangesAsync();

            return ToGetPrayersResponse(prayer);
            //Results.CreatedAtRoute("GetPrayerById", new { id = prayer.IdPrayer }, ToGetPrayersResponse(prayer));
        }

        public async Task<GetPrayersResponse> UpdatePrayer(int IdPrayer, UpdatePrayerRequest request)
        {
            var prayer = await _context.Prayers.FirstOrDefaultAsync(p => p.IdPrayer == IdPrayer);
            if (prayer == null)
            {
                throw new KeyNotFoundException($"Prayer with ID {IdPrayer} not found.");
            }

            prayer.Code = request.Code;
            prayer.Description = request.Description;
            prayer.DescriptionShort = request.DescriptionShort;

            await _context.SaveChangesAsync();

            return ToGetPrayersResponse(prayer);
        }

        public async Task<bool> DeletePrayer(int IdPrayer)
        {
            var prayer = await _context.Prayers.FirstOrDefaultAsync(p => p.IdPrayer == IdPrayer);
            if (prayer == null)
            {
                return false;
            }

            _context.Prayers.Remove(prayer);
            await _context.SaveChangesAsync();

            return true;
        }

        private GetPrayersResponse ToGetPrayersResponse(Prayer prayer)
        {
            return new GetPrayersResponse
            {
                IdPrayer = prayer.IdPrayer,
                Code = prayer.Code ?? 0,
                Description = prayer.Description,
                DescriptionShort = prayer.DescriptionShort ?? string.Empty
            };
        }
    }
}