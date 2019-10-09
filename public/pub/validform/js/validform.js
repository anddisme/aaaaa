$(function(){
    var getInfoObj=function(){
        return  $(this).parents(".form-group").children(".Validform_checktip").children(".Validform-info");
      }
    $("[datatype]").focusin(function(){
      if(this.timeout){clearTimeout(this.timeout);}
      var infoObj=getInfoObj.call(this);
      if(infoObj.siblings(".Validform_right").length!=0){
        return; 
      }
      infoObj.show().siblings().hide();
      
    }).focusout(function(){
      var infoObj=getInfoObj.call(this);
      this.timeout=setTimeout(function(){
        infoObj.hide().siblings(".Validform_wrong,.Validform_loading").show();
      },0);
    });
    var demo = $(".form-horizontal").Validform({
      btnSubmit:"#btn_sub",
      tiptype:2,
      postonce:true,
      ajaxPost:true,
      datatype:{
            "money":/^[0-9]+(.[0-9]{1,2})?$/, ///^[+-]?[0-9]+\.[0-9]{2}$/,
            "p_url":/[a-zA-Z][a-zA-Z0-9-]{2,200}$/,
            "agree":function(gets,obj,curform,regxp){
              var need=1,
                  emsg = obj.attr("errormsg"),
                  numselected=curform.find("input[name='"+obj.attr("name")+"']:checked").length;
			  alert(emsg);
              return  numselected >= need ? true : emsg;
            },
            "idcard":function(gets,obj,curform,datatype){
              var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];// 加权因子;
              var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];// 身份证验证位值，10代表X;
            
              if (gets.length == 15) {   
                return isValidityBrithBy15IdCard(gets);   
              }else if (gets.length == 18){   
                var a_idCard = gets.split("");// 得到身份证数组   
                if (isValidityBrithBy18IdCard(gets)&&isTrueValidateCodeBy18IdCard(a_idCard)) {   
                  return true;   
                }   
                return false;
              }
              return false;
              function isTrueValidateCodeBy18IdCard(a_idCard) {   
                var sum = 0; // 声明加权求和变量   
                if (a_idCard[17].toLowerCase() == 'x') {   
                  a_idCard[17] = 10;// 将最后位为x的验证码替换为10方便后续操作   
                }   
                for ( var i = 0; i < 17; i++) {   
                  sum += Wi[i] * a_idCard[i];// 加权求和   
                }   
                valCodePosition = sum % 11;// 得到验证码所位置   
                if (a_idCard[17] == ValideCode[valCodePosition]) {   
                  return true;   
                }
                return false;   
              }
              function isValidityBrithBy18IdCard(idCard18){   
                var year = idCard18.substring(6,10);   
                var month = idCard18.substring(10,12);   
                var day = idCard18.substring(12,14);   
                var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
                // 这里用getFullYear()获取年份，避免千年虫问题   
                if(temp_date.getFullYear()!=parseFloat(year) || temp_date.getMonth()!=parseFloat(month)-1 || temp_date.getDate()!=parseFloat(day)){   
                  return false;   
                }
                return true;   
              }
              function isValidityBrithBy15IdCard(idCard15){   
                var year =  idCard15.substring(6,8);   
                var month = idCard15.substring(8,10);   
                var day = idCard15.substring(10,12);
                var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
                // 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法   
                if(temp_date.getYear()!=parseFloat(year) || temp_date.getMonth()!=parseFloat(month)-1 || temp_date.getDate()!=parseFloat(day)){   
                  return false;   
                }
                return true;
              }
            }
      },
      beforeSubmit:function(curform){
        $("#btn_sub").attr({ disabled: "disabled" });  
      },
      callback:function(data){
		  
		console.log(data);

        switch(data.status){
          case 404:
            $('#Validform_alert_status').attr('class','Validform_alert_hits');
            $('.Validform_info').html('服务器繁忙，请稍后再试');
            setTimeout(function(){
              //window.location.reload();
            },1000);
          break;
          case '1':
            $('#Validform_alert_status').attr('class','Validform_alert_succ');
            $('.Validform_info').html(data.message);
            setTimeout(function(){
              if(data.url!=null&&data.url!=""){
                if(data.url=='reload'){
                  window.location.reload();
                }else{
                  window.location.href=data.url;
                }
              }else{
                window.location.reload();
              } 
            },1000);
          break;
          case '0':
            $('#Validform_alert_status').attr('class','Validform_alert_fail');
            $('.Validform_info').html(data.message);
            setTimeout(function(){
              window.location.reload();
            },1000);
          break;
          case '-1':
            $('#Validform_alert_status').attr('class','Validform_alert_fail');
            $('.Validform_info').html(data.message);
            setTimeout(function(){
			 $('#Validform_alert_status').attr('class','Validform_alert_fail');	
             $('.Validform_info').html();
			 $('#Validform_msg').hide();
			 editor.sync();
            },2000);			
			
          break;
        }
        $("#btn_sub").removeAttr("disabled");
      }
    });
})