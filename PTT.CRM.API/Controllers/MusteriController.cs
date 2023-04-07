using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PTT.CRM.BL.Abstruct;

namespace PTT.CRM.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MusteriController : ControllerBase
    {
        private readonly IMusteriServis _musteriServis;
        public MusteriController(IMusteriServis musteriServis)
        {
            _musteriServis = musteriServis;
        }

        [HttpGet("list/{ad?}")]
        public IActionResult List([FromRoute]string? ad)
        {
            var list = _musteriServis.List(ad);
            return Ok(list);
        }


    }
}
