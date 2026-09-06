using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using PsalterApi.Dtos.PsalterDetail;

namespace PsalterApi.Dtos.Psalters
{
    public class CreatePsalterRequest
    {
        [Required, Range(1, 9999, ErrorMessage = "Code must be between 1 and 9999.")]
        public int? Code { get; set; }
        [StringLength(50)]
        public string? Description { get; set; }
        public int IdTemplate { get; set; }
        public virtual List<CreatePsalterDetailRequest> PsalterDetails { get; set; } = new List<CreatePsalterDetailRequest>();

    }
}