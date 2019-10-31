jQuery(function($){

$(window).on('scroll', function(){

if( $(window).scrollTop()>205 ){

$('#sp-menu-wrapper').addClass('menu-fixed');
} 
else {

$('#sp-menu-wrapper').removeClass('menu-fixed');
}

});

});