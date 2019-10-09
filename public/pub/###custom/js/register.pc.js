function showAgreement(){
  $('#agreement').addClass("show").removeClass('hide');
}
function hideAgreement(){
  $('#agreement').removeClass("show").addClass('hide');
}
function radioIdentify(obj){
  var identify = $(obj).attr('identify');
  $('#inputIdentify').val(identify);
  $(obj).parent().parent().find('a').removeClass('active');
  $(obj).addClass('active');
  if(identify=='business'){
  	$('#registerMold').removeClass('hide');
  }else{
  	$('#registerMold').addClass('hide');
  }
}