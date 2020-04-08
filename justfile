update:
	[[ -d fuchsia ]] || git clone https://fuchsia.googlesource.com/fuchsia
	cd fuchsia && git pull origin master
	rsync \
		-recursive \
		--progress \
		--delete \
		--exclude fuchsia \
		--exclude .git \
		--exclude .gitignore \
		--exclude justfile \
		fuchsia/garnet/public/lib/fidl/tools/vim/ .
	git add .
	git commit -m "Updating from `cd fuchsia && git log -n1 --format=format:'%H'`"
