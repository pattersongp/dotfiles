
# For colorls to work
source $(dirname $(gem which colorls))/tab_complete.sh

# source the bashrc
source $HOME/.bashrc

# Why is this here?
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin"

# Golang environment variables
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="/Users/grahampatterson/google_drive/columbia_semesters/fall_2018/4113/4113/"
export PATH="$(go env GOPATH)/bin:$PATH"

# Modified to the above for 4113
# export GOPATH="$HOME/go"

# Enables conda command for the current user
source /anaconda3/etc/profile.d/conda.sh

cd $HOME
