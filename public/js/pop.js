var g_pop = g_pop || function() {};
if (!Array.prototype.push) {
    Array.prototype.push = function() {
        var b = this.length;
        for (var a = 0; a < arguments.length; a++) {
            this[b + a] = arguments[a]
        }
        return this.length
    }
}
function G() {
    var c = new Array();
    for (var b = 0; b < arguments.length; b++) {
        var a = arguments[b];
        if (typeof a == "string") {
            a = document.getElementById(a)
        }
        if (arguments.length == 1) {
            return a
        }
        c.push(a)
    }
    return c
}
Function.prototype.bind = function(b) {
    var a = this;
    return function() {
        a.apply(b, arguments)
    }
};
Function.prototype.bindAsEventListener = function(b) {
    var a = this;
    return function(c) {
        a.call(b, c || window.event)
    }
};
Object.extend = function(a, b) {
    for (property in b) {
        a[property] = b[property]
    }
    return a
};
if (!window.Event) {
    var Event = new Object()
}
Object.extend(Event, {
    observers: false,
    element: function(a) {
        return a.target || a.srcElement
    },
    isLeftClick: function(a) {
        return (((a.which) && (a.which == 1)) || ((a.button) && (a.button == 1)))
    },
    pointerX: function(a) {
        return a.pageX || (a.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft))
    },
    pointerY: function(a) {
        return a.pageY || (a.clientY + (document.documentElement.scrollTop || document.body.scrollTop))
    },
    stop: function(a) {
        if (a.preventDefault) {
            a.preventDefault();
            a.stopPropagation()
        } else {
            a.returnValue = false;
            a.cancelBubble = true
        }
    },
    findElement: function(c, b) {
        var a = Event.element(c);
        while (a.parentNode && (!a.tagName || (a.tagName.toUpperCase() != b.toUpperCase()))) {
            a = a.parentNode
        }
        return a
    },
    _observeAndCache: function(d, c, b, a) {
        if (!this.observers) {
            this.observers = []
        }
        if (d.addEventListener) {
            this.observers.push([d, c, b, a]);
            d.addEventListener(c, b, a)
        } else {
            if (d.attachEvent) {
                this.observers.push([d, c, b, a]);
                d.attachEvent("on" + c, b)
            }
        }
    },
    unloadCache: function() {
        if (!Event.observers) {
            return
        }
        for (var a = 0; a < Event.observers.length; a++) {
            Event.stopObserving.apply(this, Event.observers[a]);
            Event.observers[a][0] = null
        }
        Event.observers = false
    },
    observe: function(d, c, b, a) {
        if ("string" == typeof d) {
            d = G(d)
        }
        a = a || false;
        if (c == "keypress" && (navigator.appVersion.match(/Konqueror|Safari|KHTML/) || d.attachEvent)) {
            c = "keydown"
        }
        this._observeAndCache(d, c, b, a)
    },
    stopObserving: function(d, c, b, a) {
        if ("string" == typeof d) {
            d = G(d)
        }
        a = a || false;
        if (c == "keypress" && (navigator.appVersion.match(/Konqueror|Safari|KHTML/) || d.detachEvent)) {
            c = "keydown"
        }
        if (d.removeEventListener) {
            d.removeEventListener(c, b, a)
        } else {
            if (d.detachEvent) {
                d.detachEvent("on" + c, b)
            }
        }
    }
});
Event.observe(window, "unload", Event.unloadCache, false);
var Class = function() {
    var a = function() {
        this.initialize.apply(this, arguments)
    };
    for (i = 0; i < arguments.length; i++) {
        superClass = arguments[i];
        for (member in superClass.prototype) {
            a.prototype[member] = superClass.prototype[member]
        }
    }
    a.child = function() {
        return new Class(this)
    };
    a.extend = function(b) {
        for (property in b) {
            a.prototype[property] = b[property]
        }
    };
    return a
};
var Popup = new Class();
Popup.prototype = {
    iframeIdName: "ifr_popup",
    initialize: function(a) {
        this.config = Object.extend({
            contentType: 1,
            isHaveTitle: true,
            scrollType: "no",
            isBackgroundCanClick: false,
            isSupportDraging: true,
            isShowShadow: true,
            isReloadOnClose: false,
            width: 400,
            isPop: false,
            height: 300
        },
        a || {});
        this.info = {
            shadowWidth: 3,
            title: "",
            contentUrl: "",
            contentHtml: "",
            callBack: null,
            parameter: null,
            confirmCon: "",
            alertCon: "",
            someHiddenTag: "select,object,embed",
            someDisabledBtn: "",
            someHiddenEle: "",
            overlay: 0,
            coverOpacity: 30
        };
        this.color = {
            cColor: "#000",
            bColor: "#FFFFFF",
            tColor: "#709CD2",
            wColor: "#FFFFFF"
        };
        this.dropClass = null;
        this.someToHidden = [];
        this.someToDisabled = [];
        if (!this.config.isHaveTitle) {
            this.config.isSupportDraging = false
        }
        this.iniBuild()
    },
    setContent: function(a, b) {
        if (b != "") {
            switch (a) {
            case "width":
                this.config.width = b;
                break;
            case "height":
                this.config.height = b;
                break;
            case "title":
                this.info.title = b;
                break;
            case "contentUrl":
                this.info.contentUrl = b;
                break;
            case "contentHtml":
                this.info.contentHtml = b;
                break;
            case "callBack":
                this.info.callBack = b;
                break;
            case "parameter":
                this.info.parameter = b;
                break;
            case "confirmCon":
                this.info.confirmCon = b;
                break;
            case "alertCon":
                this.info.alertCon = b;
                break;
            case "someHiddenTag":
                this.info.someHiddenTag = b;
                break;
            case "someHiddenEle":
                this.info.someHiddenEle = b;
                break;
            case "someDisabledBtn":
                this.info.someDisabledBtn = b;
                break;
            case "overlay":
                this.info.overlay = b
            }
        }
    },
    iniBuild: function() {
        var a = G("dialogCase");
        if (a) {
            document.body.removeChild(a)
        }
        a = document.createElement("DIV");
        a.id = "dialogCase";
        a.style.zIndex = 65535;
        a.style.top = 0;
        a.style.left = 0;
        a.style.position = "absolute";
        a.style.width = "100%";
        document.body.appendChild(a)
    },
    build: function() {
        var b = 10001 + this.info.overlay * 10;
        var k = b + 2;
        this.iframeIdName = "ifr_popup" + this.info.overlay;
        var m = "http://img.baidu.com/hi/img/";
        var l = '<div id="dialogBoxClose" style="width:50px;height:18px; color:#fff; cursor:pointer;margin-bottom:2px;">关闭<div>';
        var h = "filter: alpha(opacity=" + this.info.coverOpacity + ");opacity:" + this.info.coverOpacity / 100 + ";";
        var n = '<div id="dialogBoxBG" style="position:absolute;top:0px;left:0px;z-index:' + b + ";" + h + "background-color:" + this.color.cColor + ';display:none;"></div>';
        var f = '<div id="dialogBox" style="border:1px solid #39146b;display:none;z-index:' + k + ";position:relative;width:" + this.config.width + 'px;background:url(\'/images/bgs.gif\') repeat-x scroll 0 -68px #48207f; padding:1px;"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="background:url(\'/images//bgs.gif\') repeat-x 0 -144px">';
        if (this.config.isHaveTitle) {
            f += '<tr height="29"><td style="background:url(\'/images//edithelper.gif\') no-repeat right -68px transparent;"><table style="-moz-user-select:none;height:24px;" width="100%" border="0" cellpadding="0" cellspacing="0" ><tr><td width="6" height="24"></td><td id="dialogBoxTitle" style="color:' + this.color.wColor + ';font-size:14px;font-weight:bold;">' + this.info.title + '&nbsp;</td><td id="dialogClose" width="18" align="right" valign="middle">' + l + '</td><td width="9"></td></tr></table></td></tr>'
        } else {
            f += '<tr height="10"><td align="right">' + l + "</td></tr>"
        }
        f += '<tr id="container-tr" style="height:' + (this.config.height - 36) + 'px" valign="top"><td style="position:relative;padding:1px;"><div style="border:1px solid #FFF;"><div style="background:url(\'/images//bgs.gif\') repeat-x #FFF;height:13px;line-height:13px;font-size:1px;">&nbsp;</div><div id="dialogBody" style="background-color:#FFF;height:' + (this.config.height - 46) + "px;width:" + (this.config.width - 4) + 'px"></div></div></td></tr></table></div><div id="dialogBoxShadow" style="display:none;z-index:' + b + ';"></div>';
        if (!this.config.isBackgroundCanClick) {
            G("dialogCase").innerHTML = n + f;
            var j = document,
            d = j.body,
            c = j.documentElement,
            a = j.compatMode == "BackCompat" ? d: j.documentElement;
            G("dialogBoxBG").style.height = Math.max(c.scrollHeight, d.scrollHeight, a.clientHeight) + "px";
            G("dialogBoxBG").style.width = '100%';
        } else {
            G("dialogCase").innerHTML = f
        }
        Event.observe(G("dialogBoxClose"), "click", this.reset.bindAsEventListener(this), false);
        if (this.config.isSupportDraging) {
            dropClass = new Dragdrop(this.config.width, this.config.height, this.info.shadowWidth, this.config.isSupportDraging, this.config.contentType);
            G("dialogBoxTitle").style.cursor = "move"
        }
        this.lastBuild()
    },
    lastBuild: function() {
        var b = '<div style="width:100%;height:100%;text-align:center;"><div style="margin:0 20px 0 20px;padding-top:20px;font-size:14px;line-height:16px;color:#000000;">' + this.info.confirmCon + '</div><div style="margin:20px;"><input id="dialogOk" type="button" value="  确定  "/>&nbsp;<input id="dialogCancel" type="button" value="  取消  "/></div></div>';
        var f = '<div style="width:100%;height:100%;text-align:center;"><div style="margin:0px 20px 0 20px;font-size:14px;line-height:16px;color:#000000;">' + this.info.alertCon + '</div><div style="margin:20px;"><input id="dialogYES" type="button" value="  确定  "/></div></div>';
        var a = 10001 + this.info.overlay * 10;
        var d = a + 4;
        if (this.config.contentType == 1) {
            var c = "<iframe style='height:" + (this.config.height - 46) + "px;width:" + (this.config.width - 4) + "px;' name='" + this.iframeIdName + "' id='" + this.iframeIdName + "' src='" + this.info.contentUrl + "' frameborder='0' scrolling='" + this.config.scrollType + "'></iframe>";
            var h = "<div id='iframeBG' style='position:absolute;top:0px;left:0px;width:1px;height:1px;z-index:" + d + ";filter: alpha(opacity=00);opacity:0.00;background-color:#ffffff;'><div>";
            G("dialogBody").innerHTML = c + h;
			// 修改ie6下 页面空白现象
            document.getElementById(this.iframeIdName).src = this.info.contentUrl;
        } else {
            if (this.config.contentType == 2) {
                G("dialogBody").innerHTML = this.info.contentHtml
            } else {
                if (this.config.contentType == 3) {
                    G("dialogBody").innerHTML = b;
                    Event.observe(G("dialogOk"), "click", this.forCallback.bindAsEventListener(this), false);
                    Event.observe(G("dialogCancel"), "click", this.close.bindAsEventListener(this), false)
                } else {
                    if (this.config.contentType == 4) {
                        G("dialogBody").innerHTML = f;
                        Event.observe(G("dialogYES"), "click", this.close.bindAsEventListener(this), false)
                    }
                }
            }
        }
    },
    reBuild: function() {
        G("dialogBody").height = G("dialogBody").clientHeight;
        this.lastBuild()
    },
    show: function() {
        this.hiddenSome();
        this.middle();
        if (this.config.isShowShadow) {
            this.shadow()
        }
    },
    resize: function(c, j, l) {
        this.setContent("width", c);
        this.setContent("height", j);
        var k = G("dialogBox");
        var f = G("dialogBody");
        k.style["width"] = c + "px";
        k.style["height"] = j + "px";
        var d = G(this.iframeIdName);
        d.style["height"] = j - 46 + "px";
        d.style["width"] = c - 4 + "px";
        f.style["height"] = j - 46 + "px";
        f.style["width"] = c - 4 + "px";
        if (l) {
            this.setContent("title", l);
            var b = G("dialogBoxTitle");
            b.innerHTML = l + "&nbsp;"
        }
        var a = G("container-tr");
        a.style["height"] = j - 36 + "px";
        this.show()
    },
    forCallback: function() {
        return this.info.callBack(this.info.parameter)
    },
    shadow: function() {
        var a = G("dialogBoxShadow");
        var b = G("dialogBox");
        a.style["top"] = b.offsetTop + this.info.shadowWidth + 10 + "px";
        a.style["left"] = b.offsetLeft + this.info.shadowWidth + 6 + "px";
        a.style["width"] = b.offsetWidth - 6 + "px";
        a.style["height"] = b.offsetHeight - 10 + "px";
        a.style["position"] = "absolute";
        a.style["background"] = "#000";
        a.style["display"] = "";
        a.style["opacity"] = "0.1";
        a.style["filter"] = "alpha(opacity=20)"
    },
    middle: function() {
        if (!this.config.isBackgroundCanClick) {
            G("dialogBoxBG").style.display = ""
        }
        var h = G("dialogBox");
        h.style["position"] = "absolute";
        h.style["display"] = "";
        var c = (document.documentElement.clientWidth || document.body.clientWidth);
        var f = (document.documentElement.clientHeight || document.body.clientHeight);
        var b = (document.documentElement.scrollTop || document.body.scrollTop);
        var d = (c / 2) - (h.offsetWidth / 2);
        var a = (f / 2 + b) - (h.offsetHeight / 2);
        if (a < b) {
            a = 20 + b
        }
        if (d < 1) {
            d = 20
        }
        h.style["left"] = d + "px";
        h.style["top"] = a + "px"
    },
    reset: function(a) {
        this.close();
        if (typeof a !== "boolean") {
            a = false
        }
        if (this.config.isReloadOnClose || a) {
            top.location.href = top.location.href.replace(/#.*$/g, "")
        }
    },
    close: function() {
        G("dialogBox").style.display = "none";
        if (!this.config.isBackgroundCanClick) {
            G("dialogBoxBG").style.display = "none"
        }
        if (this.config.isShowShadow) {
            G("dialogBoxShadow").style.display = "none"
        }
        G("dialogBody").innerHTML = "";
        this.showSome()
    },
    hiddenSome: function() {
        var a = this.info.someHiddenTag.split(",");
        if (a.length == 1 && a[0] == "") {
            a.length = 0
        }
        for (var b = 0; b < a.length; b++) {
            this.hiddenTag(a[b])
        }
        var c = this.info.someHiddenEle.split(",");
        if (c.length == 1 && c[0] == "") {
            c.length = 0
        }
        for (var b = 0; b < c.length; b++) {
            this.hiddenEle(c[b])
        }
        var c = this.info.someDisabledBtn.split(",");
        if (c.length == 1 && c[0] == "") {
            c.length = 0
        }
        for (var b = 0; b < c.length; b++) {
            this.disabledBtn(c[b])
        }
    },
    disabledBtn: function(b) {
        var a = document.getElementById(b);
        if (typeof(a) != "undefined" && a != null && a.disabled == false) {
            a.disabled = true;
            this.someToDisabled.push(a)
        }
    },
    hiddenTag: function(b) {
        var c = document.getElementsByTagName(b);
        if (c != null) {
            for (var a = 0; a < c.length; a++) {
                if (c[a].style.display != "none" && c[a].style.visibility != "hidden") {
                    c[a].style.visibility = "hidden";
                    this.someToHidden.push(c[a])
                }
            }
        }
    },
    hiddenEle: function(b) {
        var a = document.getElementById(b);
        if (typeof(a) != "undefined" && a != null) {
            a.style.visibility = "hidden";
            this.someToHidden.push(a)
        }
    },
    showSome: function() {
        for (var a = 0; a < this.someToHidden.length; a++) {
            this.someToHidden[a].style.visibility = "visible"
        }
        for (var a = 0; a < this.someToDisabled.length; a++) {
            this.someToDisabled[a].disabled = false
        }
    },
    replaceIframe: function(a) {
        this.setContent("contentUrl", a);
        G(this.iframeIdName).src = a
    }
};
var Dragdrop = new Class();
Dragdrop.prototype = {
    initialize: function(c, b, a, d, f) {
        this.dragData = null;
        this.dragDataIn = null;
        this.backData = null;
        this.width = c;
        this.height = b;
        this.shadowWidth = a;
        this.showShadow = d;
        this.contentType = f;
        this.IsDraging = false;
        this.oObj = G("dialogBox");
        Event.observe(G("dialogBoxTitle"), "mousedown", this.moveStart.bindAsEventListener(this), false)
    },
    moveStart: function(a) {
        this.IsDraging = true;
        if (this.contentType == 1) {
            G("iframeBG").style.display = "";
            G("iframeBG").style.width = this.width + "px";
            G("iframeBG").style.height = this.height + "px"
        }
        Event.observe(document, "mousemove", this.mousemove.bindAsEventListener(this), false);
        Event.observe(document, "mouseup", this.mouseup.bindAsEventListener(this), false);
        Event.observe(document, "selectstart", this.returnFalse, false);
        this.dragData = {
            x: Event.pointerX(a),
            y: Event.pointerY(a)
        };
        this.backData = {
            x: parseInt(this.oObj.style.left),
            y: parseInt(this.oObj.style.top)
        };
        if (document.body.setCapture) {
            document.body.setCapture()
        }
    },
    mousemove: function(a) {
        if (!this.IsDraging) {
            return
        }
        var c = Event.pointerX(a) - this.dragData.x + parseInt(this.oObj.style.left);
        var b = Event.pointerY(a) - this.dragData.y + parseInt(this.oObj.style.top);
        if (this.dragData.y < parseInt(this.oObj.style.top)) {
            b = b - 12
        } else {
            if (this.dragData.y > parseInt(this.oObj.style.top) + 25) {
                b = b + 12
            }
        }
        this.oObj.style.left = c + "px";
        this.oObj.style.top = b + "px";
        if (this.showShadow) {
            G("dialogBoxShadow").style.left = c + this.shadowWidth + 6 + "px";
            G("dialogBoxShadow").style.top = b + this.shadowWidth + 10 + "px"
        }
        this.dragData = {
            x: Event.pointerX(a),
            y: Event.pointerY(a)
        };
        document.body.style.cursor = "move"
    },
    mouseup: function(c) {
        if (!this.IsDraging) {
            return
        }
        if (this.contentType == 1) {
            G("iframeBG").style.display = "none"
        }
        document.onmousemove = null;
        document.onmouseup = null;
        var b = Event.pointerX(c) - (document.documentElement.scrollLeft || document.body.scrollLeft);
        var a = Event.pointerY(c) - (document.documentElement.scrollTop || document.body.scrollTop);
        if (b < 1 || a < 1 || b > document.body.clientWidth || a > document.body.clientHeight) {
            this.oObj.style.left = this.backData.x + "px";
            this.oObj.style.top = this.backData.y + "px";
            if (this.showShadow) {
                G("dialogBoxShadow").style.left = this.backData.x + this.shadowWidth + 6 + "px";
                G("dialogBoxShadow").style.top = this.backData.y + this.shadowWidth + 10 + "px"
            }
        }
        this.IsDraging = false;
        document.body.style.cursor = "";
        Event.stopObserving(window, "selectstart", this.returnFalse, false);
        if (document.body.releaseCapture) {
            document.body.releaseCapture()
        }
    },
    returnFalse: function() {
        return false
    }
};






function relogin1(url,title,width,height) {
    g_pop_a = new Popup({
		contentType: 1,//有4种类型,1代表iframe,使用1时，setContent方法也要对应使用相应的参数setContent("contentUrl","iframe地址");
					   //2代表一般html内容 对应setContent("contentHtml","html内容");
					   //3代表确认框，有确定取消按钮 对应setContent("confirmCon","确定要提交吗？");
					   //4代表alert框 对应setContent("alertCon","alert内容");
		isHaveTitle: true,// 是否有标题
		scrollType: "yes",// 弹出内容里是否有滚动条
		isBackgroundCanClick: false,// 背景层是否能够点击
		isSupportDraging: true,// 是否能够拖动窗口
		isShowShadow: true,// 是否显示窗口阴影
		isReloadOnClose: false,//关闭窗口是否重新加载父页面
		width: width,// 窗口宽
		height: height// 窗口高
			
    });
    g_pop_a.setContent("title", title);//设置窗口标题名称
    g_pop_a.setContent("contentUrl", url);// 设置窗口内容
    g_pop_a.build();
    g_pop_a.show();
}


function relogin2() {
    g_pop = new Popup({
		contentType: 2,//有4种类型,1代表iframe,使用1时，setContent方法也要对应使用相应的参数setContent("contentUrl","iframe地址");
					   //2代表一般html内容 对应setContent("contentHtml","html内容");
					   //3代表确认框，有确定取消按钮 对应setContent("confirmCon","确定要提交吗？");
					   //4代表alert框 对应setContent("alertCon","alert内容");
		isHaveTitle: true,// 是否有标题
		scrollType: "no",// 弹出内容里是否有滚动条
		isBackgroundCanClick: false,// 背景层是否能够点击
		isSupportDraging: true,// 是否能够拖动窗口
		isShowShadow: true,// 是否显示窗口阴影
		isReloadOnClose: true,//关闭窗口是否重新加载父页面
		width: 400,// 窗口宽
		height: 300// 窗口高
			
    });
    g_pop.setContent("title", "弹出窗口html");//设置窗口标题名称
    g_pop.setContent("contentHtml", "内容<br/>.......<br/>内容");// 设置窗口内容
    g_pop.build();
    g_pop.show();
}


function relogin3() {
    g_pop = new Popup({
		contentType: 3,//有4种类型,1代表iframe,使用1时，setContent方法也要对应使用相应的参数setContent("contentUrl","iframe地址");
					   //2代表一般html内容 对应setContent("contentHtml","html内容");
					   //3代表确认框，有确定取消按钮 对应setContent("confirmCon","确定要提交吗？");
					   //4代表alert框 对应setContent("alertCon","alert内容");
		isHaveTitle: false,// 是否有标题
		scrollType: "no",// 弹出内容里是否有滚动条
		isBackgroundCanClick: false,// 背景层是否能够点击
		isSupportDraging: true,// 是否能够拖动窗口
		isShowShadow: true,// 是否显示窗口阴影
		isReloadOnClose: true,//关闭窗口是否重新加载父页面
		width: 500,// 窗口宽
		height: 200// 窗口高
			
    });
    g_pop.setContent("title", "弹出窗口confirm");//设置窗口标题名称
    g_pop.setContent("confirmCon", "内容<br/>.......<br/>内容");// 设置窗口内容
	g_pop.setContent("callBack",function(){
		alert("点击确定后，回调函数");
		g_pop.close();
	});
    g_pop.build();
    g_pop.show();
}

function relogin4() {
    g_pop = new Popup({
		contentType: 4,//有4种类型,1代表iframe,使用1时，setContent方法也要对应使用相应的参数setContent("contentUrl","iframe地址");
					   //2代表一般html内容 对应setContent("contentHtml","html内容");
					   //3代表确认框，有确定取消按钮 对应setContent("confirmCon","确定要提交吗？");
					   //4代表alert框 对应setContent("alertCon","alert内容");
		isHaveTitle: true,// 是否有标题
		scrollType: "no",// 弹出内容里是否有滚动条
		isBackgroundCanClick: false,// 背景层是否能够点击
		isSupportDraging: true,// 是否能够拖动窗口
		isShowShadow: true,// 是否显示窗口阴影
		isReloadOnClose: true,//关闭窗口是否重新加载父页面
		width: 500,// 窗口宽
		height: 200// 窗口高
			
    });
    g_pop.setContent("title", "弹出窗口alert");//设置窗口标题名称
    g_pop.setContent("alertCon", "内容<br/>.......<br/>内容");// 设置窗口内容
    g_pop.build();
    g_pop.show();
}
