function checkedAttr(obj){
  var v = $(obj).attr("data-v");
  var p = $(obj).attr("data-p");
  $(obj).parent().find('a').removeClass('active');
  $(obj).addClass('active');
  $('#'+p).val(v);
}
function cutNum(){
var num = $('input[name=num]').val();
  if (num>1) {
    num--;
    $('input[name=num]').val(num);
  }
}
function addNum(){
  var num = $('input[name=num]').val();
  num++;
  $('input[name=num]').val(num);
}
function buynow(){
  var data = $('#form-subcart').serialize();
}
function addcart(){
  var data = $('#form-subcart').serialize();
  $.ajax({
     url:"/Home/Cart/addCart",
     type:"POST",
     async:false,
     data: data,
     dataType:'json',
     success:function(data){
        if(data.status>0){
          if(data.status==1){
              //addCarthtml(data.cart);
              editCarthtml(data.cart);
          }else if(data.status==2){
              editCarthtml(data.cart);
          }
          toggleCartEmpty(data.cartCount);
        }else{
          customAlert('warning',data.msg);
        }
     },
     error:function(e){
        customAlert('warning','加入便当篮子失败!');
     }
  }); 
}
