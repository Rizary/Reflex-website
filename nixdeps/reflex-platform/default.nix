let
  pkgs = import <nixpkgs> {};
in
  pkgs.fetchFromGitHub {
    owner = "reflex-frp";
    repo = "reflex-platform";
    rev = "beaa34d244176fc2ff8f70642812141eaf3e559b";
    sha256 = "1sfibav817qpvw8j4fm1jx4m2dvb3a5ra8j2ff6hc8w18i9j0ig4";
  }
