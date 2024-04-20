{
  description = "A template for Nix based C++ project setup.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/23.05";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs:
    inputs.utils.lib.eachSystem [
      "x86_64-linux"
      "aarch64-linux"
    ] (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [(import ./overlays)];
      };
    in {
      devShells.default = pkgs.mkShell {
        # Update the name to something that suites your project.
        name = "daniel c++ project";

        packages = with pkgs; [
          # Development Tools
          cmake
          cmakeCurses

          # Development time dependencies
          gtest

          # Build time and Run time dependencies
          spdlog
          abseil-cpp
        ];
      };

      packages.default = pkgs.callPackage ./default.nix {};
      formatter = pkgs.alejandra;
    });
}
