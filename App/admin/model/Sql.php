<?php
namespace app\admin\model;
use think\Model;
class Sql extends Model
{






    /** 
     * @description 获取当前数据库的所有表名。 
     * @static 
     * @return array 
     */  
    public function getTables()  
    {  
		$dbName = config('database');
		$dbName=$dbName['database'];
        $result=Db()->query("SHOW FULL TABLES FROM `{$dbName}` WHERE Table_Type = 'BASE TABLE'");  
  
        foreach ($result as $v){ 
		//print_r($v);
        //exit; 
            $tbArray[]=$v['Tables_in_'.$dbName];  
        }  
        return $tbArray;  
    }  
   public function getViews()  
    {  
		$dbName = config('database');
		$dbName=$dbName['database'];
        $result=Db()->query("SHOW FULL TABLES FROM `{$dbName}` WHERE Table_Type = 'VIEW'");  
  
        foreach ($result as $v){  
            $tbArray[]=$v['Tables_in_'.C('DB_NAME')];  
        }  
        return $tbArray;  
    }  
  
    /** 
     * @description 导出SQL数据，但不包含表创建代码。 
     * @static 
     * @return string 
     */  
    public function ExportAllData()  
    {  
        $tables = self::getTables();  
        $arrAll = array(  
            "SET FOREIGN_KEY_CHECKS=0;",  
            self::BuildAllTriggerDropSql(),  
            self::BuildTableSql(),  
            self::BuildViewSql()  
        );  
        $tbl = db();  
        foreach($tables as $table)  
        {  
            $arrAll[]="\r\nDELETE FROM {$table};";  
  
            /* 
            $rs = $tbl->query("SHOW COLUMNS FROM {$table}"); 
            $arrFields = array(); 
            foreach ($rs as $k=>&$v){ 
                $arrFields[] = "`{$v['Field']}`"; 
 
            } 
 
            $sqlFields = implode($arrFields,","); 
            */  
            $rs=$tbl->query("select * from `{$table}`");  
            foreach ($rs as $k=>&$v){  
                $arrValues = array();  
                foreach($v as $key=>$val)  
                {  
                    if(is_numeric($val)){  
                        $arrValues[]=$val;  
                    }else if(is_null($val)){  
                        $arrValues[]='NULL';  
                    }else{  
                        $arrValues[]="'".addslashes($val)."'";  
                    }  
                }  
                $arrAll[] = "INSERT INTO `{$table}` VALUES (".implode(',',$arrValues).");";  
            }  
        }  
        $arrAll[]=self::BuildTriggerCreateSql();  
        return implode("\r\n",$arrAll);  
		     
    } 
	
	
	 
  
   public function BuildTableSql()  
    {  
        $tables = self::getTables();  
        $arrAll = array();  
        foreach($tables as &$val){  
            $rs = Db()->query("SHOW CREATE TABLE `{$val}`");  
  
            $tbSql = preg_replace("#CREATE(.*)\\s+TABLE#","CREATE TABLE",$rs[0]['Create Table']);  
  
            $arrAll[] = "DROP TABLE IF EXISTS `{$rs[0]['Table']}`;\r\n{$tbSql};\r\n";  
        }  
  
        return implode("\r\n",$arrAll);  
    }  
  
    public function BuildViewSql()  
    {  
        $views = self::getViews();  
        $arrAll = array();  
        foreach($views as &$val){  
            $rs = M()->query("SHOW CREATE VIEW `{$val}`");  
            $tbSql = preg_replace("#CREATE(.*)\\s+VIEW#","CREATE VIEW",$rs[0]['Create View']);  
  
            $arrAll[] = "DROP VIEW IF EXISTS `{$rs[0]['View']}`;\r\n{$tbSql};\r\n";  
        }  
        return implode("\r\n",$arrAll);  
    }  
    /** 
     * @description 如果存在触发器，生成删除代码。原因是:插入数据的时候可能会受到触发器影响。 
     * @static 
     * @return string 
     */  
   public function BuildAllTriggerDropSql()  
    {  
        $rs = Db()->query("show triggers");  
        $arrAll = array();  
        foreach ($rs as $k=>&$v)  
        {  
            $arrSql = array(  
                'DROP TRIGGER IF EXISTS `',$v['Trigger'],'`;'  
            );  
  
            $arrAll[] = implode('',$arrSql);  
        }  
        return implode("\r\n",$arrAll);  
    }  
  
    /** 
     * @description 生成所有触发器的创建代码。 
     * @static 
     * @return string 
     */  
   public function BuildTriggerCreateSql()  
    {  
        $rs = Db()->query("show triggers");  
        $arrAll = array();  
        foreach ($rs as $k=>&$v)  
        {  
            $arrSql = array(  
                'CREATE TRIGGER `',$v['Trigger'],'` ',$v['Timing'],' ',$v['Event'],' ON `',  
                $v['Table'],'` FOR EACH ROW ',$v['Statement'],';'  
            );  
  
            $arrAll[] = implode('',$arrSql);  
        }  
        return implode("\r\n",$arrAll);  
    }  






}
