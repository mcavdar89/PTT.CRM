using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PTT.CRM.BL.Abstruct;
using PTT.CRM.Model.Dtos;

namespace PTT.CRM.API.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IAccountServis _accountServis;
        public AccountController(IAccountServis accountServis)
        {
            _accountServis = accountServis;
        }


        [HttpPost]
        public IActionResult Login([FromBody]UserLoginDto userLogin)
        {
            //LDP doğrulaması true dönerse işlemlere devam et değilse devam etme


           var res = _accountServis.Login(userLogin.KullaniciAdi);


            return Ok(res);
        }



    }
}
