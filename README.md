# docker-compose completions for Fish

Fish shell completions for docker-compose.
Here is a collection of

## Installation

Two ways you can install this, either using the [fundle][1] package manager or
manually. I recommend using fundle so you can keep updated.

### Using [fundle][1] (recommended)

Add

```
fundle plugin 'brgmnn/fish-docker-compose'
```

to your `config.fish`, reload your shell and run `fundle install`.

### Manually

Put `completions/docker-compose.fish` your `~/.config/fish/completions`
directory, and source `init.fish` on startup.

[1]: https://github.com/tuvistavie/fundle
