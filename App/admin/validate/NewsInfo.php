<?php
namespace app\admin\validate;
use think\Validate;
class Article extends Validate
{

    protected $rule=[
        'title'=>'unique:article|require',
        'cateid'=>'require',
        'content'=>'require',
    ];


    protected $message=[
        'Title.require'=>'文章标题不得为空！',
        'TypeID.require'=>'栏目不存在！',
    ];

    protected $scene=[
        'add'=>['Title','TypeID'],
        'edit'=>['Title','TypeID'],
    ];





    

    




   

	












}
