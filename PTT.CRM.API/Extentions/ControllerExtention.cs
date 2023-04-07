using Microsoft.AspNetCore.Mvc;
using PTT.CRM.Model.Dtos;
using System.Security.Claims;

namespace PTT.CRM.API.Extentions
{
    public static class ControllerExtention
    {

        public static KullaniciDto GetKullanici(this ControllerBase controller)
        {
            var identity = controller.HttpContext.User.Identity as ClaimsIdentity;
            
            if (identity == null)
            {
                return null;
            }

            return new KullaniciDto
            {
                KullaniciAdi = identity.Claims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier)?.Value
            };
        }

    }
}
