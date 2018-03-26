if [[ "$OSTYPE" == "linux-gnu" ]]; then
  /bin/bash ./linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  /bin/bash ./mac.sh
elif [[ "$OSTYPE" == "cygwin" ]]; then
  echo not tested.
elif [[ "$OSTYPE" == "msys" ]]; then
  echo not tested.
elif [[ "$OSTYPE" == "win32" ]]; then
  echo note tested.
else
  echo Unsupported OS
fi
