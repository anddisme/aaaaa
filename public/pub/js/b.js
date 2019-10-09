$(document).ready(function(){basesz();});
$(window).load(function(){


});
function basesz()
{
	$("a.blank").click(function(){window.open($(this).attr("href"));return false;});
	$("#sethome").click(function(){	return SetHome(this,location.href);});
	$("#addf").click(function(){return addFavorite();});
	//setInterval('time()',60)
	var s=$(".banner img").length;
	if (s==1){var bannerg=$(".banner img").attr("src");$(".banner").css("background-image","url("+bannerg+")");}
	$('.radio-list').each(function(){
		$(this).children('dd').click(function(){
			if ($(this).attr("class")!='no'){
			var idstr = this.id;
			var ids = idstr.split('_');
			$(this).parent().children('dd').removeClass('on');
			$(this).addClass('on');
			$("#" + ids[0]).val(ids[1]);
			$("[for='" + ids[0] + "']").remove();
			}
		});
	});
	int();
}
function fileval(str,objs)
{
	var F=$("#"+str+" li[class!='hide'] input[name=fileli]");
	var size=F.size();
	if (size>=0)
	{
		var selarr = new Array([size]);
		F.each(function(i){selarr[i]=F.eq(i).val();});
		$("#"+objs).val(selarr.join());
		return selarr.join();			
	}
	else
	{
		$("#"+objs).val('');
		return "";	
	}
}
function time()
{
	var myDate = new Date();
	var year=myDate.getFullYear();
	var month=myDate.getMonth()+1; 
	var day=myDate.getDate();
	var xq=myDate.getDay();
	var hour=myDate.getHours(); 
	var mints=myDate.getMinutes(); 
	xq='星期'+'日一二三四五六'.charAt(new Date().getDay());
	var stime=year+"年"+month+"月"+day+"日"+hour+"点"+mints+"分"+xq;
	$("#htime").html(stime);
}
function getdate(){var enable=0;today=new Date();var day;var date;if(today.getDay()==0){day=" 星期日"}if(today.getDay()==1){day=" 星期一"}if(today.getDay()==2){day=" 星期二"}if(today.getDay()==3){day=" 星期三"}if(today.getDay()==4){day=" 星期四"}if(today.getDay()==5){day=" 星期五"}if(today.getDay()==6){day=" 星期六"}date=(today.getFullYear())+"年"+(today.getMonth()+1)+"月"+today.getDate()+"日 ";document.write("今天是："+date+day)}function showT(){str="time";setInterval("document.getElementById(str).innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);}
function SetHome(obj,url){
  try{
    obj.style.behavior='url(#default#homepage)';
    obj.setHomePage(url);
  }catch(e){
    if(window.netscape){
     try{
       netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
     }catch(e){
       alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
     }
    }else{
    alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
    }
 }
}
function addFavorite() {
    var url = window.location;
    var title = document.title;
    var ua = navigator.userAgent.toLowerCase();
    if (ua.indexOf("360se") > -1) {
        alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
    }
    else if (ua.indexOf("msie 8") > -1) {
        window.external.AddToFavoritesBar(url, title); //IE8
    }
    else if (document.all) {
  try{
   window.external.addFavorite(url, title);
  }catch(e){
   alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
  }
    }
    else if (window.sidebar) {
        window.sidebar.addPanel(title, url, "");
    }
    else {
  alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
    }
}
function check_cnname(str){if (str.search(/^[\u0391-\uFFE5]+$/)==-1){return false;}else{return true;}}
function isEmail(str) {if (str.search(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/) == -1){return false;}else{return true;}}
function check_tel(str) {if (str.search(/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$|^((\(\d{2,3}\))|(\d{3}\-))?1\d{10}$/) == -1){return false;}else{return true;}}
function check_zip(str){if (str.search(/^[1-9]\d{5}$/)==-1){return false;}else{return true;}}
function check_zip2(str){if (str.search(/^[1-9]\d{3}$/)==-1){return false;}else{return true;}}
function check_qq(str){if (str.search(/^[1-9]\d{4,13}$/)==-1){return false;}else{return true;}}
function check_qq2(str){if (str.search(/^[1-9]\d{0,11}$/)==-1){return false;}else{return true;}}
function check_age(str){if (str.search(/^[1-9]\d{1}$/)==-1){return false;}else{return true;}}
function check_num(str){if (str.search(/^((\(\d{2,3}\))|(\d{3}\-))?1\d{10}$/)==-1 && str!="") {return false;}else{return true;}}
function check_time(str){if (str.search(/^(\d{4})\-(\d{2})\-(\d{2})$/)==-1){return false;}else{return true;}}
function check_chinese(str){if (str.search(/^([\u4E00-\uFA29]|[\uE7C7-\uE7F3])*$/)==-1){return false;}else{return true;}}
function isRegisterUserName(s)  
{  
var patrn=/^[a-zA-Z]{1}([a-zA-Z0-9]|[_]){5,19}$/;  
if (!patrn.exec(s)) return false
return true
}
function int()
{	
	$(".int").keyup(function(){
		if(event.keyCode!=9&&event.keyCode!=37&&event.keyCode!=39){
			var t=$(this).val();
			var ms=t.replace(/\D/g,'');
			if (ms=="0"){ms=""}
			$(this).val(ms);
		}
	});
}

function getint(str)
{
	var t=$("#"+str).val();var ms=t.replace(/\D/g,'');if (ms=="0"){ms=""}$("#"+str).val(ms);	
}
function len(str)
{
     var i,sum;
     sum=0;
     for(i=0;i<str.length;i++)
     {
         if ((str.charCodeAt(i)>=0) && (str.charCodeAt(i)<=255))
             sum=sum+1;
         else
             sum=sum+2;
     }
     return sum;
}
function str_replace(search, replace, subject, count){
     var i = 0, j = 0, temp = '', repl = '', sl = 0, fl = 0,
            f = [].concat(search),
            r = [].concat(replace),
            s = subject,
            ra = r instanceof Array, sa = s instanceof Array;
    s = [].concat(s);
    if(count){
        this.window[count] = 0;
    }
 
    for(i=0, sl=s.length; i < sl; i++){
        if(s[i] === ''){
            continue;
        }
        for(j=0, fl=f.length; j < fl; j++){
            temp = s[i]+'';
            repl = ra ? (r[j] !== undefined ? r[j] : '') : r[0];
            s[i] = (temp).split(f[j]).join(repl);
            if(count && s[i] !== temp){
                this.window[count] += (temp.length-s[i].length)/f[j].length;}
        }
    }
    return sa ? s : s[0];
}
function tihuan(str,str1,str2){return str_replace(str1,str2,str,10000)}
function get(str)
{
	var F=$("input[name="+str+"]");
	var size=F.size();
	if (size>0)
	{
		var selarr = new Array([size]);
		F.each(function(i){selarr[i]=F.eq(i).val();});
		return selarr.join();	
	}
	else
	{
		return "";	
	}
}
function gval2(str)
{
	var F=$("input[name="+str+"]:checked");
	var size=F.size();
	if (size>0)
	{
		var selarr = new Array([size]);
		F.each(function(i){selarr[i]=F.eq(i).val();});
		return selarr.join();	
	}
	else
	{
		return "";	
	}
}
function gval(str)
{
	return $("#"+str).val();	
}
function ghtm(obj){return obj.prop("outerHTML");}
function jlide(obj1,obj2,w,s,lt,rt,ty)
{
	$(obj1).each(function(index, element) {
		var obj_1=$(this);
		var obj_2=$(this).find(lt);
		var obj_3=$(this).find(rt);
		var obj_4=$(this).find(obj2);
		var obj_5=$(this).find(obj2+" li");
		var s8=obj_5.length;			
		var f8=1;
		var pgsize=s;
		var liw=w;
		var page8=Math.ceil(s8/pgsize);
		var mod2=s8%pgsize;
		var mod=pgsize-mod2;
		var mc=pgsize*liw;
		var tc="";
		if (s8>s)
		{	
			if (mod2>0)
			{
				for (i=0;i<mod;i++)
				{
					tc+="<li></li>";	
				}
				obj_4.append(tc);
			}
			var htm=obj_4.html();
			var objn=obj_5.eq(s8-1);
			var objf=obj_5.eq(0);
			var lasth=ghtm(objn);
			var firsth=ghtm(objf);
			obj_4.html(htm+htm+htm);
			if (ty=="top"){obj_4.css("margin-top","-"+(page8*mc)+"px");}else{
			obj_4.css("margin-left","-"+(page8*mc)+"px");}	
			obj_3.click(function(){
				f8++;
				if (ty=="top"){obj_4.animate({top:-(f8-1)*mc+"px"});}else{obj_4.animate({left:-(f8-1)*mc+"px"});}
				//alert("top");
				if (f8>page8)
				{
					if (ty=="top")
					{
						
						obj_4.animate({top:-(f8-1)*mc+"px"},300,function(){obj_4.animate({top:"0px"},0);});
					}
					else
					{
						obj_4.animate({left:-(f8-1)*mc+"px"},300,function(){obj_4.animate({left:"0px"},0);});
					}
					f8=1;
				}
				return false;
			});
			obj_2.click(function(){
				f8--;
				if (ty=="top"){obj_4.animate({top:-(f8-1)*mc+"px"});}else{obj_4.animate({left:-(f8-1)*mc+"px"});}
				if (f8<1)
				{
					if (ty=="top")
					{
						obj_4.animate({top:-(f8-1)*mc+"px"},300,function(){obj_4.animate({top:-((page8-1)*mc)+"px"},0);});
					}
					else
					{
						obj_4.animate({left:-(f8-1)*mc+"px"},300,function(){obj_4.animate({left:-((page8-1)*mc)+"px"},0);});
					}
					f8=page8;
				}
				return false;
			});
			var obj55=obj_1.find(obj2+" li");
			obj55.click(function(){
				obj55.removeClass("sa")
				$(this).addClass("sa");
				var sg=$(this).find("img").attr("src");
				$("#big img").attr("src",sg); 
			});
		}
	});
}



/**/

/**
 * 表单验证，指明错误放置的位置
 */
function validErrorPlacement(error, label)
{
	error.appendTo(label.parent());
	if ($(label).hasClass('longtext'))
	{
		$(label).parent().addClass('ex470');
	}
}

/**
 * 表单验证，指明错误放置的位置
 */
function validSuccess(label)
{
	$(label).closest('.input_box').removeClass("wrong").addClass('right');
}

/**
 * 表单验证，指明错误放置的位置
 */
function validHighlight(label)
{
	$(label).closest('.input_box').removeClass("right").addClass('wrong');
}

/**
 * 验证手机号
 */
function checkMobile(mobile)
{
	var mobile = $.trim(mobile);
	//匹配手机号
	var reg = /^1[3|4|5|8][0-9]\d{8}$/;
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
 * @author nieyanlong
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
		location.href = "#" + div;
	}
	return false;
}

/**
* 提示信息
* @author nieyanlong
 * @param string txt
 * */
function alertMsg(txt, closeSecond)
{	
	$("#alertcontent").html(txt);
	$("#alertLink").click();
	var secs = closeSecond || 0; //倒计时的秒数
	if (secs > 0)
	{
		window.setTimeout('window.location.reload()', secs * 1000);
	}
}
