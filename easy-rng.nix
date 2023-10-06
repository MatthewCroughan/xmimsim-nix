{ lib
, stdenv
, fetchFromGitHub
, meson
, ninja
, gfortran
}:

stdenv.mkDerivation rec {
  pname = "easy-rng";
  version = "1.2";

  src = fetchFromGitHub {
    owner = "tschoonj";
    repo = "easyRNG";
    rev = "easyRNG-${version}";
    hash = "sha256-uECaa+oN84bDdO82H4h9chlBcoFOXWJl7hUr8u9loUs=";
  };

  nativeBuildInputs = [
    meson
    ninja
    gfortran
  ];

  meta = with lib; {
    description = "BSD licensed random number generators and distributions for C and Fortran";
    homepage = "https://github.com/tschoonj/easyRNG";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ];
    mainProgram = "easy-rng";
    platforms = platforms.all;
  };
}
