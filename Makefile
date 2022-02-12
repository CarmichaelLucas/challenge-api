# Arquivo de Configuração do Projeto facilitando o uso da aplicação

## make permit
permit:
	@sudo chown -R ${USER}:${USER} .

## make build
build: clean
	@docker-compose build

## make up
up: build
	@docker-compose up -d

## make sh
sh:
	@docker container exec -it challenge_api sh

## make migrate
mgt:
	@docker-compose run api bin/rails db:drop db:create db:migrate

## make remove
rm: down
	@docker image rmi challenge_api

## make down
down:
	@docker-compose down
	@docker container prune -f
	@docker volume prune -f

## make clean
clean:
	@sudo rm -rf tmp/*
	@mkdir -p tmp/pids && touch tmp/pids/.keep