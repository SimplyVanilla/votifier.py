SHELL := bash
TERRAFORM_VERSION := 1.5.7


# Github shim
ifdef RUNNER_OS
	TRAVIS_OS_NAME := $(shell echo -n '$(RUNNER_OS)' | tr '[:upper:]' '[:lower:]')
endif
ifdef RUNNER_ARCH
ifeq ($(RUNNER_ARCH),X64)
	TRAVIS_CPU_ARCH := amd64
else
	TRAVIS_CPU_ARCH := arm64
endif
endif
ifdef PYTHON_VERSION
	TRAVIS_PYTHON_VERSION := $(PYTHON_VERSION)
endif


.PHONY: all
all:


.PHONY: dev
dev:
	pip install . --no-cache-dir


.PHONY: build
build:
	$(info )
	$(info 🛠️ building...)
	pip install -r requirements.txt
	python -m build


.PHONY: lint
lint:
	$(info )
	$(info ✨ linting...)
	flake8 votifier/


.PHONY: test
test: lint
	$(info )
	$(info 🧪 testing...)
ifeq ($(TRAVIS_PYTHON_VERSION),3.12)
	coverage run --source=votifier -m unittest discover
	coveralls
else
	coverage run --source=votifier -m unittest discover
	coverage report --skip-covered --show-missing
endif

.PHONY: publish
publish:
	python -m twine upload dist/*
