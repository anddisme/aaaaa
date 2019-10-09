function reset_pic(obj, size) {
	size = size.split(',');	
	var dW = size[0];
	var dH = size[1];
	var img = new Image();
	img.src = obj.src;
	if(img.width/img.height >= dW/dH) {
		if(img.width > dW) {
			obj.width = dW;
			obj.height = img.height*dW/img.width;	
		}else {
			obj.width = img.width;
			obj.height = img.height > dH ? img.height*img.width/dW : img.height;	
		}	
	}else {
		if(img.height > dH) {
			obj.height = dH;
			obj.width = img.width*dH/img.height;
		}else {
			obj.height = img.height;
			obj.width = img.width > dW ? img.height*img.width/dH : img.width;
		}	
	}
}
function reset_pic2(obj, size) {
	size = size.split(',');	
	var dW = size[0];
	var dH = size[1];
	var img = new Image();
	img.src = obj.src;
	if(img.width/img.height >= dW/dH) {
		if(img.width > dW) {
			obj.width = dW;
			obj.height = img.height*dW/img.width;	
		}else {
			obj.width = img.width;
			obj.height = img.height > dH ? img.height*img.width/dW : img.height;	
		}	
	}else {
		if(img.height > dH) {
			obj.height = dH;
			obj.width = img.width*dH/img.height;
		}else {
			obj.height = img.height;
			obj.width = img.width > dW ? img.height*img.width/dH : img.width;
		}	
	}
	obj.style.marginTop = (dH-obj.height)/2+'px';
}
function slider(obj) {
	document.getElementById("big_pic2").href = obj.src;
	document.getElementById("big_pic").src = obj.src;	
}

function ppRoll(a)
{
	this.myA = a;
	this.myA.IsPlay = 1;
	this.$(a.demo).style.overflow = "hidden";
	this.$(a.demo).style.width = a.width;
	this.$(a.demo).style.height = a.height;
	this.$(a.demo2).innerHTML=this.$(a.demo1).innerHTML;
	this.$(a.demo).scrollTop=this.$(a.demo).scrollHeight;
	this.Marquee();
	this.$(a.demo).onmouseover=function() {eval(a.objStr+".clearIntervalpp();");}
	this.$(a.demo).onmouseout=function() {eval(a.objStr+".setTimeoutpp();")}
	if ((a.Control)==1)
	{
		
	this.$(a.left).onclick=function(){eval(a.objStr+".fleft();");};
	this.$(a.right).onclick=function(){eval(a.objStr+".fright();");};
	}
}


ppRoll.prototype.$ = function(Id)
{
	return document.getElementById(Id);
}

ppRoll.prototype.Marquee = function()
{
	this.MyMar=setTimeout(this.myA.objStr+".Marquee();",this.myA.speed);
	if(this.myA.IsPlay == 1)
	{
		//向上滚动
		if(this.myA.direction == "top")
		{
			if(this.$(this.myA.demo).scrollTop>=this.$(this.myA.demo2).offsetHeight)
				this.$(this.myA.demo).scrollTop-=this.$(this.myA.demo2).offsetHeight;
			else{
				this.$(this.myA.demo).scrollTop++;
			}
		}
		
		//向下滚动
		if(this.myA.direction == "down")
		{
			if(this.$(this.myA.demo1).offsetTop-this.$(this.myA.demo).scrollTop>=0)
				this.$(this.myA.demo).scrollTop+=this.$(this.myA.demo2).offsetHeight;
			else{
				this.$(this.myA.demo).scrollTop--;
			}
		}
		
		//向左滚动
		if(this.myA.direction == "left")
		{
			if(this.$(this.myA.demo2).offsetWidth-this.$(this.myA.demo).scrollLeft<=0)
				this.$(this.myA.demo).scrollLeft-=this.$(this.myA.demo1).offsetWidth;
			else{
				this.$(this.myA.demo).scrollLeft++;
			}
		}
		
		//向右滚动
		if(this.myA.direction == "right")
		{
			if(this.$(this.myA.demo).scrollLeft<=0)
				this.$(this.myA.demo).scrollLeft+=this.$(this.myA.demo2).offsetWidth;
			else{
				this.$(this.myA.demo).scrollLeft--;
			}
		}

	}
}

ppRoll.prototype.fleft = function()
{
	this.myA.direction="left";
}

ppRoll.prototype.fright = function()
{
	this.myA.direction="right";
}
ppRoll.prototype.clearIntervalpp = function()
{
	this.myA.IsPlay = 0;
}
ppRoll.prototype.setTimeoutpp = function()
{
	this.myA.IsPlay = 1;
}
