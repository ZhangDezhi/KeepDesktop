#!/bin/bash

savepath='/ZNote/'
bookpath='/ZBook/'

mv ~/Desktop/*ZNote_*.*  $savepath
mv ~/Desktop/*ZBook_*.*  $bookpath
echo "文件已经被移动到了:"
echo "笔记本文件夹:$savepath"
echo "书本文件夹  :$bookpath"

#其实仅仅一句话就可:  *_abc_*.* /abc
#echo "this is a test"
#ls
#ls -l
#echo "there are all files"
