{ lib
, stdenv
, fetchFromGitHub
, meson
, ninja
, python3
, swig
, gfortran
}:

stdenv.mkDerivation rec {
  pname = "xraylib";
  version = "4.1.3";

  src = fetchFromGitHub {
    owner = "tschoonj";
    repo = "xraylib";
    rev = "xraylib-${version}";
    hash = "sha256-40Payu5DcFOYdmcGA9rAFrZmuP8UmrqJ9b4ZytS5Gcs=";
  };

  postPatch = "patchShebangs fortran/install_fortran_mod.py";

  nativeBuildInputs = [
    meson
    ninja
    (python3.withPackages (p: with p; [ numpy ]))
    swig
    gfortran
  ];

  meta = with lib; {
    description = "A library for X-ray matter interaction cross sections for X-ray fluorescence applications";
    homepage = "https://github.com/tschoonj/xraylib.git";
    changelog = "https://github.com/tschoonj/xraylib/blob/${src.rev}/Changelog";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ];
    mainProgram = "xraylib";
    platforms = platforms.all;
  };
}
