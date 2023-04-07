using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using PTT.CRM.BL.Abstruct;
using PTT.CRM.BL.Concrate;
using PTT.CRM.DAL.Abstruct;
using PTT.CRM.DAL.Concrate;
using PTT.CRM.DAL.Contexts;
using PTT.CRM.API.core;
using Microsoft.OpenApi.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using PTT.CRM.Model.Profiles;

var builder = WebApplication.CreateBuilder(args);
//services
builder.Services.AddControllers();

builder.Services.AddSwaggerGen(option =>
{
    option.OperationFilter<ReApplyOptionalRouteParameterOperationFilter>();

    option.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "My API",
        Version = "v1"
    });
    option.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        In = ParameterLocation.Header,
        Description = "Token Bilgisini Giriniz: \r\n\r\nÖrnek Kullanım: \r\nBearer eyJhbGciOiJIUzI1NiIsInR5...",
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey
    });
    option.AddSecurityRequirement(new OpenApiSecurityRequirement {
       {
         new OpenApiSecurityScheme
         {
           Reference = new OpenApiReference
           {
             Type = ReferenceType.SecurityScheme,
             Id = "Bearer"
           }
          },
          new string[] { }
        }
  });



}
);


builder.Services.AddDbContext<PTT_CRMContext>(option =>
    option.UseSqlServer(builder.Configuration.GetConnectionString("PTT_CRMConStr"))
);


builder.Services.AddScoped<IMusteriServis, MusteriServis>();
builder.Services.AddScoped<IAccountServis, AccountServis>();
builder.Services.AddScoped<IPTT_CRMRepository, PTT_CRMRepository>();

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options => {
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["Jwt:Issuer"],
        ValidAudience = builder.Configuration["Jwt:Audience"],
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
    };
});
builder.Services.AddAuthorization();

builder.Services.AddAutoMapper(typeof(PTT_CRMProfile));


var app = builder.Build();
//midleware

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthentication();
app.UseAuthorization();

app.MapDefaultControllerRoute();


app.Run();
