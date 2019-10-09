/**
 * Created by xiebin on 2019/4/30.
 */
$(function () {
    $(".banner").slide({mainCell:".bd ul",effect:"fold",autoPlay:true,trigger:"click",delayTime:1000});

    $(".main-nav li").hover(function () {
        $(this).children(".nav2").stop().slideDown(300);
    },function (){
        $(this).children(".nav2").stop().slideUp(300);
    });

    $(".policy-slide").slide({titCell:".hd ul",mainCell:".bd ul",interTime:3800,autoPage:true,effect:"top",autoPlay:true});


});

$(window).scroll(function () {
    var s = $(window).scrollTop();

    if(s > 680){

    }else{

    }


});



function gotoTop(min_height){
    var gotoTop_html = '<div id="top-btn">返回顶部</div>';
    $("#page").append(gotoTop_html);
    $("#top-btn").click(
        function(){$('html,body').animate({scrollTop:0},700);
        }).hover(
        function(){$(this).addClass("hover");},
        function(){$(this).removeClass("hover");
        });
    //获取页面的最小高度
    min_height ? min_height = min_height : min_height = 500;
    $(window).scroll(function(){
        //获取窗口的滚动条的垂直位置
        var s = $(window).scrollTop();
        if( s > min_height){
            $("#top-btn").fadeIn(500);
        }else{
            $("#top-btn").fadeOut(500);
        }
    });
}
gotoTop();

$("#top-btn").click(
    function(){$('html,body').animate({scrollTop:0},700);
    });


//锚点
$(document).ready(function scroll() {
    $('a').click(function() {
        $("html, body").animate({
            scrollTop: $($(this).attr("href")).offset().top + "px"
        }, {
            duration: 500,
            easing: "swing"
        });
        return false;
    });
});


AOS.init({
    disable: 'mobile',
    duration: 600,
    easing: 'ease-out-back',
    delay: 300
});