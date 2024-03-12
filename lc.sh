path="/Users/yixun/VisualStudioCodeProjects/algorithms"
src=$path/src
out=$path/out
cppFile=$src/$2/Solution.cpp
outFile=$out/$2/Solution.o
time=$(date "+%d-%m-%Y")

new(){
    if [ ! -d $src ]; then
        mkdir $src
    fi
    if [ ! -d $src/$1 ]; then
        mkdir $src/$1
    fi
    if [ ! -f $cppFile ]; then
        touch $cppFile
        cat << EOF > $cppFile
/*
 * Solution for Problem No.$1 from LeetCode
 * Author: Yixun Zhou
 * Date: $time
 */

#include <iostream>
#include <string>
#include <vector>

class Solution {
private:
public:
};

int main(int argc, char *argv[])
{
    Solution solution;
    return 0;
}

EOF
        echo New project $1 created!
    fi
    exit
}

build(){
    if [ ! -d $out ]; then
        mkdir $out
    fi
    if [ ! -d $out/$1 ]; then
        mkdir $out/$1
    fi
    g++ $cppFile -o $outFile
    exit
}

run(){
    $outFile
}

test(){
build $1;
run
}

while [ -n "$1" ]
    do
    case "$1" in
        -n) new $2
                shift ;;
        -b) build $2
                shift 
                echo Project $1 compiled! ;;
        -r) run
                shift ;;
        -t) test $2
                shift ;;
        *) echo "INVALID OPTION" ;;
    esac
    shift
done

