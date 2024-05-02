using Microsoft.AspNetCore.Mvc;

namespace Project.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DateController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { dateTime = System.DateTime.Now });
        }
    }
}