using Integration.Pay.Gateway;
using Integration.Pay.Model;
using Integration.Pay.Model.Request;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Sorteio.Data;
using System;
using System.IO;
using System.Text.Json;
using System.Threading.Tasks;

namespace Sorteio.Portal.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class PayController : ControllerBase
    {
        private string TOKEN = "TEST-2544854926573227-030223-4d3205b97bb8d36a1a857fa569d1e392-217441002";
        private readonly SqlDataContext context;
        private readonly IHostingEnvironment environment;

        public PayController(
            SqlDataContext context,
            IHostingEnvironment Environment)
        {
            this.context = context;
            environment = Environment;
        }

        [HttpPost]
        [Route("AddOrder")]
        public async Task<ResponseOrderView> AddOrder([FromBody] PagSeguroOrder order)
        {
            var pagseguro = new PagSeguro(TOKEN);
            var r = await pagseguro.Order(order);
            var response = new ResponseOrderView();
            if (!r.IsOK)
            {
                r.xInfo = "Erro ao criar Ordem : PAY01";
                return r;
            }

            var _directory = environment.WebRootPath;
            _directory = Path.Combine(_directory, "downloads", "qrcode");
            if (!Directory.Exists(_directory))
                Directory.CreateDirectory(_directory);
            var fileqrcode = Path.Combine(_directory, r.QRCodeGUID + ".png");
            // Salva a Imagem no Disco 
            r.QRCodeBitMap.Save(fileqrcode);
            var r1 = new ResponseOrderView
            {
                Pedido = order.Pedido,
                IsOK = r.IsOK,
                QRCodeGUID = r.QRCodeGUID,
                QRCodeURLGov = r.QRCodeURLGov,
                QRCodeURL = r.QRCodeURL
            };
            response = r1;

            try
            {
                var cmd = context.Connection.CreateCommand();
                var json = JsonSerializer.Serialize(r1);
                cmd.CommandText =
                    " insert into public.tb_ped_pay(id_pedido, ped_json, ped_guid) " +
                    " values(:param1, :param2, :param3)";

                cmd.Parameters.AddWithValue("param1", order.Pedido);
                cmd.Parameters.AddWithValue("param2", json);
                cmd.Parameters.AddWithValue("param3", r1.QRCodeGUID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            catch (Exception)
            {
                response.xInfo = "Erro ao incluir o pedido no sistema : PAY02";
            }
            return response;
        }

        [HttpPost]
        public IActionResult Notify(NotifyPay data)
        {
            return Ok();
        }
    }
}