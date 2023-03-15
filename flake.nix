{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/release-22.11;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: 
    let 
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      lib.default = import ./default.nix;
      packages.default = pkgs.beam.packages.erlangR25.callPackage ./default.nix {};
      devShells.default = pkgs.mkShell {
        name = "exqlite";
        buildInputs = with pkgs; [ 
          erlang 
          mix2nix
        ];
      };
    });
}
