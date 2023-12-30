using Integration.Pay.Helpers;
using Integration.Pay.Model;
using Integration.Pay.Model.Request;
using MercadoPago.Client;
using MercadoPago.Client.Payment;
using MercadoPago.Config;
using System;
using System.Threading.Tasks;

namespace Integration.Pay.Gateway
{
    public class PagSeguro
    {
        private PaymentClient client;
        private RequestOptions requestOpt;

        public PagSeguro(string token)
        {
            MercadoPagoConfig.AccessToken = token;
            requestOpt = new RequestOptions();
            requestOpt.AccessToken = token;
            client = new PaymentClient();
        }

        public async Task<ResponseOrder> Order(PagSeguroOrder order)
        {
            var MercadoPagoOrder = new PaymentCreateRequest
            {
                PaymentMethodId = "pix",
                TransactionAmount = order.TransactionAmount,
                Installments = 1,
                DateOfExpiration = DateTime.Now.AddMinutes(order.MinutesOfExpiration),
                Description = order.Description,
                //ExternalReference = "PEDIDO" // Referencia do Sistema (Numero do Pedido)
                NotificationUrl = "https://vippremiosrn.com/api/v1/Pay/Notify/",
                Payer = new PaymentPayerRequest
                {
                    Email = order.Payer.Email,
                    FirstName = order.Payer.FirstName,
                    LastName = order.Payer.LastName
                }
            };

            var r = new ResponseOrder();
            try
            {
                var payment = await client.CreateAsync(MercadoPagoOrder, requestOpt);
                r.QRCodeURLGov = payment.PointOfInteraction.TransactionData.QrCode;
                r.QRCodeGUID = Guid.NewGuid().ToString();
                r.QRCodeBitMap = payment.PointOfInteraction.TransactionData.QrCodeBase64.GenQRCode(200, 200);
                r.IsOK = payment.ApiResponse.StatusCode == 201;
            }
            catch (Exception e)
            {
                r.IsOK = false;
            }
            return r;
        }
    }
}