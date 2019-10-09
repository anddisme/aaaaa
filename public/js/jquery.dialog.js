/**
 * dialog插件
 * @author 小乐哥
 * @version 1.0 
 */
(function($){ 
	$.extend({
		dialog : function (options) {	
		
			//默认配置
			var defaults = {
		
				//对话框ID
				id: false,
					
			    //消息内容
			    content: "欢迎使用小乐哥 dialog!",
	
			    //确定按钮文本
			    okValue: '确定',
			    
			    //取消按钮文本
			    cancelValue: '取消',
			    
			    //标题
			    title: "提示消息",
			    
			    //内容宽度
			    width: "auto",
			    
			    //内容高度
			    height: "auto",
			    
			    //是否锁屏
			    lock: true
			};  
		
		    var config = $.extend(defaults, options);
		    config.id = config.id ? config.id : new Date().getTime();
		    
		    //插入DOM
		    var dom = $('<div id="' + config.id + '">' + $.dialog.templates + '</div>').hide();		   
		    dom.css({'position': 'absolute', 'z-index': '1989'});
	    	$("body").append(dom);    	
	    	
		    /**
		     * 初始化设置
		     */
		    this.init = function () {	
		    	this.dom = dom;
		    	this.config = config;
		    	dom.find('.d-buttons').hide();
		    	
				//设置内容	
				this.content(config.content);
				
				//设置标题
				this.title(config.title);
				
				//设置尺寸
				this.size(config.width, config.height);
				
				//设置居中
				this.position();
				
				//设置锁屏
				if (config.lock) {
					this.lock();
				}

				//监听事件
				dom.find(".d-close").bind("click", this.close);	
				
				//拖拽支持
				var mouse = {x:0, y:0};				
				function drag(event) {
		            var e = window.event || event;
		            var top = parseInt(dom.css('top')) + (e.clientY - mouse.y);
		            var left = parseInt(dom.css('left')) + (e.clientX - mouse.x);
		            dom.css({top:top,left:left});
		            mouse.x = e.clientX;
		            mouse.y = e.clientY;
		        }
				dom.find(".d-header").mousedown(function(event){
					var e = window.event || event;		
		            mouse.x = e.clientX;
		            mouse.y = e.clientY;
		            $(document).bind('mousemove', drag);
				});
				$(document).mouseup(function(event){
		            $(document).unbind('mousemove', drag);
		        });
				
				config.id = false;
			}
		    
			/**
			 * 打开对话框
			 */
			this.open = function () {
				this.init();	 
				dom.fadeTo("slow", 0.9);     
			}
		
			/**
		     * 设置内容
		     * @param {String} 内容
		     */
			this.content = function (message) {
				if (typeof message === "string") {
					dom.find(".d-main").html(message);
		        }
			}
			
			/**
		     * 设置标题
		     * @param {String, Boolean}	标题内容. 为 false 则隐藏标题栏
		     */
			this.title = function (content) {
		        if (content === false) {
		            dom.find(".d-header").hide();
		            dom.find(".d-title").html('')
		        } else {
		        	dom.find(".d-header").show();
		        	dom.find(".d-title").html(content)
		        };
		    }
			
			/**
			 * 位置居中
			 */
			this.position = function () {
				var left = ($(window).width() - dom.width()) / 2.0;
	            var top = ($(window).height() - dom.height()) / 2.5;
	            dom.css({
	            	top: top + $(document).scrollTop(), 
	            	left: left + $(document).scrollLeft()
	            });
			}
			
			/**
		     * 尺寸
		     * @param {Number, String} 宽度
		     * @param {Number, String} 高度
		     */
			this.size = function (width, height) {
				if (typeof width === "number") {
		            width = width + "px";
		        };
		        if (typeof height === "number") {
		            height = height + "px";
		        };
		        dom.find(".d-main").css("width", width);
		        dom.find(".d-main").css("height", height);
		    }
			
			/**
		     * 显示对话框
		     */
			this.visible = function () {
				dom.css("visibility", "visible");
		    }
			
			/**
		     * 隐藏对话框
		     */
			this.hidden = function () {
				dom.css("visibility", "hidden");
		    }
			
			/**
		     * 关闭对话框
		     */
			this.close = function () {
				dom.fadeOut("slow", function(){
		        	$(this).remove();
		        });     
		        $(".d-mask").fadeOut("slow", function(){
		        	$(this).remove();
		        });
		    }
			
			/**
			 * 设置锁屏
			 */
			this.lock = function () {
				$("body").append('<div id="' + this.config.id + '" class="d-mask"></div>');
				$(".d-mask").css({
					'z-index': '1988',
					'left': 0,
					'top': 0,
					'width': '100%', 
					'height': '100%', 
					'overflow': 'hidden', 
					'display': 'block'
				});
			}
		}
	});
	
	/**
	 * HTML模板
	 */
	$.dialog.templates = 
	'<div class="d-dialog">'
	+	'<table class="d-border" border="0" cellspacing="0" cellpadding="0">'
	+		'<tbody>'
	+			'<tr>'
	+				'<td class="d-header">'
	+					'<div class="d-title">Title</div>'
	+					'<a class="d-close" href="javascript:">[关闭]</a>'
	+				'</td>'
	+			'</tr>'
	+			'<tr>'
	+				'<td class="d-main">'
	+				'</td>'
	+			'</tr>'
	+			'<tr>'
	+				'<td class="d-footer">'
	+					'<div class="d-buttons"></div>'
	+				'</td>'
	+			'</tr>'
	+		'</tbody>'
	+	'</table>'
	+'</div>';
})(jQuery);	