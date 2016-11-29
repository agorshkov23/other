# envconf.sh

The script environment variable settings.

Version: 1.0.1



## Getting

Clone the repository:

```bash
git clone https://github.com/agorshkov23/other.git && cd other/envconf/
```

Using `wget`:

```bash
wget https://raw.githubusercontent.com/agorshkov23/other/master/envconf/envconf.sh
```



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