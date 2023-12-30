$(document).ready(function () {
    $("#phone").mask('(00)00000-0000')
});


function OnClickButtonConfirm() {
    var id = $("#btnConfirm").data("id");
    // Localiza usuario
    if (id == 0) {
        FindPeople();
    }
    // Confirma Pedido
    else {
        ConfirmStore();
    }
}

function CopiarNumerosSelecionados() {
    var html = $("#numeros_selecionados").val();
    $("#numeros_selecionados_popup").replaceWith(html);
}

// Cadastro
function Confirmacao(Nome, CPF, Email) {

    var readonly = "readonly";
    if (Email == "") {
        readonly = "";
    }

    var html =
        '<div class="row" style="width:100%;margin-left:1px">' +
        '       <label for="fnome"><strong>Nome</strong></label>' +
        '       <input id="fnome" name="fnome" value="' + Nome + '"class="form-control" required>' +
        '</div>' +
        '<div class="row" style="width:100%">' +
        '   <div class="col">' +
        '       <label for="fcpf"><strong>CPF</strong></label>' +
        '       <input id="fcpf" name="fcpf" value="' + CPF + '" class="form-control" ' + readonly + '>' +
        '   </div>' +
        '   <div class="col">' +
        '       <label for="femail"><strong>E-mail</strong></label>' +
        '       <input id="femail" name="femail" value="' + Email + '" class="form-control" ' + readonly + '>' +
        '   </div>' +
        '</div>';

    $("#blockdatapeople").replaceWith(html);
    $("#blockphone").hide();
    

    $("#btnConfirm").text("CONFIRMAR RESERVA")
    $("#btnConfirm").attr("id", "1");
    
}

function FindPeople() {
    var phone = $("#phone").val();
    $.get("/api/v1/user/find/?phone=" + phone,
        function (data, textStatus, jqXHR) {
            Confirmacao(data.nome, data.cpf, data.email);
        },
        "json"
    );
}

async function ConfirmStore() {
    var settings = {
        "url": "/api/v1/user/CadastrarUserSorteio",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json"
        },
        "data": JSON.stringify({
            "idsorteio": $("#idSorteioSelecionado").val(),
            "cpf": $("#fcpf").val(),
            "nome": $("#fnome").val(),
            "phone": $("#phone").val(),
            "email": $("#femail").val(),
            "numbers": $(".numero-data").text(),
            "valortotal": $("#valor_total_visual").text().replace(',', '.')
        }),
    };

    var f = false;
    $.ajax(settings).done(function (response, textStatus) {
        if (textStatus == "success") {
            $("#modalGerarTicket").hide();
            ShowInfo(response.pedido);
        }
        else {
            f = false;
        }
    });
}

async function ShowInfo(response) {
    var r = await swal({
        icon: 'success',
        title: 'Sua reserva foi realizada com sucesso. Na próxima tela voce escolhera a forma de pagamento para confirmar a sua reserva!',
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: 'Ok'
    }).then((result) => {
        $(location).prop('href', '/ReservaFinish/' + response)
    })
}

