postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=Qxj19960626 -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres12 dropdb -U postgres simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://postgres:Qxj19960626@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:Qxj19960626@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test
