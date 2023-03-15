{ beamPackages, sqlite }: 
let 
  mix_lock = beamPackages.callPackage ./mix_deps.nix { };
in beamPackages.buildMix {
  name = "exqlite";
  version = "0.13.6";

  beamDeps = with mix_lock; [
      db_connection
      ex_sqlean
      elixir_make
      cc_precompiler
      ex_doc
      temp
      credo
      dialyxir
      table
  ];

  src = ./.;

  buildInputs = [
    sqlite.dev
  ];

  EXQLITE_USE_SYSTEM = "1";
}
