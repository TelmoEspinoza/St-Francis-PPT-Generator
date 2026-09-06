using PsalterApi.Services;

namespace PsalterApi.Endpoints;

public static class PresentationsEndpoints
{
    public static RouteGroupBuilder MapPresentations(this IEndpointRouteBuilder routes)
    {
        var group = routes.MapGroup("/presentations");

        //GET /presentations
        group.MapGet("/", (IPresentationBuilder presentationBuilder) =>
        {
            var file = presentationBuilder.Build();
            return Results.File(file, "application/vnd.openxmlformats-officedocument.presentationml.presentation", "presentation.pptx");
        });

        return group;
    }
}
