using Integration.Pay.Gateway;
using Integration.Pay.Model;
using Integration.Pay.Model.Request;
using Sorteio.Portal.Controllers;
using System.Text.Json;
using System.Threading.Tasks;
using Xunit;

namespace Sorteio.Test
{
    public class Pay
    {
        private string TOKEN = "TEST-2544854926573227-030223-4d3205b97bb8d36a1a857fa569d1e392-217441002";


        public PagSeguroOrder OrderData()
        {
            var order = new PagSeguroOrder
            {
                Description = "SORTEIO PREIMIO X",
                PayEnum = PayEnum.PIX,
                TransactionAmount = 100,
                Payer = new BasePayer
                {
                    Email = "impersoft@gmail.com",
                    FirstName = "Ney",
                    LastName = "Dixon",
                }
            };
            return order;
        }

        [Fact]
        public async Task T01_GerarPIX()
        {
            var pagseguro = new PagSeguro(TOKEN);
            var order = OrderData();
            var json = JsonSerializer.Serialize(order);
            var r = await pagseguro.Order(order);
            Assert.True(r.IsOK);
        }

        [Fact]
        public async Task T02_Controller_GerarPIX()
        {
//            var pay = new PayController();
//            var order = OrderData();
//            await pay.AddOrder(order);
        }

    }
}