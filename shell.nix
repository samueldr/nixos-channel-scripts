{ pkgs ? import <nixpkgs> {} }:

let
  nixos-channel-scripts = import ./. { pkgs = pkgs; };
in
pkgs.mkShell {
  name = nixos-channel-scripts.name + "-env";
  buildInputs = [
    nixos-channel-scripts
  ]
    ++ nixos-channel-scripts.buildInputs
  ;
}
