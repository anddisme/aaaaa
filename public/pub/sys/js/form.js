	$('#getcode,.getcode').click(function(){
	$('#getcode,#gcode').attr('src', '/inc/gcode.php?t=' + (new Date).getTime());return false;
	});
    $('#getcode,.getcode')
    .css('cursor', 'pointer')
    .attr('title', '看不清楚？点击刷新认证码.')
    .attr('height', '27')	
    .trigger('click');

setInterval('$(".serror").html("")',4000);
if (typeof(WREST_JS) == 'undefined') // 仅执行一次
{
    if (typeof wpath == 'undefined')
        alert('wpath 变数有误或设定错误！ js/form.js');

    var WREST_JS = true;

    var wrestMsg = '';
    var wrestFld = null;
    //var wrestFldDefaultColor = '#FFFFFF'; 
    var wrestFldDefaultColor = ''; 
    var wrestFldBackColor = '#FFE4E1'; 
    var arrAttr  = new Array ('required', 'trim', 'minlength', 'email', 'hangul', 'hangul2', 'qq', 
                              'memberid', 'nospace', 'numeric', 'alpha', 'alphanumeric','Email_qq',
                              'jumin', 'saupja', 'alphanumericunderline', 'telnumber', 'hangulalphanumeric');

    // subject 属性 return, 没有就传递 tag name
    function wrestItemname(fld)
    {
        var itemname = fld.getAttribute("itemname");
        if (itemname != null && itemname != "")
            return itemname;
        else
            return fld.name;
    }

    // 去掉两边空格
    function wrestTrim(fld) 
    {
        var pattern = /(^\s*)|(\s*$)/g; // \s 空格
        fld.value = fld.value.replace(pattern, "");
        return fld.value;
    }

    // 必选项检查
    function wrestRequired(fld)
    {
        if (wrestTrim(fld) == "") 
        {
            if (wrestFld == null) 
            {
                // 3.30
                // 全部为选择输入时也进行检查
                wrestMsg = "请输入" + wrestItemname(fld)+",这是"+ (fld.type=="select-one"?"必填":"必填")+"\n";
                wrestFld = fld;
            }
        }
    }

    // 最少字节检查
    function wrestMinlength(fld)
    {
        var len = fld.getAttribute("minlength");
        if (fld.value.length < len) 
        {
            if (wrestFld == null) 
            {
                wrestMsg = wrestItemname(fld) + " : 请输入不少于" + len + "字符\n";
                wrestFld = fld;
            }
        }
    }

    // kimsenyong 2006.3 - 电话号码 : 123-123(4)-5678
	function wrestTelnumber(fld){
		if (!wrestTrim(fld)) return;
		if (check_tel(fld.value)==false){
				wrestMsg = wrestItemname(fld)+" :您输入的号码格式有误！.\n\n请重新输入\n";
                wrestFld = fld;
				fld.select();
			}
	}
	function isEmail(str) {if (str.search(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/) == -1){return false;}else{return true;}}
	function check_qq(str){if (str.search(/^[1-9]\d{4,11}$/)==-1){return false;}else{return true;}}
	function check_tel(str) {if (str.search(/^((\d{3}\-))?1\d{10}$/) == -1){return false;}else{return true;}}
	function wrestQQ(fld){
		if (!wrestTrim(fld)) return;
		var pattern = /^[0-9]{5,13}$/;
		if(!pattern.test(fld.value)){ 
            if(wrestFld == null){
				wrestMsg = wrestItemname(fld)+" :您输入的QQ号码格式有误！.\n\n请重新输入\n";
                wrestFld = fld;
				fld.select();
            }
		}
	}
	function wrestEmail_qq(fld){
		if (!wrestTrim(fld)) return;
		if (isEmail(fld.value)==false && check_qq(fld.value)==false)
		{
			wrestMsg = wrestItemname(fld)+" :请输入正确的QQ号或者邮箱！.\n\n请重新输入\n";
            wrestFld = fld;
			fld.select();			
		}
	}
	
	
    // email
    function wrestEmail(fld) 
    {
        if (!wrestTrim(fld)) return;

        //var pattern = /(\S+)@(\S+)\.(\S+)/; 检查邮件地址
        var pattern = /([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)\.([0-9a-zA-Z_-]+)/;
        if (!pattern.test(fld.value)) 
        {
            if (wrestFld == null) 
            {
                wrestMsg = wrestItemname(fld) + " : 邮件格式错误！\n";
                wrestFld = fld;
            }
        }
    }

    // 会员ID
    function wrestMemberId(fld) 
    {
        if (!wrestTrim(fld)) return;

        var pattern = /(^([a-z0-9]+)([a-z0-9_]+$))/;
        if (!pattern.test(fld.value)) 
        {
            if (wrestFld == null) 
            {
                wrestMsg = wrestItemname(fld) + " :会员用户名格式错误！\n\n只允许使用英文字母，数字及下划线\n\n用户名首个字母请勿使用下划线\n";
                wrestFld = fld;
            }
        }
    }

    // 汉字
    function wrestHangul(fld) 
    { 
        if (!wrestTrim(fld)) return;
		var pattern=/^[\u4e00-\u9fa5]+$/; 
        if (pattern.test(fld.value)) 
        {
            if (wrestFld == null) 
            { 
                wrestMsg = wrestItemname(fld) + ' : 您输入的不是有效地简体中文汉字. (请勿使用全角符号或繁体字)\n'; 
                wrestFld = fld; 
            } 
        } 
    }

    // 检查中文
    function wrestHangul2(fld) 
    { 
        if (!wrestTrim(fld)) return;
        var pattern=/^[\u4e00-\u9fa5]+$/;  
        if (!pattern.test(fld.value)) 
        {
            wrestMsg = wrestItemname(fld) + ' : 您输入的不是有效地简体中文汉字\n'; 
            wrestFld = fld; 
        } 
		else
		{
		//wrestMsg = wrestItemname(fld) + ' : x您输入的不是有效地简体中文汉字\n'; 	
		}
    }

    // 多个文字检查
    function wrestHangulAlphaNumeric(fld) 
    { 
        if (!wrestTrim(fld)) return;

        var pattern = /([^\u4e00-\u9fa5\x20^a-z^A-Z^0-9])/i; 

        if (pattern.test(fld.value)) 
        {
            if (wrestFld == null) 
            { 
                wrestMsg = wrestItemname(fld) + ' : 只可以输入汉字，英语字母及数字\n'; 
                wrestFld = fld; 
            } 
        } 
    }

    // 检查数字
    // (http://dasir.com) 2003-06-24
    function wrestNumeric(fld) 
    { 
        if (fld.value.length > 0) 
        { 
            for (i = 0; i < fld.value.length; i++) 
            { 
                if (fld.value.charAt(i) < '0' || fld.value.charAt(i) > '9') 
                { 
                    wrestMsg = wrestItemname(fld) + " : 只可以输入数字！\n"; 
                    wrestFld = fld; 
                }
            }
        }
    }

    // 英文字母检查
    //  (http://dasir.com) 2003-06-24
    function wrestAlpha(fld) 
    { 
        if (!wrestTrim(fld)) return; 

        var pattern = /(^[a-zA-Z]+$)/; 
        if (!pattern.test(fld.value)) 
        { 
            if (wrestFld == null) 
            { 
                wrestMsg = wrestItemname(fld) + " : 只可以输入英文字母\n"; 
                wrestFld = fld; 
            } 
        } 
    } 

    // 英文，数字
    //  (http://dasir.com) 2003-07-07
    function wrestAlphaNumeric(fld) 
    { 
       if (!wrestTrim(fld)) return; 
       var pattern = /(^[a-zA-Z0-9]+$)/; 
       if (!pattern.test(fld.value)) 
       { 
           if (wrestFld == null) 
           { 
               wrestMsg = wrestItemname(fld) + " : 只可以使用英文字母或数字\n"; 
               wrestFld = fld; 
           } 
       } 
    } 

    // 英文，数字，下划线检查
    function wrestAlphaNumericUnderLine(fld) 
    { 
       if (!wrestTrim(fld)) 
           return; 

       var pattern = /(^[a-zA-Z0-9\_]+$)/; 
       if (!pattern.test(fld.value)) 
       { 
           if (wrestFld == null) 
           { 
               wrestMsg = wrestItemname(fld) + " : 只可以使用英文字母，数字及下划线！\n"; 
               wrestFld = fld; 
           } 
       } 
    } 

    // 身份证号码
    function wrestJumin(fld) 
    { 
       if (!wrestTrim(fld)) return; 
       var pattern = /(^[0-9]{18}$)/; 
       if (!pattern.test(fld.value)) 
       { 
           if (wrestFld == null) 
           { 
               wrestMsg = wrestItemname(fld) + " : 请输入18位身份证号码！\n"; 
               wrestFld = fld; 
           } 
       } 

    } 

    // 企业编码查询（韩国格式）
    function wrestSaupja(fld) 
    { 
       if (!wrestTrim(fld)) return; 
       var pattern = /(^[0-9]{10}$)/; 
       if (!pattern.test(fld.value)) 
       { 
           if (wrestFld == null) 
           { 
               wrestMsg = wrestItemname(fld) + " : 请输入10位企业编码\n"; 
               wrestFld = fld; 
           } 
       } 
       else 
       {
            var sum = 0;
            var at = 0;
            var att = 0;
            var saupjano= fld.value;
            sum = (saupjano.charAt(0)*1)+
                  (saupjano.charAt(1)*3)+
                  (saupjano.charAt(2)*7)+
                  (saupjano.charAt(3)*1)+
                  (saupjano.charAt(4)*3)+
                  (saupjano.charAt(5)*7)+
                  (saupjano.charAt(6)*1)+
                  (saupjano.charAt(7)*3)+
                  (saupjano.charAt(8)*5);
            sum += parseInt((saupjano.charAt(8)*5)/10);
            at = sum % 10;
            if (at != 0) 
                att = 10 - at;  

            if (saupjano.charAt(9) != att) 
            {
               wrestMsg = wrestItemname(fld) + " : 您输入的企业编码格式错误！\n"; 
               wrestFld = fld; 
            }

        }
    } 

    // 检查空格"" 
    function wrestNospace(fld)
    {
        var pattern = /(\s)/g; // \s 空格
        if (pattern.test(fld.value)) 
        {
            if (wrestFld == null) 
            {
                wrestMsg = wrestItemname(fld) + " : 请不要输入空格！\n";
                wrestFld = fld;
            }
        }
    }

    // submit 检查属性
    function wrestSubmit()
    {
        wrestMsg = "";
        wrestFld = null;

        var attr = null;

        // 计算
        for (var i = 0; i < this.elements.length; i++) 
        {
            // Input tag  type  text, file, password 
            // 3.30
            // 检查 select-one
            if (this.elements[i].type == "text" || 
                this.elements[i].type == "file" || 
                this.elements[i].type == "password" ||
                this.elements[i].type == "select-one" ||
                this.elements[i].type == "textarea") 
            {
                // 制定长度
                for (var j = 0; j < arrAttr.length; j++) 
                {
                    // 比较
                    if (this.elements[i].getAttribute(arrAttr[j]) != null) 
                    {
                        /*
                        // 基本颜色
                        if (this.elements[i].getAttribute("required") != null) {
                            this.elements[i].style.backgroundColor = wrestFldDefaultColor;
                        }
                        */
                        switch (arrAttr[j]) 
                        {
                            case "required"     : wrestRequired(this.elements[i]); break;
                            case "trim"         : wrestTrim(this.elements[i]); break;
                            case "minlength"    : wrestMinlength(this.elements[i]); break;
                            case "email"        : wrestEmail(this.elements[i]); break;
                            case "hangul"       : wrestHangul(this.elements[i]); break;
                            case "hangul2"      : wrestHangul2(this.elements[i]); break;
                            case "hangulalphanumeric"      
                                                : wrestHangulAlphaNumeric(this.elements[i]); break;
                            case "memberid"     : wrestMemberId(this.elements[i]); break;
                            case "nospace"      : wrestNospace(this.elements[i]); break;
                            case "numeric"      : wrestNumeric(this.elements[i]); break; 
                            case "alpha"        : wrestAlpha(this.elements[i]); break; 
                            case "alphanumeric" : wrestAlphaNumeric(this.elements[i]); break; 
                            case "alphanumericunderline" : 
                                                  wrestAlphaNumericUnderLine(this.elements[i]); break; 
                            case "jumin"        : wrestJumin(this.elements[i]); break; 
                            case "saupja"       : wrestSaupja(this.elements[i]); break; 
							
							//电话
							case "telnumber"	: wrestTelnumber(this.elements[i]); break;
							case "qq"	: wrestQQ(this.elements[i]); break;
							case "Email_qq"	: wrestEmail_qq(this.elements[i]); break;
                            default : break;
                        }
                    }
                }
            }
        }

        // 数值不是 null就显示错误信息
        // 修改颜色
        if (wrestFld != null) 
        { 
            alert(wrestMsg); 
            if (wrestFld.style.display != 'none') 
            { 
                wrestFld.style.backgroundColor = wrestFldBackColor; 
                wrestFld.focus(); 
            } 
            return false; 
        } 

        if (this.oldsubmit && this.oldsubmit() == false)
            return false;

        return true;
    }

    // 初始化onsubmit
    function wrestInitialized()
    {
        for (var i = 0; i < document.forms.length; i++) 
        {
            // onsubmit 有活动就保存
            if (document.forms[i].onsubmit) document.forms[i].oldsubmit = document.forms[i].onsubmit;
            document.forms[i].onsubmit = wrestSubmit;
            for (var j = 0; j < document.forms[i].elements.length; j++) 
            {
                // 必填是添加背景
                if (document.forms[i].elements[j].getAttribute("required") != null && document.forms[i].elements[j].getAttribute("name") !='username' && document.forms[i].elements[j].getAttribute("name") !='regpwd') 
                {
                    //document.forms[i].elements[j].style.backgroundColor = wrestFldDefaultColor;
                    //document.forms[i].elements[j].className = "wrest_required";
                    //document.forms[i].elements[j].style.backgroundImage = "url(/js/wrest.gif)";
                    //document.forms[i].elements[j].style.backgroundPosition = "top right";
                    //document.forms[i].elements[j].style.backgroundRepeat = "no-repeat";
                }
            }
        }
    }

    wrestInitialized();
}
