using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PsalterApi.Dtos.Psalters;
using PsalterApi.Services;

namespace PsalterApi.Endpoints
{
    public static class PsaltersEndPoint
    {
        public static RouteGroupBuilder MapPsalters(this IEndpointRouteBuilder routes)
        {
            var group = routes.MapGroup("/psalters");
            //GET /psalters/1
            group.MapGet("/{IdPsalter}", async (IPsalterService psalterService, int IdPsalter) =>
            {
                try
                {
                    var psalter = await psalterService.GetPsalterById(IdPsalter);
                    return Results.Ok(psalter);
                }
                catch (KeyNotFoundException)
                {
                    return Results.NotFound();
                }
            }).WithName("GetPsalterById");

            // POST /psalters
            group.MapPost("/", async (IPsalterService psalterService, CreatePsalterRequest request) =>
                    {
                        var psalter = await psalterService.CreatePsalter(request);
                        return Results.Ok(psalter); 
                        // Results.CreatedAtRoute("GetPsalterById", new { IdPsalter = psalter.IdPsalter }, psalter);
                    });
            return group;
        }
    }
}