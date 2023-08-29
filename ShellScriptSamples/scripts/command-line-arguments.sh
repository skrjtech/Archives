#!/bin/bash

# 定数
## 重複オプション確認用
D_ARGS=0 # 
D_LIST=0 # 
## 二重ループ脱出用
WHILEFLAG=0
## List配列格納用
LISTOPTION_ARRAY=()

function UsageHelps () {
cat << EOS >&2
Usage: $0 [-a, --args, --args=VALUE] [-l, --list, --list=[VALUE, ...]]
    ...
Options:
    -a, --args
    -h, --help
EOS
}

function ListProcessing () {
    ARRAY=()
    while true; do
        case $1 in
            [)  ;;
            ,)  ;;
            ])  break ;;
            *]) 
                ARRAY+=($(echo $1 | sed -r "s/(\[|\])//g")) 
                break 
                ;; 
            ,,) 
                WHILEFLAG=-1 
                break
                ;;
            *) ARRAY+=($(echo $1 | sed -r "s/(\[|\])//g"))
                ;;
        esac
        shift
    done
    ARRAY=$(echo ${ARRAY[@]} | sed -e "s/ ,/,/g" -e "s/, /,/g" -e "s/ , /,/g")
    echo $ARRAY
}

# 引数の個数確認 なかったらヘルプを表示
if (($# < 1)); then
    UsageHelps
fi
# 引数が1以上があればオプションの解析
while (( $# > 0))
do 
    if [[ $WHILEFLAG -eq -1 ]]; then
        break
    fi
    case $1 in 
        -a | --args | --args=*)
            
            # 複数の引数を指定した場合
            if [ $D_ARGS -gt 0 ]; then
                echo "[-a,--args]の引数が複数指定されています."
                break
            fi

            # 引数が[--option=value]の場合
            if [[ "$1" =~ ^--args= ]]; then
                ARGRESULT=$(echo $1 | sed -e 's/^--args=//')
            # 引数が[-o value | --option value]の場合
            else
                shift
                ARGRESULT=$1
            fi

            # 指定オプションの表示
            echo "ARGS RESULT: " $ARGRESULT
            D_ARGS=1
            ;;

        -l | --list | --list=*)
            # 複数の引数を指定した場合
            if [ $D_LIST -gt 0 ]; then
                echo "[-a,--args]の引数が複数指定されています."
                break
            fi
            # 引数が[--option=[Values,...]]の場合
            if [[ "$1" =~ ^--list= ]]; then
                echo "--option=[val, ...]"
                LISTRESULT=$(echo $1 | sed -e 's/^--list=//')
                if [[ $LISTRESULT =~ "[" ]] && [[ $LISTRESULT =~ "]" ]]; then
                    LISTRESULT=$(echo $LISTRESULT | sed -r "s/(\[|\])//g")
                    shift
                # ERROR por que
                elif [[ -n $(echo $LISTRESULT | grep -E "[0-9a-zA-Z\,\]") ]]; then
                    echo "--option val 2"
                    LISTRESULT=$(ListProcessing $LISTRESULT | sed -e 's/^--list=//')
                    while true; do
                        if [[ ${@:$#:1} == $1 ]]; then
                            break
                        fi
                        case $1 in
                            -*) break ;;
                        esac
                        shift
                    done
                fi
            # 引数が[-o [value, ...] | --option [value, ...]の場合
            else
                shift
                echo "--option val"
                if [[ $1 =~ "[" ]] && [[ $1 =~ "]" ]]; then
                    LISTRESULT=$(echo $1 | sed -r "s/(\[|\])//g")
                    shift
                elif [[ -n $(echo $1 | grep -E "[0-9a-zA-Z\,\]") ]]; then
                    LISTRESULT=$(ListProcessing $@)
                    while true; do
                        if [[ ${@:$#:1} == $1 ]]; then
                            break
                        fi
                        case $1 in
                            -*) break ;;
                        esac
                        shift
                    done
                fi
            fi

            # 指定オプションの表示
            echo "LIST RESULT: " $LISTRESULT
            D_ARGS=1
            ;;
        -h | --help)
            UsageHelps
            ;;
        *)
            echo "[ ${1} ] 不明な引数"
            ;;
    esac
    shift
done

