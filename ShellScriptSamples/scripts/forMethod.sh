#!/bin/bash

array=(111 "foo" 222 "bar" 333 "foobar")
echo ${array[@]} # 全表示
echo $array # 先頭表示

# 一行づつ表示
for ver in ${array[@]}
do
    echo $ver
done