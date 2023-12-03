#!/bin/zsh

# environment variable
## ++++++++++++++++++++ START ++++++++++++++++++++
export PATH=$PATH:/usr/local/go/bin
## ++++++++++++++++++++ END ++++++++++++++++++++

# aliases
## ++++++++++++++++++++ START ++++++++++++++++++++
alias py='python3'
## ++++++++++++++++++++ END ++++++++++++++++++++

# For system update
## ++++++++++++++++++++ STRAT ++++++++++++++++++++
function sysup() {
	sudo apt update && sudo apt upgrade -y
}
## ++++++++++++++++++++ END ++++++++++++++++++++

# python virtual environment wrapper func
# 個人的にpythonプログラマーにとってはありがたい機能だと思っている
# カレントディレクトリにvenvディレクトリが存在しない場合、venvという名前でpython-venvを実行する関数
## ++++++++++++++++++++ STRAT ++++++++++++++++++++
function activateVirtualEnvironment() {
	# If not exist specified filename of `venv`.
	# This is
	local file_to_check="./venv"

	if [ ! -e "$file_to_check" ]; then
		# If file not exist, create other one
		echo "file not exist"
		python3 -m venv venv
		echo "Created venv file"
	fi
	echo "Activating Virtual Environment of Python venv"
	source ./venv/bin/activate
	echo "Success, All handling done..."
}

# venv起動ラッパーコード
function va() {
	activateVirtualEnvironment
}

# venv終了ラッパーコード
function da() {
	deactivate
}
## ++++++++++++++++++++ END ++++++++++++++++++++

# pdfをWSL2のコマンドラインから開くためのラッパー関数
function pdf() {
	explorer.exe "$1"
}

# environmental variable proxy setting
function env-set-proxy() {
	export http_proxy=http://wwwproxy.kanazawa-it.ac.jp:8080
	export https_proxy=http://wwwproxy.kanazawa-it.ac.jp:8080
}

function env-unset-proxy() {
	unset http_proxy
	unset https_proxy
}

# git proxy setting
function git-set-proxy() {
	env-set-proxy
	git config --global http.proxy $http_proxy
}

function git-unset-proxy() {
	env-unset-proxy
	git config --global --unset http.proxy
}

# pip proxy setting
function pip-set-proxy() {
	env-set-proxy
	pip config set global.proxy $http_proxy
}

function pip-unset-proxy() {
	env-unset-proxy
	pip config unset global.proxy
}

# npm proxy setting
function npm-set-proxy() {
	env-set-proxy
	npm config set proxy $http_proxy
	npm config set https-proxy $https_proxy
}

function npm-unset-proxy() {
	env-unset-proxy
	npm config rm proxy
	npm config rm https-proxy
}



# apt proxy setting
function apt-set-proxy() {
	env-set-proxy
	echo "Acquire::http::Proxy \"$http_proxy\";" | sudo tee -a /etc/apt/apt.conf
	echo "Acquire::https::Proxy \"$http_proxy\";" | sudo tee -a /etc/apt/apt.conf
}
function apt-unset-proxy() {
	env-unset-proxy
	echo -n | sudo tee /etc/apt/apt.conf
}

# all in one
function set-proxy() {
	env-set-proxy
	git-set-proxy
	pip-set-proxy
	npm-set-proxy
	apt-set-proxy
}

function unset-proxy() {
	env-unset-proxy
	git-unset-proxy
	pip-unset-proxy
	npm-unset-proxy
	apt-unset-proxy
}
