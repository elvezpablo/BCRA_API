## Makefile ideas lifted from this pretty gist
## https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# https://www.otaqui.com/blog/1421/using-the-contents-of-a-file-as-a-variable-in-a-makefile/index.html
VERSION := $(shell cat app/version.txt)

app-clean: ## Cleans out the app folder 
	@echo "clear out app/ folder"
	rm -rf app/*

version: 	
	@echo $(VERSION)
	
copy-src: app-clean ## Copy the latest source to the app foler
	@echo "copy source files into app/ folder"
	cp ../../version.txt app/
	cp ../../run.sh app/
	cp -r ../../R app/
	cp -r ../../web app/

build: copy-src ## Builds a new image 
	@echo "build the image"
	docker build -t bcra:$(VERSION) .

bash: ## Runs bask so you can try out the image
	docker run -it bcra:$(VERSION) bash

run: ## Runs the plumber server on port 8000
	docker run -d --rm -p 8000:8000 --name plumber bcra:$(VERSION)

stop: ## Stops the image (not needed yet)
	docker container kill plumber
	
clean: 
	@echo "clean up the mess"
	docker container rm -f plumber