function fwrite_submit(f) 
{
	$.ajax({
		type:"POST",
		url:"/do.php?act=msg",
		data: $("#"+f).serialize(),
		success:function(msg){/*alert(msg)*/
            if (msg=="ok"){alert("留言成功！请等待管理员审核！");location.reload();return false;}
			else{alert("验证码错误");return false;}
		}
	});
	return false;
}
function umit(f,a) 
{
	var drg55=gval("drg55");
	var drg5=get("drg5");
	if (drg5!=drg55 && a=="ureg"){$("#"+f).find(".serror").html("两次密码输入不一致");return false;}
	
	if (f=="ddds")
	{
		var pty=gval2("zpay");
		if (pty==""){$("#"+f).find(".serror").html("请选择支付方式");return false;}	
	}
	$.ajax({
		type:"POST",
		url:"/do.php?act="+a,
		data: $("#"+f).serialize(),
		success:function(msg){
			
			if (msg=="c"){$("#"+f).find(".serror").html("验证码错误");$('#getcode,#gcode').click();return false;}
            if (msg=="ok"){location.reload();return false;}
			if (msg=="upok"){$("#"+f).find(".serror").html("修改成功");return false;}
			if (msg=="okr"){$("#"+f).find(".serror").html("注册成功！");setTimeout("location.reload()",1000);}			
			else{$("#"+f).find(".serror").html(msg);return false;}
		}
	});
	return false;
}