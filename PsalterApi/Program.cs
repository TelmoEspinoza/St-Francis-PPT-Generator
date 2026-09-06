using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using PsalterApi.Data;
using PsalterApi.Endpoints;
using PsalterApi.Services;
using Scalar.AspNetCore;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddProblemDetails();
builder.Services.AddOpenApi();
builder.Services.AddDbContext<SfpptsContext>(con => con.UseSqlServer(builder.Configuration.GetConnectionString("ConSFPPTS")));
builder.Services.AddScoped<IPrayerService, PrayerService>();
builder.Services.AddScoped<IPsalterService, PsalterService>();
builder.Services.AddScoped<IPresentationBuilder, PresentationBuilder>();
builder.Services.AddValidation();
var app = builder.Build();
app.MapPrayers();
app.MapPsalters();
app.MapPresentations();
//pipeline
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
    app.MapScalarApiReference();
}

app.Run();
