kmsetup() {
  cd ~/
  git clone https://github.com/eninedev/kobayashi-maru.git techtest
  cd techtest
  git submodule update --init
  python3.8 -m venv venv
  source venv/bin/activate
  pip install -r config/requirements.txt 
  python manage.py migrate
  python manage.py check
  echo ""
  echo "=== Test environment is configured and ready for use"
  echo ""
}

kmclean() {
  if [ "$(type -t deactivate)" = "function" ]; then
    echo "!!! Deactivating virtual environment"
    deactivate
  fi

  if [ -d $HOME/techtest ]; then
    echo "!!! Deleting techtest folder and contents"
    cd $HOME
    rm -i -rf techtest
  fi
}

