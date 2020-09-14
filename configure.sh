#!/bin/env bash

set -e

sudo hostnamectl set-hostname weastur-srv

sudo sed -i '/deb-src/s/^# //' /etc/apt/sources.list
sudo apt update
sudo apt upgrade -y
sudo apt install -y atop iftop iotop htop smartmontools tcpdump gcc gcc-multilib g++ g++-multilib gdb clang cmake ccache cppcheck valgrind gdb python3 \
		python3-dev python3-setuptools python3-pip python3-wheel python3-venv python3-virtualenv openjdk-14-jdk openjdk-11-jdk openjdk-8-jdk \
		ant maven gradle virtualbox virtualbox-ext-pack libvirt-daemon-system qemu git git-lfs linux-headers-generic vagrant ruby tmux \
		silversearcher-ag tmux nload net-tools dnsutils strace virtualenvwrapper vim manpages man-db ubuntu-desktop libbz2-dev \
		build-essential libssl-dev zlib1g-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
		xz-utils tk-dev libffi-dev liblzma-dev python-openssl libtool automake tree fzf

sudo usermod -aG kvm weastur
sudo usermod -aG vboxusers weastur
sudo usermod -aG libvirt weastur

mkdir -p ~/src/{w,envs,golang}

cat <<'EOT' > ~/.bashrc_custom
export WORKON_HOME=$HOME/src/envs
export TERM=xterm-256color
export GOPATH=$HOME/src/golang
export VAGRANT_DEFAULT_PROVIDER=libvirt
export EDITOR=nano
export ANSIBLE_NOCOWS=1
export PATH=$PATH:$GOPATH/bin:$HOME/.local/bin
EOT

if ! grep -q '\.bashrc_custom' ~/.bashrc; then
	cat <<-EOT >> ~/.bashrc

	if [ -f ~/.bashrc_custom ]; then
		. ~/.bashrc_custom
	fi
	EOT
fi

TMUX_PLUGINS_DIR=~/.tmux/plugins/tpm
[ ! -d "${TMUX_PLUGINS_DIR}" ] && git clone https://github.com/tmux-plugins/tpm "${TMUX_PLUGINS_DIR}"

[ ! -d ~/.pyenv ] && curl https://pyenv.run | bash

[ ! -d ~/.nvm ] && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

[ ! -d ~/.rvm ] && curl -sSL https://get.rvm.io | bash -s stable
