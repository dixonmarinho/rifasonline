$(document).ready(function () {

});


function ConfirmarPagamento(idPedido) {
    $('#modalConfirmarPagamento').modal();
    $('#idPedidoSelecionado').val(idPedido)
}

function CancelarPagamento(idPedido) {
    $('#modalCancelarPagamento').modal();
    $('#idPedidoSelecionado').val(idPedido)
}

function ConfirmarPagamentoRecebido() {

    var idPedido = parseInt($("#idPedidoSelecionado").val());

    $.ajax({
        url: "/Sorteios/ConfirmarPagamentoRecebido/" + idPedido,
        type: "GET",
        contentType: 'application/json; charset=UTF-8',
        dataType: "json",
        success: function (response) {
            if (!response.erro) {
                swal("Sucesso", response.mensagem, "success")
                    .then((okay) => {
                        window.location.reload(true);
                    });
            }
            else {
                swal("Opss", response.mensagem, "error");
            }
        },
        error: function (response) {
            swal("Erro", "Aconteceu um imprevisto. Contate o administrador", "error");
            console.log(response);
        }
    });
}

function CancelarReserva() {

    var idPedido = parseInt($("#idPedidoSelecionado").val());

    $.ajax({
        url: "/Sorteios/CancelarReserva/" + idPedido,
        type: "GET",
        contentType: 'application/json; charset=UTF-8',
        dataType: "json",
        success: function (response) {
            if (!response.erro) {
                swal("Sucesso", response.mensagem, "success")
                    .then((okay) => {
                        window.location.reload(true);
                    });
            }
            else {
                swal("Opss", response.mensagem, "error");
            }
        },
        error: function (response) {
            swal("Erro", "Aconteceu um imprevisto. Contate o administrador", "error");
            console.log(response);
        }
    });
}


function Search(idsorteio) {
    // Declare variables
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myinput" + idsorteio);
    filter = input.value.toUpperCase();
    table = document.getElementById("table" + idsorteio);
    tr = table.getElementsByTagName("tr");

    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}