$('.square:odd').addClass('js-color1');
$('.square:even').addClass('js-color2');

setInterval(function(){ $('.square:even').toggleClass('js-color2').toggleClass('js-color1'); }, 500);
setInterval(function(){ $('.square:odd').toggleClass('js-color1').toggleClass('js-color2'); }, 500);
