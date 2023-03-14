{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/release-22.11;

  outputs = { self, nixpkgs }: 
    let 
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        name = "exqlite";
        buildInputs = [ pkgs.erlang ];
      };
    };
}
