

# Update docker, based on OS.
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
  echo Unsupported OS.
  exit 1
fi

# Added support for python 2 and 3.
if [ "$TOXENV" = "py27" ]; then
  pip install -r /home/travis/build/global2alex/Polar-Bears/install/requirements-27.txt
elif [ "$TOXENV" = "py36" ]; then
  pip3 install -r /home/travis/build/global2alex/Polar-Bears/install/requirements-36.txt
else
  echo Unsupported or missing TOXENV environment variable.
  exit 1
fi
