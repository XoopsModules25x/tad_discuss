<?php

function xoops_module_update_tad_discuss(&$module, $old_version) {
    GLOBAL $xoopsDB;
    if(chk_chk1()) go_update1();
    if(chk_chk2()) go_update2();
    if(chk_chk3()) go_update3();

    return true;
}

//�s�W���������
function chk_chk1(){
  global $xoopsDB;
  $sql="select count(`onlyTo`) from ".$xoopsDB->prefix("tad_discuss");
  $result=$xoopsDB->query($sql);
  if(empty($result)) return true;
  return false;
}


function go_update1(){
  global $xoopsDB;
  $sql="ALTER TABLE ".$xoopsDB->prefix("tad_discuss")." ADD `onlyTo` smallint(6) unsigned NOT NULL default 0";
  $xoopsDB->queryF($sql) or redirect_header(XOOPS_URL,3,  mysql_error());
  return true;
}

//�s�W���Q�װ�
function chk_chk2(){
  global $xoopsDB;
  $sql="select count(`ofBoardID`) from ".$xoopsDB->prefix("tad_discuss_board");
  $result=$xoopsDB->query($sql);
  if(empty($result)) return true;
  return false;
}


function go_update2(){
  global $xoopsDB;
  $sql="ALTER TABLE ".$xoopsDB->prefix("tad_discuss_board")." ADD `ofBoardID` smallint(6) unsigned NOT NULL default 0 after `BoardID`";
  $xoopsDB->queryF($sql) or redirect_header(XOOPS_URL,3,  mysql_error());
  return true;
}


//�s�W�o���̩m�W
function chk_chk3(){
  global $xoopsDB;
  $sql="select count(`publisher`) from ".$xoopsDB->prefix("tad_discuss");
  $result=$xoopsDB->query($sql);
  if(empty($result)) return true;
  return false;
}

function go_update3(){
  global $xoopsDB;
  $sql="ALTER TABLE ".$xoopsDB->prefix("tad_discuss")." ADD `publisher` varchar(255) NOT NULL default '' after `uid`";
  $xoopsDB->queryF($sql);
//echo "<p>$sql</p>";
  $sql="select `uid` from ".$xoopsDB->prefix("tad_discuss")." group by uid";
//echo "<p>$sql</p>";
  $result=$xoopsDB->query($sql);
  while(list($uid)=$xoopsDB->fetchRow($result)){
    $publisher=get_name_from_uid($uid);
//echo "<p>$publisher</p>";
    if($publisher){
      $sql="update ".$xoopsDB->prefix("tad_discuss")." set `publisher`='{$publisher}' where `uid`='{$uid}'";
//echo "<p>$sql</p>";
      $xoopsDB->queryF($sql);
    }
  }
  //exit;
  return true;
}



function get_name_from_uid($uid=""){
  global $xoopsDB;
  $sql = "select uname,name from `".$xoopsDB->prefix("users")."` where uid ='{$uid}'";
  $result = $xoopsDB->queryF($sql) or die($sql);
  list($uname,$name)=$xoopsDB->fetchRow($result);
  if(!empty($name))return $name;
  return $uname;
}




//�إߥؿ�
function mk_dir($dir=""){
    //�Y�L�ؿ��W�٨q�Xĵ�i�T��
    if(empty($dir))return;
    //�Y�ؿ����s�b���ܫإߥؿ�
    if (!is_dir($dir)) {
        umask(000);
        //�Y�إߥ��Ѩq�Xĵ�i�T��
        mkdir($dir, 0777);
    }
}

//�����ؿ�
function full_copy( $source="", $target=""){
  if ( is_dir( $source ) ){
    @mkdir( $target );
    $d = dir( $source );
    while ( FALSE !== ( $entry = $d->read() ) ){
      if ( $entry == '.' || $entry == '..' ){
        continue;
      }

      $Entry = $source . '/' . $entry;
      if ( is_dir( $Entry ) ) {
        full_copy( $Entry, $target . '/' . $entry );
        continue;
      }
      copy( $Entry, $target . '/' . $entry );
    }
    $d->close();
  }else{
    copy( $source, $target );
  }
}


function rename_win($oldfile,$newfile) {
   if (!rename($oldfile,$newfile)) {
      if (copy ($oldfile,$newfile)) {
         unlink($oldfile);
         return TRUE;
      }
      return FALSE;
   }
   return TRUE;
}


function delete_directory($dirname) {
    if (is_dir($dirname))
        $dir_handle = opendir($dirname);
    if (!$dir_handle)
        return false;
    while($file = readdir($dir_handle)) {
        if ($file != "." && $file != "..") {
            if (!is_dir($dirname."/".$file))
                unlink($dirname."/".$file);
            else
                delete_directory($dirname.'/'.$file);
        }
    }
    closedir($dir_handle);
    rmdir($dirname);
    return true;
}

?>
