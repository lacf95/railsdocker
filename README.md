# Ruby on Rails docker compose bootstrap

Creates a Ruby on Rails application with configured Docker compose.

It comes with Postgresql and Redis services. Also, uses volumes for:
* Database persistence.
* File sharing between the host and container.
* Cached gems between builds.
* Script history `.bash_history`
* Script configuration `.bashrc`.

## Requirements.

* Install [Docker](https://docs.docker.com/engine/install/) version `	18.06.0+` or newer.
* Install [Docker compose](https://docs.docker.com/compose/install/).
* Enable Docker [Rootless mode](https://docs.docker.com/engine/security/rootless/).

**NOTE**: *Docker desktop for macOS installs Docker compose and doesn't require
Rootless mode.*

## Installation and usage.

1. Clone this repo:
```shell
git clone https://github.com/lacf95/railsdocker
```

2. Change to the repo's directory:
```shell
cd railsdocker
```

3. Run `new` to create a new Rails app:
```shell
./new ~/rails_app_name
```

4. Change to the created app directory:
```shell
cd ~/rails_app_name
```

5. Build your new app services:
```shell
bin/docker build
```

6. Run your app so you can configure the database, and install webpacker (optional):
```shell
bin/docker bash # Or bin/docker bash app
```

```shell
bin/rails db:prepare
```

```shell
bin/rails webpacker:install
```

```shell
exit
```

7. Finally, start all services:
```shell
bin/docker up
```

## Commands

### New command
The `new` command can receive one argument:

1. The path for the new project (required).

And two options:

1. `-r` to set the Ruby version.
1. `-s` to set the Rails version.
1. `-j` to set the Javascript approach.

## Project installed commands

### Build command
The `bin/docker build` command builds and pulls all Docker compose required images; it can receive one option `--no-cache` to build from zero.

### Up command
The `bin/docker up` starts all Docker compose services; it can receive one option `--daemon` to run in the background.

### Run command
The `bin/docker bash [service:-app]` connects to the running container, if not possible starts a new one.

### Run command
The `bin/docker attach [service:-app]` attach to the running container's STDIN, STDOUT, and STDERR, useful when prying on your server.

### Down command
The `bin/docker down` command stops and remove service containers.
