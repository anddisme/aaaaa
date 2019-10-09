$(function(){       

	 $("#content").load(function(){

		$(this).height($(this).contents().find("body").height()+300);

	 });

	 //chkadmin(1000);

})

	

function bs()

{

	var gh=$("#lefts").data("thehiehgt");

	var rh=$("#content").contents().find("body").height()+340;

	if (gh>rh){$("#content").height(gh-200)}else{$("#content").height(rh);clearInterval(dds);}

	alert(rh);alert(gh);

}

function addurl(url){$("#add,#add2").attr("href",url);$("#add4").attr("href",url);$(window.parent.document).find("#add4").attr("href",url);}



function chkadmin(times)
{

}



function showalert(str,nopopup,ty,time,theFunc)
{
	closealert();
	var popstr='<div class="lightBoxpopupCover"></div>';
	if(nopopup==1){popstr='';}
	$("body").append('<div id="lightBox" class="lightBox"><iframe class="lightBoxpopupIframe"></iframe>'+popstr+'<div class="lightBoxbox"><span class="lightBoxMaxHeight"></span><div class="lightBoxContent"><form id="lightBoxForm"><div class="lightBoxWrapper"></div><div class="lightBoxSubmit"></div></form></div></div></div>').end().find("#lightBox").show();
	var i=3,interval="",intimg="",closetext="关闭",op=1,istime=0;
	if(time!=undefined&&time!=""&&time!=0)
	{istime=2;	istime=istime-1;}
	if(istime==1){
		i=time;
		closetext="关闭("+time+")";
		interval=setInterval(function(){
			i--;$('#lightBoxclose').val("关闭("+i+")");
			if(i==0){clearInterval(interval);if(typeof(theFunc)=="function"){theFunc();};closealert();}
		},1000);
	}
	if(ty==undefined){ty=1;}
		switch(ty)
		{
		case 1://info
			$("#lightBox .lightBoxWrapper").append(str)
				.siblings(".lightBoxSubmit")
					.append('<input id="lightBoxclose" onclick="closealert();" type="button" value="'+closetext+'" />')
				.parent().addClass("lightBoxinfo").end()
				.find("#lightBoxclose").focus()
				.bind('click',function(){
					if(istime==1){clearInterval(interval);}
					if(typeof(theFunc)=="function"){theFunc();};
					$('#lightBox').remove();
				});
				$('#lightBox .lightBoxContent').jqDrag().css("cursor","move");

		break;

		case 2://box

				$("#lightBox .lightBoxWrapper").append(str)

				.siblings(".lightBoxSubmit").css("cursor","move")

					.append('<input id="lightBoxclose" onclick="closealert();" type="button" value="'+closetext+'" />')

				.find("#lightBoxclose").focus()

				.bind('click',function(){

					if(istime==1){clearInterval(interval);}

					if(typeof(theFunc)=="function"){theFunc();};

					closealert();

				});

				$('#lightBox .lightBoxContent').jqDrag(".lightBoxSubmit");

				

			break;

		}

}





function loading(str)

{

	$("body").append('<div id="loading" class="lightBox"><iframe class="lightBoxpopupIframe"></iframe><div class="lightBoxpopupCover"></div><div class="lightBoxbox"><span class="lightBoxMaxHeight"></span><div class="lightBoxContent lightBoxloading"><div class="lightBoxWrapper">'+str+'</div></div></div></div>').find("#loading").show();

}



function closealert(){$("#lightBox,#loading").remove();}
function closealertx(){parent().find("#lightBox,#loading").remove();}