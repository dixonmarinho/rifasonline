using Integration.Pay.Helpers;
using MercadoPago.Client;
using MercadoPago.Client.Payment;
using MercadoPago.Config;
using MercadoPago.Resource.Payment;
using Sorteio.Domain.Models.Body;
using Sorteio.Domain.Models.EntityDomain;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Xunit;

namespace Sorteio.Test
{
    public class Pedido_Test
    {
        [Fact]
        public void Convert_class_to_Json()
        {
            IEnumerable<NumeroEscolhido> numeros = new List<NumeroEscolhido>
            {
                new NumeroEscolhido
                {
                    id_numero_escolhido = 1,
                    id_pedido = 1,
                    numero = 10
                }
            };

            var t = new CadastrarUsuarioListaNumerosBody
            {
                id_sorteio = 1,
                numeroSorteios = numeros,
                usuario = new Usuario
                {
                    celular = "99982342885",
                    email = "dixonsm@gmail.com",
                    cpf = "82792089334"
                },
                valor_total = 1000
            };

            string jsonString = JsonSerializer.Serialize(t);
        }
    }
}
