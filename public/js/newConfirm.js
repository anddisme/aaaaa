/**
 * Created by chosen1cwp on 16/9/21.
 */
$(function ($) {
    $.alerts = {
        tips: function(title, message, callback) {
            if( title == null || title == '' ) title = 'Tips';
            $.alerts._show(title, message, null, 'tips', function(result) {
                if( callback ) callback(result);
            });
        },

        alert: function(title, message, callback) {
            if( title == null ) title = 'Alert';
            $.alerts._show(title, message, null, 'alert', function(result) {
                if( callback ) callback(result);
            });
        },

        confirm: function(title, message, callback) {
            if( title == null ) title = 'Confirm';
            $.alerts._show(title, message, null, 'confirm', function(result) {
                if( callback ) callback(result);
            });
        },

        _show: function(title, msg, value, type, callback) {
            var _html = "";

            _html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';
            _html += '<div id="mb_ico">×</div>';
            
            if (type == "tips") {
                _html += '<div id="mb_msg"><img src="/Public/Image/tips.png"></img>' + msg + '</div><div id="mb_btnbox">';
            }else{
                _html += '<div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';
            }

            if (type == "alert") {
                _html += '<input id="mb_btn_ok" type="button" value="确定" />';
            }
            
            if (type == "confirm") {
                _html += '<input id="mb_btn_ok" type="button" value="确定" />';
                _html += '<input id="mb_btn_no" type="button" value="取消" />';
            }
            _html += '</div></div>';

            // 必须先将_html添加到body
            $("body").append(_html);

            // 再设置Css样式
            GenerateCss();

            switch( type ) {
                case 'tips':
                    $("#mb_ico").click( function() {
                        $.alerts._hide();
                        if( callback ) callback(false);
                    });
                    $("#mb_ico").keypress( function(e) {
                        if( e.keyCode == 13 ) $("#mb_ico").trigger('click');
                    });
                    break;

                case 'alert':

                    $("#mb_btn_ok").click( function() {
                        $.alerts._hide();
                        callback(true);
                    });
                    $("#mb_btn_ok").focus().keypress( function(e) {
                        if( e.keyCode == 13 || e.keyCode == 27 ) $("#mb_btn_ok").trigger('click');
                    });
                    break;
                case 'confirm':

                    $("#mb_btn_ok").click( function() {
                        $.alerts._hide();
                        if( callback ) callback(true);
                    });
                    $("#mb_btn_no").click( function() {
                        $.alerts._hide();
                        if( callback ) callback(false);
                    });
                     $("#mb_ico").click( function() {
                        $.alerts._hide();
                        if( callback ) callback(false);
                    });
                    $("#mb_btn_no").focus();
                    $("#mb_btn_ok, #mb_btn_no").keypress( function(e) {
                        if( e.keyCode == 13 ) $("#mb_btn_ok").trigger('click');
                        if( e.keyCode == 27 ) $("#mb_btn_no").trigger('click');
                    });
                    break;
            }
        },
        _hide: function() {
            $("#mb_box,#mb_con").remove();
        }
    }
    kfwtips = function(title, message, callback) {
        $.alerts.tips(title, message, callback);
    }

    zdalert = function(title, message, callback) {
        $.alerts.alert(title, message, callback);
    }

    zdconfirm = function(title, message, callback) {
        $.alerts.confirm(title, message, callback);
    };

    // 设置Css样式
    var GenerateCss = function () {

        $("#mb_box").css({ width: '100%', height: '100%', zIndex: '99999', position: 'fixed',
            filter: 'Alpha(opacity=60)', backgroundColor: 'black', top: '0', left: '0', opacity: '0.6',fontSize:'14px'
        });

        $("#mb_con").css({ zIndex: '999999', width: '450px', position: 'fixed',
            backgroundColor: 'White', borderRadius: '5px',marginLeft:'-225px',left:'50%',top:'50%',marginTop:'-100px'
        });

        $("#mb_tit").css({ display: 'block', fontSize: '14px', color: '#444', padding: '10px 15px',
            backgroundColor: '#DDD', borderRadius: '5px 5px 0 0',
            fontWeight: 'bold'
        });

        $("#mb_msg").css({ padding: '40px', lineHeight: '20px',
             fontSize: '14px',textAlign:'center',color:'#666'
        });

        $("#mb_ico").css({ display: 'block', position: 'absolute', right: '10px', top: '9px',
            width: '18px', height: '18px', textAlign: 'center',color:"gray",
            lineHeight: '16px', cursor: 'pointer', fontFamily: '微软雅黑'
        });

        $("#mb_btnbox").css({ margin: '15px 0 25px 0', textAlign: 'center' });
        $("#mb_btn_ok,#mb_btn_no").css({ width: '88px', height: '16px', color: 'white', border: 'none' ,cursor:'pointer',borderRadius:'2px'});
        $("#mb_btn_ok").css({ backgroundColor: '#00b095' });
        $("#mb_btn_no").css({ backgroundColor: '#b5b5b5', marginLeft: '20px' });

        // 右上角关闭按钮hover样式
        $("#mb_ico").hover(function () {
            $(this).css({ backgroundColor: '#DDD', color: '#bbb' });
        }, function () {
            $(this).css({ backgroundColor: '#DDD', color: 'black' });
        });

        var _widht = document.documentElement.clientWidth; // 屏幕宽
        var _height = document.documentElement.clientHeight; // 屏幕高

        var boxWidth = $("#mb_con").width();
        var boxHeight = $("#mb_con").height();

        // 让提示框居中
        // $("#mb_con").css({ top: (_height - boxHeight) / 2 + "px", left: (_widht - boxWidth) / 2 + "px" });
    }


});

