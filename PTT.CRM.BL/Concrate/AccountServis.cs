using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using PTT.CRM.BL.Abstruct;
using PTT.CRM.DAL.Abstruct;
using PTT.CRM.Model.Dtos;
using PTT.CRM.Model.Entities;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace PTT.CRM.BL.Concrate
{
    public class AccountServis : IAccountServis
    {
        private readonly IPTT_CRMRepository _repository;
        private readonly IConfiguration _config;
        public AccountServis(IPTT_CRMRepository repository, IConfiguration configuration)
        {
            _repository = repository;
            _config = configuration;
        }

        public Result Login(string kullaniciAdi)
        {
            var item = _repository.GetToDto<Kullanici,KullaniciDto>(d=>d.KullaniciAdi == kullaniciAdi);
            if(item == null)
            {
                return new Result(0, "Kullanici buluanamadı"); //{ Status = 0, Mesaj = "Kullanici buluanamadı" };
                
            }
            string token = GenerateToken(item);

            return new Result(1, "Başarılı", token);
        }

        private string GenerateToken(KullaniciDto user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier,user.KullaniciAdi),
                new Claim(ClaimTypes.Role,"admin"),
                new Claim("URL","erisim/kullanici"),
            };
            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
                _config["Jwt:Audience"],
                claims,
                expires: DateTime.Now.AddMinutes(15),
                signingCredentials: credentials);


            return new JwtSecurityTokenHandler().WriteToken(token);

        }



    }
}
