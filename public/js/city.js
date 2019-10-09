$('#province_list').change(function(){
                $('#city_list option[value!=""]').remove();
                $('#area_list option[value!=""]').remove();
                var province = $(this).val();
				//alert(province);
                $.ajax({
                    url:"/index.php?m=City&a=index",
                    type:'get',
                    data:{id:province},
                    dataType:'json',
                    success:function(data){
						
                        var html ='<option value="">--选择城市--</option>';
                        for(var i in data){
                            html += '<option value="'+data[i].id+'">'+data[i].cityname+'</option>';
                        }
                        $('#city_list').html(html);
                    }
                })
            });

            $('#city_list').change(function(){
                $('#area_list option[value!=""]').remove();
                var city = $(this).val();
                $.ajax({
                    url:"/index.php?m=City&a=index",
                    type:'get',
                    dataType:'json',
                    data:{id:city},
                    success:function(data){
                        var html ='<option value="">--地区--</option>';
                        for(var i in data){
                            html += '<option value="'+data[i].id+'">'+data[i].cityname+'</option>';
                        }
                        $('#area_list').html(html);
                    }
                })
            });