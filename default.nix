with (import <nixpkgs> {}).pkgs;
let pkg = haskellngPackages.callPackage
({ mkDerivation, cabal-install, base, bytestring, cereal, containers
, data-binary-ieee754, deepseq, hex, HUnit, mtl, QuickCheck, stdenv
, tagged, tasty, tasty-hunit, tasty-quickcheck, text
, unordered-containers
}: mkDerivation {
   pname = "protobuf";
   version = "0.2.0.4";
   src = ./.;
   isLibrary = true;
   isExecutable = false;
   buildDepends = [
      base bytestring cereal data-binary-ieee754 deepseq mtl text unordered-containers
   ];
   testDepends = [
     base bytestring cereal containers hex HUnit mtl QuickCheck tagged
     tasty tasty-hunit tasty-quickcheck text unordered-containers
   ];
   buildTools = [ cabal-install ];
   license = stdenv.lib.licenses.bsd3;
   }) {};
in
pkg.env
