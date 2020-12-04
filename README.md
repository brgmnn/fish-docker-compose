# `docker-compose` completions for Fish

Fish shell completions for docker-compose, completing both subcommands for `docker-compose` as well as services for those subcommands.

These completions are compatible with docker-compose 1.6, including both new and old versions of the `docker-compose.yml` file.

## Installation

### With [Fisher][2]

```console
fisher install brgmnn/fish-docker-compose
```

### With [fundle][1]

Add

```console
fundle plugin 'brgmnn/fish-docker-compose'
```

to your `config.fish`, reload your shell and run `fundle install`.


### Manually

Put `completions/docker-compose.fish`in your `~/.config/fish/completions` directory.

## License

[MIT](LICENSE)

[1]: https://github.com/jorgebucaran/fisher
[2]: https://github.com/tuvistavie/fundle
