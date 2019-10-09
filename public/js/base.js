var t = null;
var Base={
	dialog : null,
	dialog2 : null,
	// 提示框，几秒后自动关闭
	alertTime : function (msg, second, reload){
		if (Base.dialog2)
		{
			Base.dialog2.close().remove();
		}
		if (t)
		{
			clearTimeout(t);
		}
		if(typeof title == 'undefined') title = '消息';
		if(typeof second == 'undefined') second = 2;
		Base.dialog2 = dialog({
		    content: msg
		});
		Base.dialog2.show();
		t = setTimeout(function () {
			Base.dialog2.close().remove();
			if (reload != undefined)
			{
				window.location.reload(true);
			}
		}, second * 1000);
	},
	
	//重写普通对话框
	alert : function(msg,title,width,height,padding){
		if(typeof title == 'undefined') title = '消息';
		if(typeof width == 'undefined') width = 540;
		if(typeof height == 'undefined') height = 150;
        if(typeof padding == 'undefined') padding = 20;
		Base.dialog = dialog({
			id: 'alert',
			width: width,
			height: height,
		    title: title,
		    content: msg,
            padding:padding
		});
		Base.dialog.showModal();
	}, 
	//重写普通对话框
	weixin : function(msg){  
		if(typeof width == 'undefined') width = 360;
		if(typeof height == 'undefined') height = 270;
		Base.dialog = dialog({ 
			width: width,
			height: height,
			title: '分享到微信朋友圈',
		    content: '<img width="220" height="220" src="'+msg+'" alt="二维码加载失败..."><p style="text-align: left;padding-top: 10px;">打开微信，点击底部的“发现”，使用 “扫一扫” 即可将网页分享到我的朋友圈。</p>'
		});
		Base.dialog.showModal();
	},
	
	
	//重写气泡对话框
	poptip : function(msg,id,fn){
		if(typeof fn != 'function') fn = function(){};
		Base.dialog = dialog({
			id: 'poptip',
		    content: msg,
		    padding: 1,
		    onclose: fn,
		    quickClose: true
		});
		Base.dialog.show(document.getElementById(id));
	},

	//重写模态对话框
	confirm : function(msg,fn,title,width,height,okBtn,cancelBtn){
		if(typeof title == 'undefined') title = '确认';
		if(typeof okBtn == 'undefined') okBtn = '确定'; 
		if(typeof cancelBtn == 'undefined') cancelBtn = '取消'; 
		if(typeof fn != 'function') fn = function(){};
		if(typeof width == 'undefined') width = 400;
		if(typeof height == 'undefined') height = 90;
		Base.dialog = dialog({
			id: 'confirm',
			width: width,
			height: height,
		    title: title,
		    content: msg,
		    okValue: okBtn,
		    ok: fn,
		    cancelValue: cancelBtn,
            fixed: true,
		    cancel: function () {}
		});
		Base.dialog.showModal();
	},
	

	//重写模态对话框
	confirmChange : function(msg,fn,title,width,height){
		if(typeof title == 'undefined') title = '确认';
		if(typeof fn != 'function') fn = function(){};
		if(typeof width == 'undefined') width = 400;
		if(typeof height == 'undefined') height = 90;
		Base.dialog = dialog({
			id: 'confirm',
			width: width,
			height: height,
		    title: title,
		    content: msg,
		    okValue: '确定',
		    ok: fn
		});
		Base.dialog.showModal();
	},

	alertClose:function(){
		if(Base.dialog){
			Base.dialog.close();
		}
	},
	//重写微博对话框
	weiboImg : function(src,pic,txt){
		var s = screen, d = document, e = encodeURIComponent, r = '快法务', l = 'http://www.kuaifawu.com/', c = 'utf-8', u = d.location;
		var f = 'http://v.t.sina.com.cn/share/share.php?appkey=3459704224&searchPic=false&', p = ['url=', e(u), '&title=', e(txt), '&source=', e(r), '&sourceUrl=', e(l), '&content=', c, '&pic=', e(pic)].join('');
		function a() {
	        if (!window.open([f, p].join(''), 'mb', ['toolbar=0,status=0,resizable=1,width=440,height=430,left=', (s.width - 440) / 2, ',top=', (s.height - 430) / 2].join(''))) u.href = [f, p].join('');
	    };
	    if (/Firefox/.test(navigator.userAgent)) setTimeout(a, 0); else a(); 
	},
	
	
	//重写iframe对话框
	webview : function(src,width,height,title){
		if(typeof width == 'undefined') width = 400;
		if(typeof height == 'undefined') height = 150;
		Base.dialog = dialog({
			id: 'confirm',
			width: width,
			height: height,
		    padding: 0,
		    content: '<iframe name="iframename" id="iframeid" style="width:100%;height:100%;" frameborder="0" src="'+src+'"></iframe>'
		});
		if(typeof title != 'undefined') Base.dialog.title(title);
		Base.dialog.showModal();
	},
	getCookie : function(c_name){
		if (document.cookie.length>0){
			c_start=document.cookie.indexOf(c_name + "=");
			if (c_start!=-1){ 
				c_start=c_start + c_name.length+1;
				c_end=document.cookie.indexOf(";",c_start);
				if (c_end==-1) c_end=document.cookie.length;
					return unescape(document.cookie.substring(c_start,c_end));
			} 
		}
		return "";
	},
	setCookie : function(c_name,value,expiredays){  
      var exdate=new Date();  
      exdate.setDate(exdate.getDate()+expiredays)  
      document.cookie=c_name+ "=" +escape(value)+  
      ((expiredays==null) ? "" : "; expires="+exdate.toGMTString()) + ";path=/";  
	},

	//焦点图1
	setFocusPic:function(obj,obj1,obj2,obj3,obj4,speed){

		//设置默认参数
		if(typeof obj == 'undefined') obj = $('#container');
        if(typeof obj1 == 'undefined') obj1 = $('#list');
        if(typeof obj2 == 'undefined') obj2 = $('#buttons span');
        if(typeof obj3 == 'undefined') obj3 = $('#prev');
        if(typeof obj4 == 'undefined') obj4 = $('#next');
        if(typeof speed == 'undefined') speed = 5000;
        
        var container = obj;
        var list = obj1;
        var buttons = obj2;
        var prev = obj3;
        var next = obj4;
        var index = 1;
        var len = 5;
        var interval = speed;
        var timer;

        function animate (offset) {
            var left = parseInt(list.css('left')) + offset;
            if (offset>0) {
                offset = '+=' + offset;
            }
            else {
                offset = '-=' + Math.abs(offset);
            }
            list.animate({'left': offset}, 300, function () {
                if(left > -200){
                    list.css('left', -600 * len);
                }
                if(left < (-600 * len)) {
                    list.css('left', -600);
                }
            });
        }

        function showButton() {
            buttons.eq(index-1).addClass('on').siblings().removeClass('on');
        }

        function play() {
            timer = setTimeout(function () {
                next.trigger('click');
                play();
            }, interval);
        }
        function stop() {
            clearTimeout(timer);
        }

        next.bind('click', function () {
            if (list.is(':animated')) {
                return;
            }
            if (index == 5) {
                index = 1;
            }
            else {
                index += 1;
            }
            animate(-600);
            showButton();
        });

        prev.bind('click', function () {
            if (list.is(':animated')) {
                return;
            }
            if (index == 1) {
                index = 5;
            }
            else {
                index -= 1;
            }
            animate(600);
            showButton();
        });

        buttons.each(function () {
             $(this).bind('click', function () {
                 if (list.is(':animated') || $(this).attr('class')=='on') {
                     return;
                 }
                 var myIndex = parseInt($(this).attr('index'));
                 var offset = -600 * (myIndex - index);

                 animate(offset);
                 index = myIndex;
                 showButton();
             })
        });

        container.hover(stop, play);

        play();

	},

    //点击切换文字内容
    texTual:function(clickObj, te, teTual, className){
        clickObj.on("click",function(){
            if ($(this).text() == te) {
                $(this).text(teTual);
                $(this).removeClass(className);
            }else{
                $(this).text(te);
                $(this).addClass(className);
            }
            return false;
        });
    },

    //创建透明层
    createTransparent:function(){
        $("body").append("<div id='mask'></div>");
        var mask;
        function resizeMask(){
            mask = $("#mask");
            mask.css({
                "height":$(document).height(),
                "width":$(window).width()
            });
        }
        resizeMask();
        $(window).resize(function(){
            resizeMask()
        });
    },

    //有淡入效果的弹出层
    colCanLayThick:function(opt){
        //调用透明层
        Base.createTransparent(mask);
        var mask = $("#mask");
        opt.layerObj.css("display","block");
        //弹层关闭按钮
        opt.colse.click(function(){
            opt.layerObj.css("display","none");
            mask.remove();
        });
        //取消按钮
        if(opt.cance)
        {
        	opt.cance.click(function(){
                opt.layerObj.css("display","none");
                mask.remove();
            });
        }
        return false;
    },
    
	//设置表格行颜色
	setTabRow:function(obj,className,className1,className2){

		//设置默认参数
		if(typeof className == 'undefined') className = 'oddtd1';
		if(typeof className1 == 'undefined') className1 = 'eventd1';
		if(typeof className2 == 'undefined') className2 = 'currenttd1';
		obj.table({
			oddtdClass:className,
			eventdClass:className1,
			currenttdClass:className2
		});
	},

    //
    setTabEOColor:function(eObj, oObj, eclassName, oclassName){
       eObj.addClass(eclassName);
       oObj.addClass(oclassName);
    },

    //设置选项卡
    setTableTab:function(obj,el,el1,el2){

        if(typeof el == 'undefined') el = 'colorChange';
        if(typeof el1 == 'undefined') el1 = '#fiUl li';
        if(typeof el2 == 'undefined') el2 = '#thDiv div';
        obj.tab({
            colorChangeClass:'colorChange',
            eventType:'click',
            fiUl:'#fiUl li',
            thDiv:'#thDiv div'
        });
    },

    //设置横向下拉菜单
    setSuperFishMulti:function(obj,obj2,obj3,obj4,obj5){

        //设置默认参数
        if(typeof obj == 'undefined') obj = $('#example');
        if(typeof obj2 == 'undefined') obj2 = $('.destroy');
        if(typeof obj3 == 'undefined') obj3 = $('.init');
        if(typeof obj4 == 'undefined') obj4 = $('.open');
        if(typeof obj5 == 'undefined') obj5 = $('.close');
        // initialise plugin
        var example = obj.superfish({
            //add options here if required
        });

        // buttons to demonstrate Superfish's public methods
        obj2.on('click', function(){
            example.superfish('destroy');
        });

        obj3.on('click', function(){
            example.superfish();
        });

        obj4.on('click', function(){
            example.children('li:first').superfish('show');
        });

        obj5.on('click', function(){
            example.children('li:first').superfish('hide');
        });
    },

    //设置水平SuperfishMegamenu菜单
    setSuperfishMegamenu:function(obj,obj2,obj3,obj4,obj5){

        //设置默认参数
        if(typeof obj == 'undefined') obj = $('#example');
        if(typeof obj2 == 'undefined') obj2 = $('.destroy');
        if(typeof obj3 == 'undefined') obj3 = $('.init');
        if(typeof obj4 == 'undefined') obj4 = $('.open');
        if(typeof obj5 == 'undefined') obj5 = $('.close');
        var exampleOptions = {
          speed: 'fast'
        }
        // initialise plugin
        var example = obj.superfish(exampleOptions);

        // buttons to demonstrate Superfish's public methods
        obj2.on('click', function(){
          example.superfish('destroy');
        });

        obj3.on('click', function(){
          example.superfish(exampleOptions);
        });

        obj4.on('click', function(){
          example.children('li:first').superfish('show');
        });

        obj5.on('click', function(){
          example.children('li:first').superfish('hide');
        });
    },

    //设置treeView的默认效果ztreeCore
    setZtreeCore:function(obj){

        //设置默认参数
        if(typeof obj == 'undefined') obj = $("#treeDemo");
         var setting = {
            data: {
                simpleData: {
                    enable: true
                }
            }
        };
        var zNodes =[
            { id:1, pId:0, name:"pNode 1", open:true},
            { id:11, pId:1, name:"pNode 11"},
            { id:111, pId:11, name:"leaf node 111"},
            { id:112, pId:11, name:"leaf node 112"},
            { id:113, pId:11, name:"leaf node 113"},
            { id:114, pId:11, name:"leaf node 114"},
            { id:12, pId:1, name:"pNode 12"},
            { id:121, pId:12, name:"leaf node 121"},
            { id:122, pId:12, name:"leaf node 122"},
            { id:123, pId:12, name:"leaf node 123"},
            { id:124, pId:12, name:"leaf node 124"},
            { id:13, pId:1, name:"pNode 13 - no child", isParent:true},
            { id:2, pId:0, name:"pNode 2"},
            { id:21, pId:2, name:"pNode 21", open:true},
            { id:211, pId:21, name:"leaf node 211"},
            { id:212, pId:21, name:"leaf node 212"},
            { id:213, pId:21, name:"leaf node 213"},
            { id:214, pId:21, name:"leaf node 214"},
            { id:22, pId:2, name:"pNode 22"},
            { id:221, pId:22, name:"leaf node 221"},
            { id:222, pId:22, name:"leaf node 222"},
            { id:223, pId:22, name:"leaf node 223"},
            { id:224, pId:22, name:"leaf node 224"},
            { id:23, pId:2, name:"pNode 23"},
            { id:231, pId:23, name:"leaf node 231"},
            { id:232, pId:23, name:"leaf node 232"},
            { id:233, pId:23, name:"leaf node 233"},
            { id:234, pId:23, name:"leaf node 234"},
            { id:3, pId:0, name:"pNode 3 - no child", isParent:true}
        ];
        $.fn.zTree.init(obj, setting, zNodes);
    }

}