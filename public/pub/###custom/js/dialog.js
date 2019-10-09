function errorDialog(status,message,url){
  new $.Zebra_Dialog('<strong>'+message+'</strong>',
  {
    'type':     'warning',
    'title':    '提示',
    'buttons': [
                {caption: '确定', callback: function() {
                  if (url!=null&&url!='') {
                    if(url=='reload'){
                      window.location.reload();
                    }else{
                      window.location.href=url;
                    }
                  }
                }},
                {caption: '取消', callback: function() {}},
              ],
    'animation_speed_hide':0,
  });
}
