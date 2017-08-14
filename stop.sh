cd `dirname $0`
pwd

if [ ! -e pid ]; then
  echo "すでに停止済みです"
  exit 1
fi

PID=`cat pid`
/bin/kill -9 ${PID}
echo "kill pid: ${PID}"

rm pid
