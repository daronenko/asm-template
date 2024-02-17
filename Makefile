DOCKER_COMPOSE ?= docker compose

main.o: main.asm
	nasm -f elf64 main.asm -o main.o

.PHONY: build
build: main.o
	echo hello
	ld main.o -o exec

.PHONY: docker-build-base
docker-build-debug:
	$(DOCKER_COMPOSE) -f docker/docker-compose.yml build

.PHONY: --in-docker-start
--in-docker-start: build
	./exec

.PHONY: docker-start
docker-start:
	$(DOCKER_COMPOSE) -f docker/docker-compose.yml run --rm asm-template-container make -- --in-docker-start

.PHONY: --in-docker-debug
--in-docker-debug: build
	gdb ./exec

.PHONY: docker-debug
docker-debug:
	$(DOCKER_COMPOSE) -f docker/docker-compose.yml run --rm asm-template-container make -- --in-docker-debug

.PHONY: docker-clean
docker-clear:
	$(DOCKER_COMPOSE) -f docker/docker-compose.yml down -v

.PHONY: clean
clean:
	rm -rf exec main.o
