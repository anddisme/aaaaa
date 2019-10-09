$(function(){
  $('form.login-form input').focus(function(){
    var vv = $(this).val().replace(/\?.*$/,'');
    if(vv==null || vv==''){
      showAlert($(this),'nullmsg','');
    }
  });
  $('form.login-form input').blur(function(){
    var vv = $(this).val().replace(/\?.*$/,'');
    var tt = $(this).attr('name');
    if(vv!=null && vv!=''){
      switch(tt){
        case 'phone':
        checkPhone();
        break;
        case 'password':
        checkPassword();
        break;
      }
    }
  });
});
document.onkeydown = function (e) {
  var theEvent = window.event || e;//兼容IE和FF
  var code = theEvent.keyCode || theEvent.which;
  if (code == 13) {
    submitLogin();
  }
}   
function checkEmail(email){ 
  var re = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
  var result = re.test(email); 
  return result;  
} 
function checkPhone(){
  var result = true; 
  var obj = $('#phone');
  var phone = obj.val().replace(/\?.*$/,'');
  var re = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/;
  if(re.test(phone)){
    $.ajax({
      url:'Ajax/Verify/lValidPhone',
      type:'POST',
      datatype:'html',
      async:false,
      data:{'param':phone},
      success:function(d){
        if (d=='y') {
          result = true;
          hideAlert(obj);
        }else{
          showAlert(obj,'',d);
          result = false;
        }
      }
    });
  }else{
    showAlert(obj,'errormsg','');
  }
  return result; 
}
function checkPassword(){
  var obj = $('#password');
  var password = obj.val().replace(/\?.*$/,'');
  var re = /^.{6,18}$/;
  if(re.test(password)){
    hideAlert(obj);
    return true;
  }else{
    showAlert(obj,'errormsg','');
    return false;
  } 
}
function submitLogin(){
  if(checkPhone() && checkPassword()){
    var phone = $('input[name=phone]').val().replace(/\?.*$/,'');
    var password = $('input[name=password]').val().replace(/\?.*$/,'');
    var rurl = $('input[name=rurl]').val().replace(/\?.*$/,'');
    var isremember = $('input[name=isremember]').is(':checked');
    isremember = (isremember) ? 'Y' :'N';
    var md5Password = $.md5(password);
    $.ajax({
      url: '/Home/Account/saveLogin',
      type: 'post',
      data: {"phone":phone,"password":md5Password,"rurl":rurl,'isremember':isremember},
      dataType: 'json',
      beforeSend: function () {
          $("#sub_btn").text('登录中..');
          $("#sub_btn").attr({ disabled: "disabled" });
      },
      success:function(d){
        if(d.status>0){
          window.location.href=d.url;
        }else{
          showAlert($('#phone'),'',d.message);
        }
      },
      complete: function () {
          $("#sub_btn").removeAttr("disabled");
          $("#sub_btn").text('登录');
      },
      error: function (data) {
          showInfo(1,"提交失败。");
          $("#sub_btn").removeAttr("disabled");
          $("#sub_btn").text('登录');
      }
    });  
  }
}  
function showAlert(obj,attr,msg){
  if(attr!=null&&attr!=''){
    msg = $(obj).attr(attr);
  }
  $(obj).parent().parent().find('.login-alert').html(msg);
}
function hideAlert(obj){
  $(obj).parent().parent().find('.login-alert').html('');
}
function freshVerify() {  
  var verifyImg = $('#verifyImg');  
  var verifyImg_src = verifyImg.attr("src");  
  if( verifyImg_src.indexOf('?')>0){  
      verifyImg.attr("src", verifyImg_src+'&random='+Math.random());  
  }else{  
      verifyImg.attr("src", verifyImg_src.replace(/\?.*$/,'')+'?'+Math.random());  
  }  
}  