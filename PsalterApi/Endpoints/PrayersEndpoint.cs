using PsalterApi.Dtos.Prayers;
using PsalterApi.Services;

namespace PsalterApi.Endpoints;

public static class PrayersEndpoints
{
    public static RouteGroupBuilder MapPrayers(this IEndpointRouteBuilder routes)
    {

        var group = routes.MapGroup("/prayers");
        //GET /prayers
        group.MapGet("/", (IPrayerService prayerService) =>
        {
            var prayers = prayerService.GetAllPrayers();
            return prayers;
        });

        //GET /prayers/1
        group.MapGet("/{IdPrayer}", async (IPrayerService prayerService, int IdPrayer) =>
        {
            try
            {
                var prayer = await prayerService.GetPrayerById(IdPrayer);
                return Results.Ok(prayer);
            }
            catch (KeyNotFoundException)
            {
                return Results.NotFound();
            }
        }).WithName("GetPrayerById");

        // POST /prayers
        group.MapPost("/", async (IPrayerService prayerService, CreatePrayerRequest request) =>
                {
                    var prayer = await prayerService.CreatePrayer(request);
                    return Results.CreatedAtRoute("GetPrayerById", new { IdPrayer = prayer.IdPrayer }, prayer);
                });

        //PUT /prayers/1
        group.MapPut("/{IdPrayer}", async (IPrayerService prayerService, int IdPrayer, UpdatePrayerRequest request) =>
        {
            try
            {
                var updatedPrayer = await prayerService.UpdatePrayer(IdPrayer, request);
                return Results.NoContent();
            }
            catch (KeyNotFoundException)
            {
                return Results.NotFound();
            }
        });
        
        //DELETE /prayers/1
        group.MapDelete("/{IdPrayer}", async (IPrayerService prayerService, int IdPrayer) =>
        {
            var deleted = await prayerService.DeletePrayer(IdPrayer);
            if (deleted)
            {
                return Results.NoContent();
            }
            else
            {
                return Results.NotFound();
            }
        });

        return group;
    }

}