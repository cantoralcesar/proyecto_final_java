// Definiendo el valor del ticket
const ticket = 200;

// Definiendo lso descuentos
let descEstudiante = 0.80;
let descTraine = 0.50;
let descJunior = 0.15;

// Tomando elementos
const formulario = document.getElementById('formulario');
const categoria = document.getElementById('selectCategoria');
const cantidad = document.getElementById('cantidadInput');
const totalPagar = document.getElementById('totalToPay');
const btnResumen = document.getElementById('btnSummary');

// console.log(categoria.value)
function calcularPago() {
    let total = cantidad.value * ticket;
    // Condicionando por descuento
    switch (categoria.value) {
        case "estudiante":
            total = total - (total * descEstudiante) ;
            break;
        case "traine":
            total = total - (total * descTraine);
            break;
        case "junior":
            total = total - (total * descJunior);
            break;
        default:
            break;
    }

    totalPagar.textContent = `Total a Pagar por ${cantidad.value} personas: $ ${total}`;
}

btnResumen.addEventListener('click', (e)=>{
    e.preventDefault()
    calcularPago()
});