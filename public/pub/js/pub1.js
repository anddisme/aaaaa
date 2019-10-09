function del(id,table)
{
	if(!confirm('请谨慎删除,确定要删除吗？')){ return false; }
				
				
 if(id<1){ show_('id为空，无法删除数据'); return false; }	
 if(table==''){ show_('数据表为空，无法删除数据'); return false; }	
 $.get("index.php?m=pub&a=del&table="+table+"&id="+id,function(data,status){
     if(data=='y')
	 {
	 show_('删除成功');
	   $("#"+id).html('');
	   $("#"+id).hide();
	 return false;
	 }else{
	 show_(data);
	 return false;
	 }
  });
}
