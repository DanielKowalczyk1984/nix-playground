final: prev: {
  mkShell = prev.mkShell.override {
    stdenv = prev.gcc9Stdenv;
  };

  spdlog = prev.spdlog.override {
    stdenv = prev.gcc9Stdenv;
    staticBuild = true;
  };

  abseil-cpp = prev.abseil-cpp.override {
    stdenv = prev.gcc9Stdenv;
    static = true;
  };

  gtest = prev.gtest.override {
    stdenv = prev.gcc9Stdenv;
  };

  fmt = prev.fmt.override {
    stdenv = prev.gcc9Stdenv;
  };
}
