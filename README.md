# Hello World Container

This project contains a simple Docker container that prints `Hello World` when run.

It also supports replacing the word `World` with a custom value passed during `docker run`.

## Environment

The solution was tested on:
- Windows 11 with Docker Desktop
- Linux with Docker Engine

## Build instructions

Run the following command in the project directory:

docker build -t hello-container .
docker run --rm hello-container

Expected output: Hello World

Bonus: custom word:
docker run --rm hello-container Student

Expected output:
Hello Student
