SHELL := /bin/bash
.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/\1##\3/p' \
	| column -t -s '##'


install: ## Install and update python dependencies
	@poetry install --with test,dev

lint: ## Check code with ruff linter
	@ruff . --fix

format: ## Format code with black
	@black .