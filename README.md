## Building

    $ nix-build

## Running

    $ ./result/bin/mirror-nixos-branch nixos-19.03-small https://hydra.nixos.org/job/nixos/release-19.03-small/tested/latest-finished

    $ ./result/bin/mirror-nixos-branch nixos-unstable-small https://hydra.nixos.org/job/nixos/unstable-small/tested/latest-finished

    $ ./result/bin/generate-programs-index /data/releases/nixos-files.sqlite ./programs.sqlite http://nix-cache.s3.amazonaws.com/ /data/releases/nixos/unstable-small/nixos-16.09pre89017.9db1990-tmp/store-paths /data/releases/nixos/unstable-small/nixos-16.09pre89017.9db1990-tmp/unpack/nixos-16.09pre89017.9db1990/nixpkgs

## Development use

### Mirror script

The mirror script relies on S3 being configured. For some development uses this
is not necessary. The `WITHOUT_S3` environment variable can be set to skip S3.

Additionally, it may write a bunch to `$TMPDIR`, which defaults to a small
location for end-user use.

    $ nix-shell
    $ TMPDIR="$PWD/tmp" WITHOUT_S3=true ./mirror-nixos-branch.pl nixos-unstable-small https://hydra.nixos.org/job/nixos/unstable-small/tested/latest-finished
