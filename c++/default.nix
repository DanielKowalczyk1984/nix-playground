{
  pkgs,
  lib,
}:
pkgs.gcc9Stdenv.mkDerivation {
  pname = "cpp-examples";
  version = "0.1.0";

  src = ./.;

  nativeBuildInputs = with pkgs; [cmake];
  buildInputs = with pkgs; [spdlog abseil-cpp];

  cmakeFlags = [
    "-DENABLE_TESTING=ON"
    "-DENABLE_INSTALL=ON"
  ];

  meta = with lib; {
    homepage = "https://github.com/nixvital/nix-based-cpp-starterkit";
    description = ''
      A template for Nix based C++ project setup.";
    '';
    licencse = licenses.mit;
    platforms = with platforms; linux ++ darwin;
    maintainers = [maintainers.breakds];
  };
}
