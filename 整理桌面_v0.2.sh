#!/bin/bash
#桌面所有文件移动到今日目录


# 处理名称中包含空格的文件
function_safename(){
  path=$1
  echo "$path"
  for file in ${path}; do

      if [[ $file =~ "整理桌面.sh" ]]; then
        echo "整理桌面.sh 不处理"
        continue
      fi
      if [[ $file =~ "每日任务" ]]; then
        echo "每日任务 不处理"
        continue
      fi
      if [[ $file =~ "每日必看" ]]; then
        echo "每日必看 不处理"
        continue
      fi

      safename1="$(echo $file | sed 's/ /_-_/g')"


      if [ ! -d ${safename1} ];then
        mv "${file}" ${safename1}
        echo "convert  >>>> ${safename1}"
      #else
      #echo "不用修改"
      fi

  done
}

#恢复名称中的空格
function_original(){
  path=$1
  for file in ${path}; do
      original="$(echo $file | sed s'/_-_/ /g')"


      if [ ! -d ${original} ];then
        mv ${file} "${original}"
        echo "recover ---> ${original}"
      #else
      #echo "不用修改"
      fi

  done
}

#init
#进入桌面文件
cd ~/Desktop/
desktop=`pwd ~/Desktop`
workPath="$desktop""/*"

function_safename "$workPath"  #去除文件名中的空格

savepath="/Users/zhangdezhi/Desktop/每日任务/"
ls_date=`date +%Y%m%d`


targetPath="$savepath""$ls_date" #拼接字符串
# targetPath=${savepath}${ls_date}

#创建今日文件夹
if [ ! -d ${targetPath} ];then
 mkdir ${targetPath}
 echo "创建今日文件:${targetPath}"
else
echo "今日文件夹已经存在"
fi



#排除文件
 worker=`ls | grep -v 整理桌面.sh |grep -v ABC.png | grep -ve 每日任务 | grep -ve 每日必看`
 echo "$worker"
 if [ -z "$worker" ]; then
    echo "今日为处理文件为空"
  else
    mv $worker  $targetPath
    echo "今日未处理文件移动到今日文件:${targetPath}"
    workPath2="$savepath""$ls_date""/*"
    function_original "$workPath2"

    echo " 今天的剩余任务已经归档到了每日任务. "
fi






# echo "笔记本文件夹:$savepath"
# echo "书本文件夹  :$bookpath"


#其实仅仅一句话就可:  *_abc_*.* /abc
#echo "this is a test"
#ls
#ls -l
#echo "there are all files"
