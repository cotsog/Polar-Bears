if [[ "$OSTYPE" == "linux-gnu" ]]; then
  /bin/bash /home/travis/build/global2alex/Polar-Bears/install/linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  /bin/bash /home/travis/build/global2alex/Polar-Bears/install/mac.sh
elif [[ "$OSTYPE" == "cygwin" ]]; then
  echo not tested.
elif [[ "$OSTYPE" == "msys" ]]; then
  echo not tested.
elif [[ "$OSTYPE" == "win32" ]]; then
  echo note tested.
else
  echo Unsupported OS
fi
