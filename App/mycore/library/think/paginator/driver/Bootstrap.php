<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: zhangyajun <448901948@qq.com>
// +----------------------------------------------------------------------

namespace think\paginator\driver;

use think\Paginator;

class Bootstrap extends Paginator
{

    /**
     * 上一页按钮
     * @param string $text
     * @return string
     */
    protected function getPreviousButton($text = "&laquo;")
    {

        if ($this->currentPage() <= 1) {
            return $this->getDisabledTextWrapper($text);
        }

        $url = $this->thisurl(
            $this->currentPage() - 1
        );
        
		return $this->getPageLinkWrapper($url, $text ,'yes');
	}
	
    /**
     * url处理
     * @param string $page
     * @return string
     */
	protected function thisurl($page)
	{
		//return '='.get9'html'];
		//return $this->url($page-1).'=';
		if(get('html')==1)
		{
			//return 'html';
		  //生成html url
		    /*
			$url=$_SERVER['REQUEST_URI'];
			$url=parse_url($url);
			$url1=$url['path'];
			$url2=$url1.'/list_'.$page.'.html';
			*/
			return 'list_'.$page.'.html';
		}
		return $this->url($page);
		
		//return $page;
		//if(!empty(get("url")))
		//{
			//伪静态
			/*
			$url=$_SERVER['REQUEST_URI'];
			$url=parse_url($url);
			
			
			$url1=$url['path'];
			$url2=$url['query'];
			$nowpage=get('page');
			//return $url;
			if($nowpage<1) $nowpage=1;
			
			
			$url2=str_replace('='.$nowpage,'='.$page,$url2);
			
			
			
			if(empty($url2))
			{
			  $url2='page='.$page;	
			}else{
			   return $url1.'?'.$url2.'&'.$url2;	
			}
			
			return $url1.'?'.$url2;
			*/
			$url1=$_SERVER['REQUEST_URI'];
			$url1=parse_url($url1);
			$url2=$url1['query'];
			$url2=explode("&",$url2);
			//return var_export($url2);
			
			return $this->url($page,'abc');
			
			
		//}else{
			//系统默认 
		//	return $this->url($page-1);
		//}
		
	}

    /**
     * 下一页按钮
     * @param string $text
     * @return string
     */
    protected function getNextButton($text = '&raquo;')
    {
        if (!$this->hasMore) {
            return $this->getDisabledTextWrapper($text);
        }

        $url = $this->thisurl($this->currentPage() + 1);
	

         return $this->getPageLinkWrapper($url, $text ,'yes');
    }

    /**
     * 页码按钮
     * @return string
     */
    protected function getLinks()
    {
        if ($this->simple)
            return '';

        $block = [
            'first'  => null,
            'slider' => null,
            'last'   => null
        ];

        $side   = 3;
        $window = $side * 2;

        if ($this->lastPage < $window + 6) {
            $block['first'] = $this->getUrlRange(1, $this->lastPage);
        } elseif ($this->currentPage <= $window) {
            $block['first'] = $this->getUrlRange(1, $window + 2);
            $block['last']  = $this->getUrlRange($this->lastPage - 1, $this->lastPage);
        } elseif ($this->currentPage > ($this->lastPage - $window)) {
            $block['first'] = $this->getUrlRange(1, 2);
            $block['last']  = $this->getUrlRange($this->lastPage - ($window + 2), $this->lastPage);
        } else {
            $block['first']  = $this->getUrlRange(1, 2);
            $block['slider'] = $this->getUrlRange($this->currentPage - $side, $this->currentPage + $side);
            $block['last']   = $this->getUrlRange($this->lastPage - 1, $this->lastPage);
        }

        $html = '';

        if (is_array($block['first'])) {
            $html .= $this->getUrlLinks($block['first']);
        }

        if (is_array($block['slider'])) {
            $html .= $this->getDots();
            $html .= $this->getUrlLinks($block['slider']);
        }

        if (is_array($block['last'])) {
            $html .= $this->getDots();
            $html .= $this->getUrlLinks($block['last']);
        }

        return $html;
    }


    /**
     * 渲染分页html
     * @return mixed
     */
    public function render()
    {
        if ($this->hasPages()) {
            if ($this->simple) {
                return sprintf(
                    '<ul class="pager">%s %s</ul>',
                    $this->getPreviousButton(),
                    $this->getNextButton()
                );
            } else {
                return sprintf(
                    '<ul class="pagination">%s %s %s</ul>',
                    $this->getPreviousButton(),
                    $this->getLinks(),
                    $this->getNextButton()
                );
            }
        }
    }


    /**
     * 生成一个可点击的按钮
     *
     * @param  string $url
     * @param  int    $page
     * @return string
     */
    protected function getAvailablePageWrapper($url, $page , $numns='')
    {
		/*
		if(!empty(get('url')))
		{
			//$nowhost=$_SERVER['HTTP_HOST'];
			
			$nowuri=$_SERVER['REQUEST_URI'];
			$nowuri=explode("?",$nowuri);
			$nowuri=$nowuri[0];
		    $nowuri=$nowuri.'/';
		    $url2=str_replace('//','/',$url2);
		
			$url0=$_SERVER['REQUEST_URI'];
			$url1=parse_url($url);
			$url2=$url1['path'].'/';
			
			//$getarr=get();
			
			
			
			$url2 .= '?'.$url1['query'];
			
			
			
			
			$url=$url2;
		}	*/
		//$url1=parse_url($url);
		//$url=$url1['query'];
		if($numns=='yes')
		{
          return '<a href="' . htmlentities($url) . '">' . $page . '</a>';
		}
		
		
        return '<a href="' . htmlentities($this->thisurl($page)) . '">' . $page . '</a>';
    }













    /**
     * 生成一个禁用的按钮
     *
     * @param  string $text
     * @return string
     */
    protected function getDisabledTextWrapper($text)
    {
        return '<a>' . $text . '</a>';
    }

    /**
     * 生成一个激活的按钮
     *
     * @param  string $text
     * @return string
     */
    protected function getActivePageWrapper($text)
    {
        return '<a>' . $text . '</a>';
    }

    /**
     * 生成省略号按钮
     *
     * @return string
     */
    protected function getDots()
    {
        return $this->getDisabledTextWrapper('...');
    }

    /**
     * 批量生成页码按钮.
     *
     * @param  array $urls
     * @return string
     */
    protected function getUrlLinks(array $urls)
    {
        $html = '';

        foreach ($urls as $page => $url) {
            $html .= $this->getPageLinkWrapper($url, $page);
        }

        return $html;
    }

    /**
     * 生成普通页码按钮
     *
     * @param  string $url
     * @param  int    $page
     * @return string
     */
    protected function getPageLinkWrapper($url, $page , $numns='no')
    {
        if ($page == $this->currentPage()) {
            return $this->getActivePageWrapper($page);
        }

        return $this->getAvailablePageWrapper($url, $page , $numns);
    }
}