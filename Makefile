start_server:
	cd todoapp_server && docker compose up --build --detach && dart bin/main.dart --apply-migrations

stop_docker:
	docker compose down -v 

serverpod_generate:
	cd todoapp_server && serverpod generate

check_running_containers:
	docker ps

enter_a_docker_image_with_containerID:
	docker exec -it [containerID] bin/bash

entering_a_postgresdb:
	psql -d todoapp -U postgres


## This for updating or editing to the postgresql database
create_new_migration:
	cd todoapp_server && serverpod create-migration




