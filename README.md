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
bin/build
```

6. Run your app so you can configure the database, and install webpacker:
```shell
bin/run
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
bin/up
```

## Commands

### New command
The `new` command can receive one argument:

1. The path for the new project (required).

And two options:

1. `-r` to set the Ruby version.
1. `-s` to set the Rails version.

## Project installed commands

### Build command
The `bin/build` command builds and pulls all Docker compose required images.

### Up command
The `bin/up` starts all Docker compose services; it can receive one optional argument `d` or `daemon` to run in the background.

### Run command
The `bin/run` connects to the running container, if not possible starts a new one.

### Down command
The `bin/down` command stops and remove service containers.
