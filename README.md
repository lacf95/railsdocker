# Ruby on Rails docker compose bootstrap

## Requirements.

* Install [Docker](https://docs.docker.com/engine/install/) version `	18.06.0+` or newer.
* Install [Docker compose](https://docs.docker.com/compose/install/).
* Enable Docker [Rootless mode](https://docs.docker.com/engine/security/rootless/).

## Installation and usage.

1. Clone this repo:
```shell
git clone repo
```

2. Change to the repo's directory:
```shell
cd repo
```

3. Run `new` to create a new Rails app:
```shell
./new ~/rails_app_name
```

## Additional configuration

The `new` command can receive three positional arguments:

1. The path for the new project (required)
2. The ruby version in the form of `2.7.2` (major, minor, patches without labels).
3. The rails version in the form of `6.1.4` (major, minor, patches without labels).
