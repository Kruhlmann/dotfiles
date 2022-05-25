INSTALL_D_FILES=$(wildcard install.d/*.sh)

lint:
	docker run --rm -v $$(pwd):/mnt koalaman/shellcheck:stable install $(INSTALL_D_FILES)

.PHONY: lint
