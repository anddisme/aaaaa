$(function(){/*input();*/})

function editid(id,w,h){
	var editor=CKEDITOR.replace(id,{width:w,height:h});
	CKFinder.SetupCKEditor(editor,'../ckfinder/' );
	$("#content",parent.document).height($("body").height()+200);
	$("#"+id).data("editorobj",editor);
	CollectGarbage();
}
function BrowseServer(inputId) 
{ 
var finder = new CKFinder() ; 
finder.basePath = '../ckfinder/'; //导入CKFinder的路径 
finder.selectActionFunction = SetFileField; //设置文件被选中时的函数 
finder.selectActionData = inputId; //接收地址的input ID 
finder.popup() ; 
} 
//文件选中时执行 
function SetFileField(fileUrl,data) 
{ 
document.getElementById(data["selectActionData"]).value = fileUrl ; 
} 
function check_age(str){if (str.search(/^[1-9]\d{1,8}$/)==-1){return false;}else{return true;}}
function insertimglist(id)
{
	var size=$("tbody#"+id+" tr").size()+1;
	var htmls="<tr id='s"+id+""+size+"'><td align=right>添加附件"+size+"：</td><td><input id='"+id+""+size+"' name='"+id+"' class='SAdditionalimglist"+id+"' size='30' /> <span><iframe scrolling='no' src='../../file.php?cid1=ddds2_"+size+"&cid2="+id+""+size+"' id='ddds2_"+size+"' style=' width:170px; height:25px;'></iframe></span> <input type='button' value='移除' onclick=\"$('#s"+id+""+size+"').remove();\"/></td></tr>";
	$("tbody#"+id+"").append(htmls);input();
	$("#content",parent.document).height($("body").height()+200);
	CollectGarbage();
}


function imgval(str)
{
	var F=$("#"+str+" li[class!='hide'] img");
	var size=F.size();
	if (size>0)
	{
		var selarr = new Array([size]);
		F.each(function(i){selarr[i]=F.eq(i).attr("src");});
		return selarr.join();	
	}
	else
	{
		return "";	
	}
}
function fjflx(str,str2)
{
	var F=$("tr."+str+"");
	var size=F.size();
	var gg="";
	if (size>0)
	{
		F.each(function(i){
			gar=fjf(str,i,str2);
			if (gg=="")
			{
				gg=gar;
			}
			else
			{
				gg=gg+"[##f1##]"+gar;
			}
		});
		return gg;	
	}
	else
	{
		return "";	
	}
}
function fjf(str,i,str2)
{
	var F=$("tr."+str+"").eq(i).find("input[name="+str2+"]");
	var ff="";
	var size=F.size();
	if (size>0)
	{
		F.each(function(i){
			if (ff=="")
			{
				ff=F.eq(i).val();
			}
			else
			{
				ff=ff+"[##f2##]"+F.eq(i).val();
			}
		});
		return ff;	
	}
	else
	{
		return "";	
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
function gval20(str)
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
function gval0(str)
{
	return $("#"+str).val();	
}

function umit(f,a) 
{
	$.ajax({
		type:"POST",
		url:"do.php?action="+a,
		data: $("#"+f).serialize(),
		success:function(msg){
            if (msg=="ok"){location.reload();return false;}
			if (msg=="upok"){$("#"+f).find(".serror").html("修改成功");return false;}
			if (msg=="eokr"){$("#"+f).find(".serror").html("操作成功！");setTimeout("location.reload()",1000);}			
			else{$("#"+f).find(".serror").html(msg);return false;}
		}
	});
	return false;
}