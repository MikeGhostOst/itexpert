using System.ComponentModel.DataAnnotations;

namespace itexpert.Models
{
    public class CodeValuePair
    {
        public int Code { get; set; }
        public string Value { get; set; }

        [Key]
        public int Order { get; set; }
    }
}
