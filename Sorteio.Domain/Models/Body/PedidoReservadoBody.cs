using Sorteio.Domain.Models.EntityDomain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Sorteio.Domain.Models.Body
{
    public class PedidoReservadoBody
    {
        public PedidoReservado pedido { get; set; }

        public PedidoReservadoBody(){}

        public PedidoReservadoBody(EntityDomain.PedidoReservado pedido)
        {
            this.pedido = pedido;
        }
    }
}
