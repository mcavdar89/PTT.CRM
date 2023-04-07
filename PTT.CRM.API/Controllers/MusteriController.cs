using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PTT.CRM.API.Extentions;
using PTT.CRM.BL.Abstruct;
using System.Data;

namespace PTT.CRM.API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class MusteriController : ControllerBase
    {
        private readonly IMusteriServis _musteriServis;
        public MusteriController(IMusteriServis musteriServis)
        {
            _musteriServis = musteriServis;
        }
        [Authorize(Roles = "admin")]
        [HttpGet("list/{ad?}")]
        public IActionResult List([FromRoute]string? ad)
        {
            var kullanici = this.GetKullanici();

            var list = _musteriServis.List(ad);
            return Ok(list);
        }


    }
}
