# envconf.sh

The script environment variable settings.

Version: 1.0.1



## Usage

Configuring environment variable GREETING.

```bash
source <path/to/envconf.sh>
read_config
create_config
get_param GREETING "Greeting message" "Hello"
flush_config
```



## TODO

To add the ability to reset config

Write automated tests



## Changes

### v1.0.1 (2016-11-29)

Fix bug.


### v1.0.0 (2016-11-29)

First release.