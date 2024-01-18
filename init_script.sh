#!/bin/bash

# Определение списка микросервисов
SERVICES=("Metall_Scraper" "Metall_Main_Bot" )

# Определение пути к папке проекта
PROJECT_DIR="apps"

if [ ! -d "$PROJECT_DIR" ]; then
        mkdir "$PROJECT_DIR"
fi

# Функция для инициализации и обновления репозиториев микросервисов
init_and_update_repositories() {
    local repository_name=$1
    local repository_url=$2

    echo "Инициализация и обновление репозитория: $repository_name"
    cd "$PROJECT_DIR"
    
    # Создание папки для микросервиса, если она не существует
    if [ ! -d "$repository_name" ]; then
        mkdir "$repository_name"
    fi
    
    cd "$repository_name"

    # Инициализация репозитория, если папка пустая
    if [ -z "$(ls -A)" ]; then
        git init
        git remote add origin "$repository_url"
        git fetch origin
        git checkout main
    fi

    git pull

    cd ..
}

# Инициализация и обновление каждого репозитория
for service in "${SERVICES[@]}"; do
    repository_url="git@github.com:YarikATM/$service.git"
    init_and_update_repositories "$service" "$repository_url"
done

cd ..

#Запуск docker-compose
#echo "Запуск docker-compose"
#docker-compose up -d
