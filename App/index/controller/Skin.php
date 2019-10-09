<?php
namespace app\index\controller;
class Skin
{
	
	
    public function css()
    {
		 $url=get('url');
		echo $this->fn_safe($url);
		exit;
		
		
		
	
	   
	   
	   
	   
	   
	   
	   echo '/'.$url.'.css';
	   exit;
    }
	
	
	public function fn_safe($str_string) {
    //ֱ���޳�
    $_arr_dangerChars = array(
        "|", ";", "$", "@", "+", "\t", "\r", "\n", ",", "(", ")", PHP_EOL //�����ַ�
    );
 
    //�����޳�
    $_arr_dangerRegs = array(
        /* -------- ��վ --------*/
        //html ��ǩ
        "/<(script|frame|iframe|bgsound|link|object|applet|embed|blink|style|layer|ilayer|base|meta)\s+\S*>/i",
 
        //html ����
        "/on(afterprint|beforeprint|beforeunload|error|haschange|load|message|offline|online|pagehide|pageshow|popstate|redo|resize|storage|undo|unload|blur|change|contextmenu|focus|formchange|forminput|input|invalid|reset|select|submit|keydown|keypress|keyup|click|dblclick|drag|dragend|dragenter|dragleave|dragover|dragstart|drop|mousedown|mousemove|mouseout|mouseover|mouseup|mousewheel|scroll|abort|canplay|canplaythrough|durationchange|emptied|ended|error|loadeddata|loadedmetadata|loadstart|pause|play|playing|progress|ratechange|readystatechange|seeked|seeking|stalled|suspend|timeupdate|volumechange|waiting)\s*=\s*(\"|')?\S*(\"|')?/i",
 
        //html ���԰����ű�
        "/\w+\s*=\s*(\"|')?(java|vb)script:\S*(\"|')?/i",
 
        //js ����
        "/(document|location)\s*\.\s*\S*/i",
 
        //js ����
        "/(eval|alert|prompt|msgbox)\s*\(.*\)/i",
 
        //css
        "/expression\s*:\s*\S*/i",
 
        /* -------- sql ע�� --------*/
 
        //��ʾ ���ݿ� | �� | ���� | �ֶ�
        "/show\s+(databases|tables|index|columns)/i",
 
        //���� ���ݿ� | �� | ���� | ��ͼ | �洢���� | �洢����
        "/create\s+(database|table|(unique\s+)?index|view|procedure|proc)/i",
 
        //���� ���ݿ� | ��
        "/alter\s+(database|table)/i",
 
        //���� ���ݿ� | �� | ���� | ��ͼ | �ֶ�
        "/drop\s+(database|table|index|view|column)/i",
 
        //���� ���ݿ� | ��־
        "/backup\s+(database|log)/i",
 
        //��ʼ�� ��
        "/truncate\s+table/i",
 
        //�滻 ��ͼ
        "/replace\s+view/i",
 
        //���� | ���� �ֶ�
        "/(add|change)\s+column/i",
 
        //ѡ�� | ���� | ɾ�� ��¼
        "/(select|update|delete)\s+\S*\s+from/i",
 
        //���� ��¼ | ѡ���ļ�
        "/insert\s+into/i",
 
        //sql ����
        "/load_file\s*\(.*\)/i",
 
        //sql ����
        "/(outfile|infile)\s+(\"|')?\S*(\"|')/i",
    );
 
    $_str_return = $str_string;
    //$_str_return = urlencode($_str_return);
 
    foreach ($_arr_dangerChars as $_key=>$_value) {
        $_str_return = str_ireplace($_value, "", $_str_return);
    }
 
    foreach ($_arr_dangerRegs as $_key=>$_value) {
        $_str_return = preg_replace($_value, "", $_str_return);
    }
 
    $_str_return = htmlentities($_str_return, ENT_QUOTES, "UTF-8", true);
 
    return $_str_return;
}
	
	
	
	
	
}
