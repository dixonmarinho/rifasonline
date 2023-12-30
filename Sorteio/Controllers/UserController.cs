using Integration.Pay.Model.Request;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Sorteio.Common;
using Sorteio.Data;
using Sorteio.Domain.IBusiness;
using Sorteio.Domain.Models.Body;
using Sorteio.Domain.Models.EntityDomain;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Sorteio.Portal.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly SqlDataContext context;
        private readonly IHostingEnvironment environment;
        private readonly IUsuarioBusiness usuarioBusiness;
        private PayController pay;

        public UserController(
            SqlDataContext context,
            IHostingEnvironment Environment,
            IUsuarioBusiness usuarioBusiness)
        {
            this.context = context;
            this.environment = Environment;
            this.usuarioBusiness = usuarioBusiness;
            pay = new PayController(this.context, this.environment);
        }

        [HttpGet]
        [Route("[action]")]
        public async Task<IActionResult> Find(string phone)
        {
            var user = await usuarioBusiness.Find(phone);
            if (user == null)
            {
                return NotFound();
            }
            else
            {
                return Ok(user);
            }
        }

        [HttpPost]
        [Route("[action]")]
        public async Task<JsonResult> CadastrarUserSorteio([FromBody] NumeroEscolhidoRequest request)
        {
            var infopedido = "";
            var numbers = new List<NumeroEscolhido>();
            var _lista = request.numbers.Split(',');
            foreach (var item in _lista)
            {
                if (item.Length > 0)
                {
                    numbers.Add(new NumeroEscolhido
                    {
                        numero = Convert.ToInt32(item)
                    });
                    infopedido += item + ", ";
                }
            }
            infopedido = infopedido.Trim();
            infopedido = infopedido.Substring(0, infopedido.Length - 1);

            var body = new CadastrarUsuarioListaNumerosBody
            {
                id_sorteio = request.IdSorteio,
                usuario = new Domain.Models.EntityDomain.Usuario
                {
                    celular = request.Phone,
                    cpf = request.CPF,
                    nome = request.Nome,
                    email = request.Email
                },
                numeroSorteios = numbers,
                valor_total = request.valortotal
            };

            body.usuario.celular = body.usuario.celular.FormatPhoneNumber();
            var resultadoCadastro = await usuarioBusiness.CadastrarUsuarioCadastrarNumeros(body);

            // Adiciona Ordem
            infopedido = "Pagamento referente a reserva Nº." + resultadoCadastro.model.id_pedido.ToString() +
                         ", Nº Escolhido(s) [" + infopedido + "]";
            var ped = new PagSeguroOrder()
            {
                Description = infopedido,
                PayEnum = Integration.Pay.Model.PayEnum.PIX,
                Pedido = resultadoCadastro.model.id_pedido,
                MinutesOfExpiration = 30,
                TransactionAmount = request.valortotal,
                Payer = new Integration.Pay.Model.BasePayer
                {
#if DEBUG
                    Email = "impersoft@gmail.com",
#else
                    Email = request.Email,
#endif
                    FirstName = request.Nome,
                    LastName = " - "
                }
            };
            var r2 = await pay.AddOrder(ped);
            var r = new JsonResult(
                new
                {
                    xmessage = r2.xInfo,
                    pedido = resultadoCadastro.model.id_pedido
                }
            );

            return r;
        }
    }
}