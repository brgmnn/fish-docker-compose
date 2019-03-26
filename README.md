# docker-compose completions for Fish

Fish shell completions for docker-compose, completing both subcommands for
`docker-compose` as well as services for those subcommands.

These completions are compatible with docker-compose 1.6, including both new
and old versions of the `docker-compose.yml` file.


## Installation

There are several ways you can install these shell completions.

### Using [fundle][1]

Add

```
fundle plugin 'brgmnn/fish-docker-compose'
```

to your `config.fish`, reload your shell and run `fundle install`.

### Using [fisherman][2]

Just run:

```
fisher add brgmnn/fish-docker-compose
```

### Manually

Put `completions/docker-compose.fish` your `~/.config/fish/completions`
directory.


## License

MIT

[1]: https://github.com/tuvistavie/fundle
[2]: https://github.com/fisherman/fisherman
[3]: https://github.com/brgmnn/fish-hyper
[4]: https://hyper.sh
