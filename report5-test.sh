#!/bin/bash

ans="/tmp/$$-ans"
result="/tmp/$$-result"

ERROR_EXIT() {
	echo $1
	rm /tmp/$$-*
	exit 1
}

# テスト1異常動作の確認
# 変数が一つ
echo "ERROR: PLZ INPUT 2 ARGMENTS" > ${ans}
./report5.sh 1024 > ${result}
diff ${ans} ${result} || ERROR_EXIT "error in 1-1"

# 変数が自然数ではない
echo "ERROR: abc, PLZ INPUT A NUMBER" > ${ans}
./report5.sh abc 1024 > ${result}
diff ${ans} ${result} || ERROR_EXIT "error in 1-2a"
echo "ERROR: cde, PLZ INPUT A NUMBER" > ${ans}
./report5.sh 1024 cde >${result}
diff ${ans} ${result} || ERROR_EXIT "error in 1-2b"

# 変数が正の数ではない
echo "ERROR: -24 IS NOT A POSITIVE NUMBER" > ${ans}
./report5.sh 1024 -24 > ${result}
diff ${ans} ${result} || ERROR_EXIT "error in 1-2a"
echo "ERROR: -26 IS NOT A POSITIVE NUMBER" > ${ans}
./report5.sh -26 1024 > ${result}
diff ${ans} ${result} || ERROR_EXIT "error in 1-2b"

# テスト2正常動作の確認
echo "8" > ${ans}
./report5.sh 1024 24 > ${result}
diff ${ans} ${result} || ERROR_EXIT "error in 2-1a"
./report5.sh 24 1024 > ${result}
diff ${ans} ${result} || ERROR_EXIT "error in 2-1b"

# 後始末
rm /tmp/$$-*
