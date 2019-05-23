{ system ? builtins.currentSystem
, optimizationLevel ? "ADVANCED"
, reflex-platform ? import (import ./nixdeps/reflex-platform) {}
}:

let 
  haskellLib        = pkgs.haskell.lib;
  inherit (reflex-platform) nixpkgs;
  inherit (nixpkgs) lib;

  pkgs = nixpkgs;

  monoReflexFun = (reflex-platform.project ({ pkgs, ... }: {
    packages = {
      frontend = ./landing;
    };

    shells = {
      ghcjs = ["frontend"];
    };

    overrides = self: super:
      let fast = p: haskellLib.dontHaddock (haskellLib.dontCheck p);
      in rec { frontend = fast super.frontend; };
  })).ghcjs.frontend;

  landingPage = monoReflexFun;

in {
  minified-landing  = landingPage;
}
