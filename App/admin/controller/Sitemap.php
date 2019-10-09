<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Ad as AdModel;
use think\db;
use think\Cookie;

class Sitemap extends Common
{
	public function __construct(){
		parent::__construct();
	}

	
	public function index(){
	
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		
		//file_put_contents($_SERVER['DOCUMENT_ROOT'].'/sitemap.xml',$xml);
		return view();
	}
	
	
	
	public function make()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		
		$sitemap=$_REQUEST['sitemap'];
		if(!sizeof($sitemap))
		{
		   exit('请选择要生成的类型！');	
		}
		//xml
		if(in_array('xml',$sitemap))
		{
			echo '/网站地图生成中...<br />';
			$caidan=db::name("lm")->order("`id` asc")->select();
			$article=db::name("article")->order("`id` asc")->select();
			
			$xml='';
			foreach($caidan as $k=>$v)
			{
				$xml.='<url>'.PHP_EOL;
				$xml.='<loc>'.WEB_URL.lmurl($v['id']).'</loc>'.PHP_EOL;
				$xml.='<lastmod>'.date("Y-m-d").'</lastmod>'.PHP_EOL;
				$xml.='<changefreq>weekly</changefreq>'.PHP_EOL;
				$xml.='<priority>0.8</priority>'.PHP_EOL;
				$xml.='</url>'.PHP_EOL;
			}
			foreach($article as $k=>$v)
			{
				$xml.='<url>'.PHP_EOL;
				$xml.='<loc>'.WEB_URL.idlname($v['id']).'</loc>'.PHP_EOL;
				$xml.='<lastmod>'.date("Y-m-d").'</lastmod>'.PHP_EOL;
				$xml.='<changefreq>weekly</changefreq>'.PHP_EOL;
				$xml.='<priority>1</priority>'.PHP_EOL;
				$xml.='</url>'.PHP_EOL;
			}
			$xmltemp=file_get_contents(WEB_ROOT.'/public/sitemap/sitemap.xml');
			$xmlcontent=str_replace("{@@}",$xml,$xmltemp);
			file_put_contents($_SERVER['DOCUMENT_ROOT'].'/sitemap.xml',$xmlcontent);
			echo '/sitemap.xml|生成成功-<a target="_blank" href="/sitemap.xml">浏览</a><br />';
			 addlog('Sitemap/index','sitemap.xml生成成功');
		}
		
		
		//html
		if(in_array('html',$sitemap))
		{
			$html='';
			foreach($caidan as $k=>$v)
			{
				$html.='<li>'.PHP_EOL;
				$html.='<div class="T1-h"><a href="'.WEB_URL.lmurl($v['id']).'" title="'.$v['TypeName'].'">'.$v['TypeName'].'</a></div>'.PHP_EOL;
				$html.='<div class="T2-h">'.date("Y-m-d H:i:s").'</div>'.PHP_EOL;
				$html.='<div class="T3-h">Weekly</div>'.PHP_EOL;
				$html.='<div class="T4-h">1</div>'.PHP_EOL;
				$html.='</li>';
			}
			
			foreach($article as $k=>$v)
			{
				$html.='<li>'.PHP_EOL;
				$html.='<div class="T1-h"><a href="'.WEB_URL.idlname($v['id']).'" title="'.$v['Title'].'">'.$v['Title'].'</a></div>'.PHP_EOL;
				$html.='<div class="T2-h">'.date("Y-m-d H:i:s").'</div>'.PHP_EOL;
				$html.='<div class="T3-h">Weekly</div>'.PHP_EOL;
				$html.='<div class="T4-h">1</div>'.PHP_EOL;
				$html.='</li>';
			}
			$htmltemp=file_get_contents(WEB_ROOT.'/public/sitemap/sitemap.html');
			$htmlcontent=str_replace("{@@}",$html,$htmltemp);
			file_put_contents($_SERVER['DOCUMENT_ROOT'].'/sitemap.html',$htmlcontent);
			echo '/sitemap.html|生成成功-<a target="_blank" href="/sitemap.html">浏览</a><br />';
			 addlog('Sitemap/html','sitemap.xml生成成功');
		}
		
		
		//txt
		
		if(in_array('txt',$sitemap))
		{
			$txt='';
			foreach($caidan as $k=>$v)
			{
				$txt.=WEB_URL.lmurl($v['id']).PHP_EOL;
			}
			
			foreach($article as $k=>$v)
			{
				$txt.=WEB_URL.idlname($v['id']).PHP_EOL;
			}
			$htmltxt=file_get_contents(WEB_ROOT.'/public/sitemap/sitemap.txt');
			$htmltxt=str_replace("{@@}",$txt,$htmltxt);
			file_put_contents($_SERVER['DOCUMENT_ROOT'].'/sitemap.txt',$htmltxt);
			echo '/sitemap.txt|生成成功-<a target="_blank" href="/sitemap.txt">浏览</a><br />';
			addlog('Sitemap/txt','sitemap.xml生成成功');
			echo '生成完毕<br />';
			}
		
	   }

	
	
}
