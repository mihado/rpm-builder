default: build

build:
	docker build . --rm -t mihado/rpm-builder
	docker push mihado/rpm-builder

run: build
	docker run --rm -it -v ${PWD}/rpmbuild:/home/builder/rpmbuild mihado/rpm-builder
