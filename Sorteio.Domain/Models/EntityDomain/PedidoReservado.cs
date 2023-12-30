using Sorteio.Domain.Models.EntityDomain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Sorteio.Domain.Models.EntityDomain
{
    public class PedidoReservado
    {
        public int id_pedido { get; set; }
        public decimal valor_total { get; set; }
        public int id_status_pedido { get; set; }
        public bool status { get; set; }
        public string nome { get; set; }
        public string ped_guid { get; set; }
        public string QRCodeURL { get; set; }
    }
}
