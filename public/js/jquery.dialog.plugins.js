/**
 * dialog插件
 * @author 小乐哥
 * @version 1.0 
 */
(function($){ 
	
	/**
	 * 打开对话框
	 */
	$.dialog.open = function(options){
		var dialog = new $.dialog(options);
		dialog.init();	 
		dialog.dom.fadeTo("slow", 0.9);   
		return dialog;
	}
	
	/**
	 * 警告框
	 * @param {String} 消息内容
	 * @param {Function} (可选) 回调函数
	 */
	$.dialog.alert = function(content, callback){
		var dialog = new $.dialog({
			id: 'Alert',
			lock: true,
			content: content
		});
		
		dialog.init();	 
		$('#Alert').find('.d-buttons').append('<input class="d-button" type="button" value="' + dialog.config.okValue + '">');
		
		dialog.dom.find('.d-buttons').show();
		dialog.dom.fadeTo("slow", 0.9);  

		$('.d-button').bind('click', callback);
		$('.d-button').bind('click', dialog.close);
		return dialog;
	}
})(jQuery);	