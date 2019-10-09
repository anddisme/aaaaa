var isSubmit = false;
$(function(){ 
    if (jQuery.validator)
    {
        /**
        * 控件添加表单验证 - 手机号码验证
        */
        jQuery.validator.addMethod("mobile", function(value, element) {
            var length = value.length;
            return this.optional(element) || (11 == length && /^(1[3|4|5|7|8]\d{9})$/.test(value));
        }, "手机号格式不正确");
        
	
        jQuery.validator.addMethod("userpass", function(value, element) {
            var chrnum = /^[a-zA-Z0-9\-~!@#$%^&*()=_|"\'?.,+{}[\]`:]{6,18}$/;
            return this.optional(element) || (chrnum.test(value));
        }, "密码为6-18位的数字或字符");
        
        jQuery.validator.addMethod("checkMoney", function(value, element) {
            var chrnum = /(^[-+]?[1-9]\d*(\.\d{1,2})?$)|(^[-+]?[0]{1}(\.\d{1,2})?$)/;
            return this.optional(element) || (chrnum.test(value));
        }, "请输入正确的金额");
        
        jQuery.validator.addMethod("practicenumber", function(value, element) {
            var chrnum = /(^[0-9]{17}$)/;
            return this.optional(element) || (chrnum.test(value));
        }, "请输入正确的执业证号");
         
        jQuery.validator.addMethod("accountingnumber", function(value, element) {
            var chrnum = /(^[0-9]{5,30}$)/;
            return this.optional(element) || (chrnum.test(value));
        }, "请输入正确的执业证号");
        
        // 邮政编码验证   
        jQuery.validator.addMethod("isZipCode", function(value, element) {   
            var tel = /^[0-9]{6}$/;
            return this.optional(element) || (tel.test(value));
        }, "请正确填写您的邮政编码");
    }
    
    /**
	 * 按enter自动提交表单
	 */
	$("input").keydown(function(e){
	      var keyCode = e.keyCode ? e.keyCode : e.which ? e.which : e.charCode;
	      if (keyCode == 13){
	    	  var form = $(this).parents('form').eq(0);
	    	  if ('undefined' == typeof (form.attr('noEnter')))
	    	  {
	      		$(this).parent().submit();
	    	  }
	      }
	});
	
	$('body').on('click', '[data-role=qqask]', function(){
    	$("#BizQQWPA").click();
    	$.get('/stat/refer/type/1.html');
    });
	
	
	if(!CookieEnable())
	{  
	    alert("对不起，您的浏览器的Cookie功能被禁用，请开启");        
	}
});


// 表单提交公共函数
function submitForm(url, formId, callBackFunc)
{
	if(isSubmit) return false;
	isSubmit = true;
	$.post(url, $("#" + formId).serialize(), function(result)
	{
		isSubmit = false;
		
		if ('undefined' != typeof(callBackFunc))
		{
			callBackFunc(result);
			return ;
		}
		if (true == result.ret)
		{
			if ('undefined' != typeof(result.data.url) && '' != result.data.url)
			{
				window.location.href = result.data.url;
			}
		}
		else
		{
			// 未登录则弹出登录框
			if ('undefined' != typeof(result.code) && 10001 == result.code && $("#quReg").length > 0)
			{
				//Base.alert($("#quReg").val(), '快速注册 ', 860, 475);
				showLoginWindow();
				return ;
			}
			Base.alertTime(result.msg);
			if (5000 == result.code)
			{
				location.reload();
			}
		}
	});
}

function showLoginWindow(isLogin)
{
	isLogin = isLogin || 0;
	if (isLogin)
	{
		Base.alert($("#quReg1").val(), '快速注册 ', 860, 475);
	}
	else
	{
		Base.alert($("#quReg").val(), '快速注册 ', 860, 475);
	}
	
}

/**
 * js检查手机号是否合法
 */
function checkMobile(mobile)
{
	var mobile = $.trim(mobile);
	var reg = /^1[3-9][0-9]\d{8}$/;
	if (reg.test(mobile))
	{
		return true;
	}
	else
	{
		return false;
	}
}

/**
 * 异步获得分页信息
 * @param url 地址
 * @param div 存放信息的Dom容器ID
 * @param redirect 是否定位锚点
 */
function getAjaxPageData(url, div, redirect)
{
	var div = div || 'ajaxPageDiv';
	var redirect = redirect || false;
	$.getJSON(url, function(rt){
		$("#" + div).html(rt);
	});
	if (redirect)
	{
		//location.href = "#" + div;
		$.scrollTo("#" + div,100);

	}
	return false;
}

/**
 * 评论点赞
 */
function addEvaluationNice(eid, type)
{
	type = type || 'add';
	eid = eid || 0;
	$.getJSON('/evaluation/addnice/eid/' + eid + '/type/' + type, function(rt){
		if (rt.ret)
		{
			if ('add' == type)
			{
				var htm = '<a class="cur" href="javascript:void(0);" onclick="addEvaluationNice(' + eid + ', \'reduce\');">点赞</a>('+rt.data+')';
				$('#nice_' + eid).html(htm);
			}
			else
			{
				var htm = '<a href="javascript:void(0);" onclick="addEvaluationNice(' + eid + ', \'add\');">点赞</a>('+rt.data+')';
				$('#nice_' + eid).html(htm);
			}
		}
		else
		{
			if ('请先登录' == rt.msg)
			{
				Base.alert($("#quReg1").val(), '登录 ', 825, 365);
			}
			else
			{
				Base.alertTime(rt.msg);
			}
		}
	});
}

/**
 * 评论点赞
 */
function addQaUseful(eid, type)
{
	type = type || 'add';
	eid = eid || 0;
	$.getJSON('/qa/adduseful/qid/' + eid + '/type/' + type, function(rt){
		if (rt.ret)
		{
			if ('add' == type)
			{
				var htm = '<a class="cur" href="javascript:void(0);" onclick="addQaUseful(' + eid + ', \'reduce\');"></a>有用('+rt.data+')';
				$('#useful_' + eid).html(htm);
			}
			else
			{
				var htm = '<a href="javascript:void(0);" onclick="addQaUseful(' + eid + ', \'add\');"></a>有用('+rt.data+')';
				$('#useful_' + eid).html(htm);
			}
		}
		else
		{
			if ('请先登录' == rt.msg)
			{
				Base.alert($("#quReg1").val(), '登录 ', 825, 365);
			}
			else
			{
				Base.alertTime(rt.msg);
			}
		}
	});
}

/**
 * 表单验证，指明错误放置的位置
 */
function validErrorPlacement(error, label)
{
	//error.appendTo(label.parent().parent());
	label.parent().parent().after(error);
}

/**
 * 读取顶部登录状态显示
 * @return
 */
function loadLoginState()
{
	$("#loginbar").load("/index/loginstate.html");
}

/**
 * 变更用户所在城市
 * @return
 */
function changeCity(pid, cid)
{
	$.getJSON('/index/changecity/pid/' + pid + '/cid/' + cid, function(rt){
		window.location.reload();
	});
}

/**
 * 仅允许键入数字
 * @return
 */
function numberFilter(oElement) 
{
	var num = oElement.value.replace(/[^\d]+/gi, "");
	if (num < 1)
	{
		num = 1;
	}
    oElement.value = num;
}

/**
 * 动态改变多维radio的name
 * 参数请传表单id
 * @param arr
 */
function listRadio(formId)
{
	var name = '';
	var index = 0;
	var valuearr = [];
	var arr = []

	var chrstr = /^[a-zA-Z0-9-_]*\[[a-zA-Z0-9-_]+\]\[/;
	$("#" + formId + " input[type='radio']").each(function(){
		str = chrstr.exec($(this).attr('name'));
		if (str && str[0])
		{
			arr.push(str[0]);
		}
	});
	
	for (i in arr)
	{
		name = arr[i];
		if (name)
		{
			valuearr = [];
			
			$("#" + formId + " input[type='radio'][name^='" + name + "']").each(function(){
				if (-1 == $.inArray($(this).val(), valuearr))
				{
					valuearr.push($(this).val());
				}
			});
			
			for (var j = 0; j < valuearr.length; j++)
			{
				index = 0;
				$("#" + formId + " input[type='radio'][name^='" + name + "'][value='" + valuearr[j] + "']").each(function(){
					$(this).attr('name', $(this).attr('name').replace(/\[\d*\]/, '[' + (index++) + ']'));
				});
			}
			
		}
	}
}

function CookieEnable()
{  
    var result=false;  
    if(navigator.cookiesEnabled)  return true;  

    document.cookie = "testcookie=yes;";  

    var cookieSet = document.cookie;  

    if (cookieSet.indexOf("testcookie=yes") > -1)  result=true;  
     
     document.cookie = "";  
      
    return result;  
}

function openZixun(key)
{
	key = key || 'gs';
	var mapping = { 'gs' : 'kf_9178_1457078402761',
					'cs' : 'kf_9178_1457078402761',
					'fl' : 'kf_9178_1458099405473',
					'zc' : 'kf_9178_1457078701232',
					'sb' : 'kf_9178_1457077912392'};
	var v = typeof (mapping[key]) == 'undefined' ? 'kf_9178_1457078402761' : mapping[key];
	NTKF.im_openInPageChat(v);
}
// 格式化数值变量
function fnum(num)
{
	return num.toFixed(2).replace('.00', '')
}

//加法（返回string）
Number.prototype.add = function(arg)
{
    var r1,r2,m;   
    try{r1=this.toString().split(".")[1].length}catch(e){r1=0}   
    try{r2=arg.toString().split(".")[1].length}catch(e){r2=0}   
    m=Math.pow(10,Math.max(r1,r2))   
    return fnum((this * m + arg * m) / m);
}  

//减法（返回string）
Number.prototype.sub = function (arg)
{   
	return this.add(-arg);   
}   

//乘法（返回string）
Number.prototype.mul = function (arg)   
{   
	var m=0,s1=this.toString(),s2=arg.toString();   
	try{m+=s1.split(".")[1].length}catch(e){}   
	try{m+=s2.split(".")[1].length}catch(e){}   
	return fnum(Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m));
}   

//除法（返回string）
Number.prototype.div = function (arg)
{   
	var t1=0,t2=0,r1,r2;   
	try{t1=this.toString().split(".")[1].length}catch(e){}   
	try{t2=arg.toString().split(".")[1].length}catch(e){}
	with(Math){   
	    r1=Number(this.toString().replace(".",""))   
	    r2=Number(arg.toString().replace(".",""))   
	    return fnum((r1/r2)*pow(10,t2-t1));
	}
}



