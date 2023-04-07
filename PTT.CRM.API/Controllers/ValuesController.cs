using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PTT.CRM.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {


        [HttpGet("listdeger")]
        public IActionResult ListDeger() 
        { 
        List<string> values = new List<string>();
            values.Add("1");
            values.Add("2");
            values.Add("3");
            values.Add("4");
            return Ok(values);
        
        }
    }
}
