#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <start|stop>"
  exit 1
fi

# ANSI color codes
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

print_purple() {
  echo -e "${PURPLE}$1${NC}"
}

print_green() {
  echo -e "${GREEN}$1${NC}"
}

AUTH_IMAGE_NAME="auth-app:latest"
BUSINESS_IMAGE_NAME="business-app:latest"
IO_IMAGE_NAME="io-app:latest"

if [ "$1" == "start" ]; then

  # create_networks

  print_purple "Starting containers..."

  print_purple "building the auth image..."
  
  cd ../auth-server/
  
  docker build -t "$AUTH_IMAGE_NAME" .

  cd ..

  cd business-service/

  print_purple "building the business image..."

  docker build -t "$BUSINESS_IMAGE_NAME" .

  cd ..

  cd io-service/

  print_purple "building the io image..."

  docker build -t "$IO_IMAGE_NAME" .

  cd ../infra

  docker compose up -d --build

  print_green "Containers started successfully."
elif [ "$1" == "stop" ]; then

  print_purple "Starting to stop containers and delete app images..."

  docker compose down


  if docker image inspect "$AUTH_IMAGE_NAME" > /dev/null 2>&1; then
        docker rmi "$AUTH_IMAGE_NAME"
  fi

  if docker image inspect "$BUSINESS_IMAGE_NAME" > /dev/null 2>&1; then
        docker rmi "$BUSINESS_IMAGE_NAME"
  fi

  if docker image inspect "$IO_IMAGE_NAME" > /dev/null 2>&1; then
        docker rmi "$IO_IMAGE_NAME"
  fi
  print_green "Containers stopped successfully and images deleted."

else
  echo "Invalid argument. Use 'start' or 'stop'."
  exit 1
fi
