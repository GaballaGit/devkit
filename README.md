# devkit

This is my personal devkit. It consists of flakes I find myself commonly using.
I thought it would be a nice way to exercise Nix by combining them into a
centralized repository.

### Example:

Lets drop into a flake for basic backend dev in Go.

```
nix develop github:GaballaGit/devkit#go-api
```

### All Flakes

```nix
# Backend Go
go-api
go-api-psql
go-api-sqlite

# Node Development
node-wrangler
```
