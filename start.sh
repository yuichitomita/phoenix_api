cd `dirname $0`
pwd

if [ -e pid ]; then
  echo "すでに起動済みです"
  exit 1
fi

MIX_ENV=dev PORT=4000 elixir --detached -e "File.write! 'pid', :os.getpid" -S mix phoenix.server
