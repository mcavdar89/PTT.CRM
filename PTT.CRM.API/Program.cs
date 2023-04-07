using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using PTT.CRM.BL.Abstruct;
using PTT.CRM.BL.Concrate;
using PTT.CRM.DAL.Abstruct;
using PTT.CRM.DAL.Concrate;
using PTT.CRM.DAL.Contexts;
using PTT.CRM.API.core;

var builder = WebApplication.CreateBuilder(args);
//services
builder.Services.AddControllers();

builder.Services.AddSwaggerGen(option =>
{
    option.OperationFilter<ReApplyOptionalRouteParameterOperationFilter>();

}
);


builder.Services.AddDbContext<PTT_CRMContext>(option =>
    option.UseSqlServer(builder.Configuration.GetConnectionString("PTT_CRMConStr"))
);


builder.Services.AddScoped<IMusteriServis, MusteriServis>();
builder.Services.AddScoped<IPTT_CRMRepository, PTT_CRMRepository>();



var app = builder.Build();
//midleware

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.MapDefaultControllerRoute();

app.Run();
