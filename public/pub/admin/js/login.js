 document.onkeydown = function (e) {
  var theEvent = window.event || e;//兼容IE和FF
  var code = theEvent.keyCode || theEvent.which;
  if (code == 13) {
    submit_login('?m=login&act=login');
   }
}   
function checkEmail(email){ 
  var re = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
  var result = re.test(email); 
  return result;  
} 
function submit_login(url){
  var username = $('#UserName').val();
  var password = $('#PassWord').val();
 // var yzm = $('#yzm').val();
  var eInfo="";
  if(username!=null&&username!=""){
    if(password!=null&&password!=""){
       checkUser(url);
    }else{
      showInfo(1,'请输入密码。');
    }
  }else{  
    showInfo(1,'请输入用户名。');
  }
}  
function showInfo(status,message){
  var eInfo = $('#eInfo');
  var sInfo = $('#sInfo');
  if(status>0){
    eInfo.show();
  }else{
    eInfo.hide();
  }
  sInfo.text(message);
} 
/*function checkUser(url){ 
  var data = $("form").serialize(); 
  $.ajax({
    url: url,
    type: 'post',
    data: data,
    dataType: 'json',
    beforeSend: function () {
        $("#sub_btn").text('登录中..');
        $("#sub_btn").attr({ disabled: "disabled" });
    },
    success:function(d){
        if(d.status>0){
          window.location.href=d.url;
        }else{
			alert(d);
			return false;
          if(d.isVerify>0){
            $('#isverify').removeClass('hide');
          }
         // freshVerify();

          showInfo(1,d.message);
        }
      },
    complete: function () {
      $("#sub_btn").removeAttr("disabled");
      $("#sub_btn").text('登录');
    },
    error:function(){
      $("#sub_btn").removeAttr("disabled");
      $("#sub_btn").text('登录');
      showInfo(1,'登录失败，请重试!');
    }
  });  
}
*/
function freshVerify() {  
  var verifyImg = $('#verifyImg');  
  var verifyImg_src = verifyImg.attr("src");  
  if( verifyImg_src.indexOf('?')>0){  
      verifyImg.attr("src", verifyImg_src+'&random='+Math.random());  
  }else{  
      verifyImg.attr("src", verifyImg_src.replace(/\?.*$/,'')+'?'+Math.random());  
  }  
}  