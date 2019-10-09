<?php
namespace app\admin\model;
use think\Model;
class Article extends Model
{
    
	
    
	
	
	   public function saveArticle($data,$id){
        $data1=$data;
        //return db('article')->where('id',$id)->update($data);
        return $this::db("article")->where('id',$id)->update($data);
    
    }







}
