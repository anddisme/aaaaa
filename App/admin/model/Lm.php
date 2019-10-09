<?php
namespace app\admin\model;
use think\Model;
class Lm extends Model
{
    
	
    
	
	
	   public function save($data,$id){
        $data1=$data;
        //return db('article')->where('id',$id)->update($data);
        return $this::db("lm")->where('id',$id)->update($data);
    
    }

	
	   public function add($data){
        $data1=$data;
        //return db('article')->where('id',$id)->update($data);
        return $this::db("lm")->where('id',$id)->update($data);
    
    }







}
