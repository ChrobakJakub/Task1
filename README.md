# Hello World Container

This project contains a simple Docker container that prints `Hello World` when run.

It also supports replacing the word `World` with a custom value passed during `docker run`.

---

## Project structure

```text
.
├── Dockerfile
├── entrypoint.sh
└── README.md
```

---

## Dockerfile

```dockerfile
FROM alpine:3.19
WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
```

---

## entrypoint.sh

```sh
#!/bin/sh
echo "Hello ${1:-World}"
```

---

## Explanation of Dockerfile instructions

### `FROM alpine:3.19`
This instruction defines the base image for the container.  
I chose Alpine Linux because it is lightweight and fully sufficient for running a simple shell script.

### `WORKDIR /app`
This sets `/app` as the working directory inside the container.  
Using a dedicated working directory helps keep the container structure organized and easy to understand.

### `COPY entrypoint.sh /app/entrypoint.sh`
This copies the `entrypoint.sh` script from the local project directory into the container image.

### `RUN chmod +x /app/entrypoint.sh`
This makes the script executable so it can be started when the container runs.

### `ENTRYPOINT ["/app/entrypoint.sh"]`
This defines the executable that is launched when the container starts.  
Using `ENTRYPOINT` makes the container always run the same script, while still allowing extra arguments to be passed during `docker run`.

---

## How it works

The container starts and runs the following shell script:

```sh
echo "Hello ${1:-World}"
```

This means:

- if no argument is provided, the output is `Hello World`
- if an argument is provided, it replaces `World`

### Examples

- no argument → `Hello World`
- `Student` → `Hello Student`

---

## Environment

The solution was tested on:

- Windows 11 with Docker Desktop (Linux containers / WSL 2 backend)
- Linux with Docker Engine

It should also be reproducible on macOS with Docker Desktop, but it was not tested there.

---

## Build instructions

Open a terminal in the project directory and run:

```bash
docker build -t hello-container .
```

This command builds a Docker image from the current directory and assigns it the tag `hello-container`.

---

## Run instructions

### Default behavior

Run:

```bash
docker run --rm hello-container
```

Expected output:

```text
Hello World
```

### Bonus: custom word

Run:

```bash
docker run --rm hello-container Student
```

Expected output:

```text
Hello Student
```

---
