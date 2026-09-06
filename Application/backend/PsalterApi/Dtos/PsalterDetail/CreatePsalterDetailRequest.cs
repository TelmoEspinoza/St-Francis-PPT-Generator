using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using PsalterApi.Models;

namespace PsalterApi.Dtos.PsalterDetail
{
    public class CreatePsalterDetailRequest
    {
      [Required]
        public int IdTypePrayer { get; set; }
        [Required]
        public int IdPrayer { get; set; }
        [Required]
        public int DayInt { get; set; }
        public string Description { get; set; }  = string.Empty;
        public int? Position { get; set; }
        
        
    }
}