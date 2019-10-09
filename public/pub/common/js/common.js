$(function () {
  $('input').iCheck({checkboxClass: 'icheckbox_square-blue',radioClass: 'iradio_square-blue',increaseArea: '20%'});
  $(window).scroll(function() {       
      if($(window).scrollTop()>= 100){
        $('#top').fadeIn(300); 
      }else{    
        $('#top').fadeOut(300);
      }  
  });
  $('#top').click(function(){$('html,body').animate({scrollTop: '0px'}, 800);});
  $('input[name=checkall]').on('ifChecked', function(event){
    $('input[class=checkid]').iCheck('check');
  });
  $('input[name=checkall]').on('ifUnchecked', function(event){
    $('input[class=checkid]').iCheck('uncheck');
  });
  $('input[class=checkid]').on('ifChecked', function(event){
    $('.opreats').removeClass('disabled');
  });
  $('input[class=checkid]').on('ifUnchecked', function(event){
    ifcheckbtn();
  });
  $('input[name=status]').on('ifChecked', function(event){
    listsearch();
  });
});
function ifcheckbtn(){
 var check = $('input[class=checkid]:checked').size();
 if(check>0){
    $('.opreats').removeClass('disabled');
  }else{
    $('.opreats').addClass('disabled');
  }
}
function listsearch()
{
  var types=['radio','checkbox'];
  var form = $('#formSearch');
  var url = form.attr('action');
  var inputs = new Array();
  var vals = new Array();
  var dataArr = new Array;
  var dataStr = "";
  form.find('input').each(function(){
    var input = $(this).attr('name');
    if (inputs.indexOf(input) == -1) {
      var type =$(this)[0].type;
      if (types.indexOf(type)==-1) {
        var v = $('input[name='+input+']').val();
      }else{
        var v = $('input[name='+input+']:checked').val();
      }
      if (v!=''&&v!=null) {
         inputs.push(input);
         vals.push(v);
      }
    }
  });
  if (inputs.length !=0) {
    for (var i = 0; i < inputs.length; i++) {
      var d = inputs[i] + "/" + vals[i];
      dataArr.push(d); 
    }
    url = url + "/" + dataArr.join("/");
    window.location.href = url;
  }else{
    window.location.href= url;
  }
}
function getids(){
  var ids=new Array();
  $('input[class=checkid]:checked').each(function(){
      var id = $(this).val();
      if(id!=null&&id!=""){
        ids.push(id);
      }
  });
  return ids;
}
function showdialog(status,message){
  var type = 'confirmation';
  if(status>0){
    type = 'confirmation';
  }else if(status<0){
    type = 'warning';
  }else{
    type = 'error';
  }
  new $.Zebra_Dialog('<strong>'+message+'</strong>',
  {
    'type':     type,
    'title':    '提示',
    'animation_speed_hide':250,
    'auto_close':10000,
    'onClose':function(){
      window.location.reload();
    }
  });
}
function operates(url,title){ 
  var ids = getids()
  $.Zebra_Dialog('<strong>'+title+'</strong>', {
    'type':     'question',
    'title':    '提示',
    'buttons': [
                {caption: '确定', callback: function() {
                  $.ajax({
                    url:url,
                    data:{'ids':ids},
                    type:"POST",
                    dataType:'json',
                    success:function(d){
                      showdialog(d.status,d.message);
                    },
                    error:function(e){
                      showdialog(-1,"数据错误");
                    }
                  });
                }},
                {caption: '取消', callback: function() {}},
              ],
    'animation_speed_hide':0,
  });
}
function operate(url,title){  
  $.Zebra_Dialog('<strong>'+title+'</strong>', {
      'type':     'question',
      'title':    '提示',
      'buttons': [
                  {caption: '确定', callback: function() {
                    $.ajax({
                       url:url,
                       type:"GET",
                       dataType:'json',
                       success:function(d){
                          showdialog(d.status,d.message);
                        },
                       error:function(e){
                          showdialog(-1,"数据错误");
                        }
                    });
                  }},
                  {caption: '取消', callback: function() {}},
                ],
      'animation_speed_hide':0,
  });
}
function editInput(obj,url,table,id){
  var attr= $(obj).attr('name');
  var vv =  $(obj).val();
  $.ajax({
    url:url,
    type:"POST",
    data:{'table':table,'id':id,'attr':attr,'vv':vv},
  });
}
function modalSubmit(obj,thisform){ 
  var data = $('#'+thisform).serialize();
  var url = $('#'+thisform).attr('action');
  $.ajax({
    url: url,
    type: 'post',
    data: data,
    dataType: 'json',
    beforeSend: function () {
    // 禁用按钮防止重复提交
        $(obj).text('保存中..');
        $(obj).parent().children("button").attr({ disabled: "disabled" });
    },
    success:function(data){
      if(data.status>0){
        window.location.reload();
      }else{
        $(obj).parent().children("button").removeAttr("disabled");
        $(obj).text('确定');
      }
    },
    complete: function () {
        $(obj).parent().children("button").removeAttr("disabled");
    },
    error: function (data) {
        alert("error");
        $(obj).parent().children("button").removeAttr("disabled");
        $(obj).text('确定');
    }
  });  
}
function showAjaxhtml(url)
{
  $.ajax({
    url:url,
    type:"get",
    dataType:'html',
    success:function(d){
      $('#ajaxHtml').html(d);
    }
  });
}
function hideAjaxhtml()
{
  $('#ajaxHtml').html('');
}