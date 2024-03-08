using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using itexpert.Models;

namespace itexpert.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ItExpertController : ControllerBase
    {
        private readonly MyDbContext _dbContext;

        public ItExpertController(MyDbContext context)
        {
            _dbContext = context;
        }

        [HttpGet("GetCodeValuePairs")]
        public IEnumerable<CodeValuePair> GetCodeValuePairs(int? minOrder, int? maxOrder, int? minCode, int? maxCode, string? containsValue)
        {
            var codeValuePairs = _dbContext.CodeValuePairs.ToList();

            if (minOrder.HasValue)
            {
                codeValuePairs = codeValuePairs.FindAll(x => x.Order >= minOrder);
            }

            if (maxOrder.HasValue)
            {
                codeValuePairs = codeValuePairs.FindAll(x => x.Order <= maxOrder);
            }

            if (minCode.HasValue)
            {
                codeValuePairs = codeValuePairs.FindAll(x => x.Code >= minCode);
            }

            if (maxCode.HasValue)
            {
                codeValuePairs = codeValuePairs.FindAll(x => x.Code <= maxCode);
            }

            if (containsValue != null)
            {
                codeValuePairs = codeValuePairs.FindAll(x => x.Value.Contains(containsValue));
            }

            return codeValuePairs;
        }

        [HttpPost("PostCodeValuePairs")]
        public IActionResult PostCodeValuePairs([FromBody] List<Dictionary<string, string>> jsonData)
        {
            try
            {
                List<CodeValuePair> codeValueList = new List<CodeValuePair>();

                foreach (var dict in jsonData)
                {
                    if (dict.Count > 1)
                    {
                        throw new Exception("Bad data provided. An object can contain only one pair of code and value.");
                    }

                    foreach (var keyValuePair in dict)
                    {
                        if (int.TryParse(keyValuePair.Key, out int key))
                        {
                            codeValueList.Add(new CodeValuePair { Code = key, Value = keyValuePair.Value });
                        }
                        else
                        {
                            throw new Exception("Bad data provided. The key isn't an integer.");
                        }
                    }
                }

                codeValueList.Sort((x, y) => x.Code - y.Code);
                int order = 1;
                codeValueList.ForEach(x => x.Order = order++);

                _dbContext.RemoveRange(_dbContext.CodeValuePairs);
                _dbContext.AddRange(codeValueList);
                _dbContext.SaveChanges();

                return Ok("POST successful");
            }
            catch(Exception ex)
            {
                return BadRequest($"Error: {ex.Message}");
            }
        }
    }
}
