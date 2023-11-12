up:
	docker-compose up -d
init:
	docker-compose up -d --build
	docker-compose exec node npm install

node:
	docker-compose exec node bash

# srcフォルダ内に存在するTypeScriptのファイルを指定して実行する
# ※これ使わずに普通にnpx ts-nodeから呼んでも良い
execute:
	@echo "app/srcディレクトリ内のtsファイル一覧:"
	@file_list=$$(find app/src -maxdepth 1 -name "*.ts" -exec basename {} \; | sort); \
	if [ -z "$$file_list" ]; then \
		echo "TypeScriptで書かれたファイルが見つかりませんでした"; \
		exit 1; \
	fi; \
	echo "$$file_list" | nl -w2 -s". "
	@echo "実行するプログラムの番号を入力してください:"
	@read -r file_number; \
	file_count=$$(find app/src -maxdepth 1 -name "*.ts" | wc -l); \
	if [ -z "$$file_number" ] || ! [ "$$file_number" -eq "$$file_number" ] 2>/dev/null || [ "$$file_number" -lt 1 ] || [ "$$file_number" -gt $$file_count ]; then \
		echo "無効な番号の選択が行われました"; \
		exit 1; \
	fi; \
	selected_file=$$(find app/src -maxdepth 1 -name "*.ts" | sort | sed -n "$$file_number p"); \
	docker-compose exec node npx ts-node "/$$selected_file"
# tscを使用してTypeScriptのコードをコンパイルする
build:
	docker-compose exec node bash -c 'rm -f /app/dist/*.js && npx tsc -d'
# Parcelを使用してTypeScriptのコードをバンドルする
bundle:
	docker-compose exec node bash -c 'rm -f /app/bundle/*.js* && npx parcel build *.ts --dist-dir=/app/bundle --no-cache'

down:
	docker-compose down
down-all:
	docker-compose down --rmi all --volumes --remove-orphans