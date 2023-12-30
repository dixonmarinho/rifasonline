using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sorteio.Domain.Models.Body
{
    public class NumeroEscolhidoRequest
    {
        public int IdSorteio { get; set; }
        public string CPF { get; set; }
        public string Nome { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string numbers { get; set; }
        public decimal valortotal { get; set; }
    }
}
