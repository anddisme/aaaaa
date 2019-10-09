<?php
namespace app\admin\controller;
use app\admin\controller\Common;
class Index extends Common
{
    public function index()
    {
		@header("Content-Type:text/html; charset=utf-8");
        return view();
    }
	    public function main()
    {
		@header("Content-Type:text/html; charset=utf-8");
        return view();
    }
}
