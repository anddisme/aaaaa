var wait=60;
$(function(){
  if($('#inputPhone').val()) $('#inputPhone').blur();
});
function getPhoneVerify(){
  var phone = $('#inputPhone').val().replace(/\?.*$/,'');
  if(phone!=null&&phone!=""){
    var m = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/;
    if(m.test(phone)){
       if(sendVerify(phone)){
         togglePhoneVerifyBtn(1);
         wait=60;
         waitTime();
       }else{
        $("#inputPhone").blur();
       }
    }else{
      $("#inputPhone").blur();
    }
  }else{
    $("#inputPhone").blur();
  }
}
function sendVerify(phone){
  var isSend = false;
  var mold = $('#inputPhoneVerify').attr('mold');
  $.ajax({
    url:"/Plugin/Phone/sendVerify",
    data:{"phone":phone,"mold":mold},
    dataType:"json",
    async:false,
    type:"post",
    beforeSend:function(){
      $('#phoneVerifyWrap').children('a').html('短信发送中..');
    },
    success:function(d){
       if (d.status>0) {
         isSend=true;
       }else{
         isSend=false;
       }
    }
  });
  return isSend;
}
function togglePhoneVerifyBtn(send){
  if (send) {
    //发送成功
    $('#phoneVerifyWrap').children('a').remove();
    $('#phoneVerifyWrap').append('<span class="input-group-addon send_sp">重新发送('+wait+')</span>');
  }else{
    $('#phoneVerifyWrap').children('span').remove();
    $('#phoneVerifyWrap').append('<a class="input-group-addon send_btn" href="javascript:;" id="basic-addon2" onclick="getPhoneVerify()">获取验证码</a>');
  }
}
function waitTime(){
  if(wait==0){
    togglePhoneVerifyBtn(0);
  }else{
    $('#phoneVerifyWrap').children('span').text("重新发送("+wait+")");
    wait--;
    setTimeout(function(){waitTime()},1000);
  }
}  