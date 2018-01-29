go() {
	export GOPATH=$HOME/go
	cdir=$PWD
	while [ "$cdir" != "/" ]; do
		if [ -e "$cdir/src" ]; then
			export GOPATH=$cdir
			break
		fi
	cdir=$(dirname "$cdir")
	done
	/usr/local/bin/go $@
}

cgws(){
	print "\033[34;1m▶\033[0m" creating project…
	wdir=~/gows/$1/src/github.com/$1
	mkdir -p $wdir && cd $wdir
	print "\033[34;1m▶\033[0m" installing dependency…
	go get github.com/golang/lint/golint
	print "\033[34;1m▶\033[0m" finished…
}
