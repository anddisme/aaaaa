$(function(){
    //左侧轮播图
    var ali=$('#productNav li');
    var aPage=$('#productSlider li');
    var aNext=$('.product-next-button');
    var aPrev=$('.product-previous-button');
    var aliLth=aPage.length-1;
    var iNow=0;

    ali.each(function(index){
        $(this).mouseenter(function(){
            slide(index);
        })
    });

    function slide(index){
        iNow=index;
        ali.eq(index).addClass('active').siblings().removeClass();
        aPage.eq(index).siblings().stop().animate({opacity:0},1000);
        aPage.eq(index).stop().animate({opacity:1},1000);
    }

    function autoRun(){
        iNow++;
        if(iNow==ali.length){
            iNow=0;
        }
        slide(iNow);
    }

    var timer=setInterval(autoRun,5000);

    $('#productSlider li,.product-next-button,.product-previous-button').hover(function(){
        clearInterval(timer);
    },function(){
        timer=setInterval(autoRun,5000);
    });

    aNext.click(function(){
        if(iNow != aliLth){
            slide(iNow+1);
        }else{
            slide(0);
        }
    })
    aPrev.click(function(){
        if(iNow != 0){
            slide(iNow-1);
        }else{
            slide(aliLth);
        }
    })
    //地区选择tab切换
    $('.stock-select').tab({
        colorChangeClass:'active',
        eventType:'click',
        fiUl:'.stock-tab li',
        thDiv:'.stock-con .area-list'
    });

    //商品详情切换
    //$('.product-detail').tab({
    //    colorChangeClass:'active',
    //    eventType:'click',
    //    fiUl:'.detail-tab-trigger li',
    //    thDiv:'.product-detail-wrapper .product-details-content'
    //});
    $('.detail-tab-trigger li').on('click',function(){
        var toId = $(this).find('a').attr("data-href");
        $(this).addClass('active').siblings().removeClass('active');
        $.scrollTo(toId,100);
    })

    //展开选择地区内容
    $('.region-selector').hover(function(){
        $(this).addClass('hover');
    }, function () {
        $(this).removeClass('hover');
    })

    //关闭选择地区内容
    $('.stock-close').on('click',function(){
        $('.region-selector').removeClass('hover');
    })

    //产品推荐展开效果
    $('.categoryTit b').on('click',function(){
        $(this).toggleClass('active');
        $(this).parent().next('.categoryList').toggleClass('show');
    })

    //吸顶层
    var toTopHeight = $('#productDetail').offset().top,
        proTab = $('.product-detail-tab'),
        protabInner = $('#protabInner'),
        prodWrapper = $('.product-detail-wrapper');
    $(window).scroll(function(){
        var scrollTop = $(document).scrollTop(),
            proTarget = $('.targetPos');
        if(scrollTop >= toTopHeight){
            proTab.addClass('product-detail-fixed');
            protabInner.addClass('product-tab-inner');
            prodWrapper.addClass('padtop60');
            proTarget.css('top','4px');
            //protabA.attr('href','#productDetail');
        }else{
            proTab.removeClass('product-detail-fixed');
            protabInner.removeClass('product-tab-inner');
            prodWrapper.removeClass('padtop60');
            proTarget.css('top','-1px');
           // protabA.attr('href','javascript:void(0);');
        }
    })

    //关于我们滚动图
    $("#pikame").PikaChoose({
        carousel:true,
        carouselVertical:true,
        autoPlay:false
    });

    //
    $('#servicerCon li:last').css('border','none');

    /**
     * 显示分享到微信的二维码图
     */
    $(".lickWeixin").click(function(){
        Base.colCanLayThick({
            layerObj:$("#knowPoperwx"),
            colse:$("#colse"),
            cance:""
        });
    });
    //	临时
    function showTips(){
        var html = '<p style="padding-top: 70px;line-height: 1;">选服务者或电话咨询,请拨打客服热线:</p><p style="font-size: 28px;color: #333;">400-6683-666</p><p><a href="javascript:void(0)" class="inlineBlock butgreen butpadding40 marT60" onclick="Base.dialog.close().remove();">我知道了</a></p>';
        Base.alert(html, '提醒', '600', '300');
    }

});
