using System;
using System.Collections.Generic;
using System.Text;

namespace Sorteio.Domain.Models.EntityDomain
{
    public class PedidoCliente
    {
        public int id_pedido { get; set; }
        public int id_usuario { get; set; }
        public int id_sorteio { get; set; }
        public string nome { get; set; }
        //public string cpf { get; set; }
        public string celular { get; set; }
        public int numero { get; set; }
        //public DateTime data_pedido { get; set; }
        //public decimal valor_total { get; set; }
        public int id_status_pedido { get; set; }

    }
}