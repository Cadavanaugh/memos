.PHONY: build_backend backend frontend

build_backend:
	sh scripts/build.sh

backend: build_backend
	./build/memos --mode dev

frontend:
	cd web && pnpm i && pnpm dev

update:
	git switch main && git pull upstream main && git switch my-custom-version && git merge main -m "BUILD: pull updates from oficial repository" && cd web && pnpm release && cd .. && docker build -t memos:custom -f scripts/Dockerfile .