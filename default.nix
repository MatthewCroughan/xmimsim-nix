{ lib
, stdenv
, fetchFromGitHub
, autoreconfHook
, pkg-config
, glib
, libxml2
, libxslt
, raylib
, gtkmm3
, json-glib
, mpi
, gobject-introspection
, hdf5
, gfortran11
, python3
, callPackage
}:

stdenv.mkDerivation rec {
  pname = "xmimsim";
  version = "8.1";

  buildInputs = [
    gobject-introspection
    glib
    libxml2
    libxslt
    raylib
    gtkmm3
    json-glib
    mpi
    hdf5
    (callPackage ./xraylib.nix {})
    (callPackage ./easy-rng.nix {})
  ];

  nativeBuildInputs = [ autoreconfHook pkg-config gfortran11 python3 ];

  src = fetchFromGitHub {
    owner = "tschoonj";
    repo = "xmimsim";
    rev = "XMI-MSIM-${version}";
    hash = "sha256-jLg7llmb5yvhamj1s0WvhyrrzolOegPD/HBWFUxTg5M=";
  };

  meta = with lib; {
    description = "Monte Carlo simulation of energy-dispersive X-ray fluorescence spectrometers";
    homepage = "https://github.com/tschoonj/xmimsim";
    changelog = "https://github.com/tschoonj/xmimsim/blob/${src.rev}/Changelog";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ ];
    mainProgram = "xmimsim";
    platforms = platforms.all;
  };
}
