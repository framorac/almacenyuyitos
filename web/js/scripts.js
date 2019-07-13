/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function ObtenerIdFam()
{
    var fam = document.getElementById("familia").value;
    if (fam.length === 1) {
        document.getElementById("codigoProd").value = "00" + fam;
    } else if (fam.length === 2) {
        document.getElementById("codigoProd").value = "0" + fam;
    } else {
        document.getElementById("codigoProd").value = fam;
    }
}

function ObtenerIdSub()
{
    var subf = document.getElementById("idSubFamilia").value;
    var cod = document.getElementById("codigoProd").value;
    if (subf.length === 1) {
        document.getElementById("codigoProd").value = cod + "00" + subf;
    } else if (subf.length === 2) {
        document.getElementById("codigoProd").value = cod + "0" + subf;
    } else {
        document.getElementById("codigoProd").value = cod + subf;
    }
}

function ObtenerIdPro()
{
    /* Para obtener el valor */
    var prov = document.getElementById("idProveedor").value;
    var cod = document.getElementById("codigoProd").value;
    if (prov.length === 1) {
        document.getElementById("codigoProd").value = cod + "00" + prov;
    } else if (prov.length === 2) {
        document.getElementById("codigoProd").value = cod + "0" + prov;
    } else {
        document.getElementById("codigoProd").value = cod + prov;
    }
}

function ObtenerFechaVen()
{
    var fven = document.getElementById("fechaVencimiento").value;
    var cod = document.getElementById("codigoProd").value;
    var fecha = fven.split("-");
    document.getElementById("codigoProd").value = cod + fecha.join("");
}

$("#btnBarra").click(function () {
    var codigoBarra = document.getElementById("codigoProd").value;
    $("#codBarra").JsBarcode(codigoBarra);
});