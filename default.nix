{ system ? builtins.currentSystem
, optimizationLevel ? "ADVANCED"
, reflex-platform ? import (import ./nixdeps/reflex-platform) {}
}:


 reflex-platform.project ({ pkgs, ... }: {
   packages = {
     frontend = ./landing;
   };
   shells = {
     ghcjs = ["frontend"];
   };
   overrides = self: super:
     let fast = p: pkgs.haskell.lib.dontHaddock (pkgs.haskell.lib.dontCheck p);
     in rec { frontend = fast super.frontend; };
 })
