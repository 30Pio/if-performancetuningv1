
var selected = false

$(document).ready(function() {
    $("#button").click(function(){
      $("#button").removeClass("active")
      $(this).addClass("active");
   });
})

$(function () {
    function display(bool) {
        if (bool) {
            $("body").show();
        } else {
            $("body").hide();
        }
    }
 
    display(false)
 
    window.addEventListener('message', function (event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        } else if (item.type === "add"){
           tuningteile(item.price, item.teil, item.teilid, item.getid)
        } else if (item.type === "clearlist"){
            $("#insert").html("");
            $("#totalprice").text("0 $")
        } else if (item.type === "locale"){
            $("#title").text(item.titlelocale)
            $("#description").text(item.descriptionlocale)
        }
     })    

})



function tuningteile(price, teil, teilid, getid){

        $("#insert").append
        (`
        <li>
          <button type="button" id="button" onclick="benutzen('`+getid+`', '`+teil+`', '`+teilid+`', '`+price+`')">
            <span>`+teil+`</span>
            <span>$ `+price+`</span>
          </button>
        </li>
        `);


      }

function teile(getid, teilid){
    $.post('http://if-performancetuning/selected', JSON.stringify({
        getid: getid, teilid: teilid,
    }));
}     

function esc(getid, teilid){
    $.post('http://if-performancetuning/exit', JSON.stringify({
        getid: getid, teilid: teilid,
    }));
}

function buy(price, getid, teilid){
    $.post('http://if-performancetuning/buy', JSON.stringify({
        price: price, getid: getid, teilid: teilid,
    }));
}

function buycash(price, getid, teilid){
    $.post('http://if-performancetuning/buycash', JSON.stringify({
        price: price, getid: getid, teilid: teilid,
    }));
}

function benutzen(getid, teil, teilid, price){

    document.onkeyup = function (data) {
        if (data.which == 27) {
            esc(getid, teilid)
        }
    };
    
    $.post('http://if-performancetuning/select', JSON.stringify({
        getid: getid, teil: teil, teilid: teilid, price: price, 
    }));


    $("#totalprice").text(price + " $")
    $(".footer__btns").html(`            
    <button type="button" onclick="buy('`+price+`','`+getid+`','`+teilid+`')" class="btn btn__primary">
    <img src="assets/img/bank-icon.svg" alt="bank-icon" />
    <span>Bank card</span>
  </button>

  <button type="button" onclick="buycash('`+price+`','`+getid+`','`+teilid+`')" class="btn btn__warning">
    <img src="assets/img/cash.svg" alt="cash-icon" />
    <span>Cash</span>
  </button>`)

  $("").html(`            
  <p>Exit the menu</p>
  <a id="test" href="#">
  <img src="assets/img/close.svg" onclick="esc('`+getid*`','`+teilid*`')" alt="close" />
  </a>
  `)
  

}