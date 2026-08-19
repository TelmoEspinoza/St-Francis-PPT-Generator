using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using PsalterApi.Data;
using PsalterApi.Dtos.PsalterDetail;
using PsalterApi.Dtos.Psalters;
using PsalterApi.Models;

namespace PsalterApi.Services
{
    public class PsalterService : IPsalterService
    {
        private readonly SfpptsContext _context;
        public PsalterService(SfpptsContext sfpptsContext)
        {
            _context = sfpptsContext;
        }

        public Task<bool> DeletePsalter(int id)
        {
            throw new NotImplementedException();
        }
        public Task<GetPsalterResponse> GetPsalterById(int id)
        {
            var response = _context.Psalters
            .Include(p => p.PsalterDetails).ThenInclude(t => t.IdTypePrayerNavigation)
            .Include(p => p.PsalterDetails).ThenInclude(t => t.IdPrayerNavigation)
            .Include(t => t.IdTemplateNavigation)
            .FirstOrDefault(p => p.IdPsalter == id);
            if (response == null)
            {
                throw new KeyNotFoundException($"Psalter with ID {id} not found.");
            }
            else
            {
                return toGetPsalterResponse(response);
            }

        }

        public Task<IEnumerable<GetPsalterResponse>> GetAllPsalters()
        {
            throw new NotImplementedException();
        }

        public async Task<GetPsalterResponse> CreatePsalter(CreatePsalterRequest request)
        {
            var template = _context.Templates.FirstOrDefault(t => t.IdTemplate == request.IdTemplate);
            if (template == null)
            {
                throw new KeyNotFoundException($"Template with ID {request.IdTemplate} not found.");
            }
            else
            {
                var psalter = new Psalter
                {
                    Code = request.Code,
                    Description = request.Description,
                    IdTemplate = request.IdTemplate,
                    PsalterDetails = request.PsalterDetails.Select(d => new PsalterDetail
                    {
                        IdTypePrayer = d.IdTypePrayer,
                        IdPrayer = d.IdPrayer,
                        DayInt = d.DayInt,
                        Description = d.Description,
                        Position = d.Position
                    }).ToList()
                };

                await _context.Psalters.AddAsync(psalter);
                await _context.SaveChangesAsync();

                var created = await _context.Psalters
                    .Include(p => p.PsalterDetails).ThenInclude(t => t.IdTypePrayerNavigation)
                    .Include(p => p.PsalterDetails).ThenInclude(t => t.IdPrayerNavigation)
                    .Include(p => p.IdTemplateNavigation)
                    .FirstAsync(p => p.IdPsalter == psalter.IdPsalter);

                return await toGetPsalterResponse(created);
            }
        }

        private async Task<GetPsalterResponse> toGetPsalterResponse(Psalter response)
        {
            return new GetPsalterResponse
            {
                IdPsalter = response.IdPsalter,
                Code = response.Code,
                Description = response.Description,
                Template = response.IdTemplateNavigation.Description ?? string.Empty,
                PsalterDetails = response.PsalterDetails.Select(d => new GetPsalterDetailResponse
                {
                    IdPsalterDetail = d.IdPsalterDetail,
                    IdTypePrayer = d.IdTypePrayer,
                    IdPrayer = d.IdPrayer,
                    DayInt = d.DayInt,
                    TypePrayer = d.IdTypePrayerNavigation.Description ?? string.Empty,
                    Prayer = d.IdPrayerNavigation.Description ?? string.Empty,
                    Description = d.Description ?? string.Empty,
                    Position = d.Position
                }).ToList()
            };
        }

        public Task<GetPsalterResponse> UpdatePsalter(int id, CreatePsalterRequest request)
        {
            throw new NotImplementedException();
        }
    }
}