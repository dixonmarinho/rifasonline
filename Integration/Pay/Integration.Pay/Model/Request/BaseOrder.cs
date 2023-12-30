using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Integration.Pay.Model
{

    public abstract class BaseOrder
    {
        public int Pedido { get; set; }
        public Decimal TransactionAmount { get; set; }
        public PayEnum PayEnum { get; set; }
        // Tempo que irá expirar
        public string Description { get; set; }
        public int MinutesOfExpiration { get; set; }

        public BasePayer Payer { get; set; }

        public BaseOrder()
        {
            MinutesOfExpiration = 30;
            Payer = new BasePayer();    
        }

    }
}

