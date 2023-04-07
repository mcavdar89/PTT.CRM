using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PTT.CRM.API.Extentions;
using PTT.CRM.BL.Abstruct;
using PTT.CRM.Model.Dtos;

namespace PTT.CRM.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MesajController : ControllerBase
    {
        private readonly IMesajServis _servis;


        public MesajController(IMesajServis servis)
        {
            _servis = servis;
        }

        [HttpGet("list")]
        public IActionResult ListMesaj()
        {
            var res = _servis.ListMesaj();
            return Ok(res); 
        }
        [HttpPost("kaydet")]
        public IActionResult Kaydet([FromBody]MesajDto item)
        {
         

            var res = _servis.KaydetMesaj(item);           

            return Ok(res);
        }



    }
}
