{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    bunt = buildMix rec {
      name = "bunt";
      version = "0.2.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "19bp6xh052ql3ha0v3r8999cvja5d2p6cph02mxphfaj4jsbyc53";
      };

      beamDeps = [];
    };

    cc_precompiler = buildMix rec {
      name = "cc_precompiler";
      version = "0.1.5";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0mqzmf6f32610ifj0m7g6jjkk4ahzygmf8nklcqq4y83xdb2wnzf";
      };

      beamDeps = [ elixir_make ];
    };

    connection = buildMix rec {
      name = "connection";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1746n8ba11amp1xhwzp38yfii2h051za8ndxlwdykyqqljq1wb3j";
      };

      beamDeps = [];
    };

    credo = buildMix rec {
      name = "credo";
      version = "1.6.7";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1lvxzksdrc2lbl0rzrww4q5rmayf37q0phcpz2kyvxq7n2zi1qa1";
      };

      beamDeps = [ bunt file_system jason ];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.4.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0s1nx1gi96r8g7x8y7cklz8z823a6llh4fk996i5xxcr3flkrrag";
      };

      beamDeps = [ connection telemetry ];
    };

    dialyxir = buildMix rec {
      name = "dialyxir";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "16hbdhkbqq69v452vx3c0d26mmadkmwr6nvdpr72c5azqi4qxsh7";
      };

      beamDeps = [ erlex ];
    };

    earmark_parser = buildMix rec {
      name = "earmark_parser";
      version = "1.4.29";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "00rmqvf3hkxfvkijqd624n0hn1xqims8h211xmm02fdi7qdsy0j9";
      };

      beamDeps = [];
    };

    elixir_make = buildMix rec {
      name = "elixir_make";
      version = "0.7.5";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "11r8maaqnpp2an0i8s7b7vla4gs7b7g43kcyv203iyljbj6kxmn3";
      };

      beamDeps = [];
    };

    erlex = buildMix rec {
      name = "erlex";
      version = "0.2.6";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0x8c1j62y748ldvlh46sxzv5514rpzm809vxn594vd7y25by5lif";
      };

      beamDeps = [];
    };

    ex_doc = buildMix rec {
      name = "ex_doc";
      version = "0.29.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1caxmx8zdhjbkm625l607xmljbbrqxhk68kqs8spsryapfwav5ph";
      };

      beamDeps = [ earmark_parser makeup_elixir makeup_erlang ];
    };

    ex_sqlean = buildMix rec {
      name = "ex_sqlean";
      version = "0.8.8";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1yj665bc87kxqcaich4qhdvw217ihvgyqvc8jw2qhdp7grw48dny";
      };

      beamDeps = [];
    };

    file_system = buildMix rec {
      name = "file_system";
      version = "0.2.10";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1p0myxmnjjds8bbg69dd6fvhk8q3n7lb78zd4qvmjajnzgdmw6a1";
      };

      beamDeps = [];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.4.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0891p2yrg3ri04p302cxfww3fi16pvvw1kh4r91zg85jhl87k8vr";
      };

      beamDeps = [];
    };

    makeup = buildMix rec {
      name = "makeup";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "19jpprryixi452jwhws3bbks6ki3wni9kgzah3srg22a3x8fsi8a";
      };

      beamDeps = [ nimble_parsec ];
    };

    makeup_elixir = buildMix rec {
      name = "makeup_elixir";
      version = "0.16.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1rrqydcq2bshs577z7jbgdnrlg7cpnzc8n48kap4c2ln2gfcpci8";
      };

      beamDeps = [ makeup nimble_parsec ];
    };

    makeup_erlang = buildMix rec {
      name = "makeup_erlang";
      version = "0.1.1";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1fvw0zr7vqd94vlj62xbqh0yrih1f7wwnmlj62rz0klax44hhk8p";
      };

      beamDeps = [ makeup ];
    };

    nimble_parsec = buildMix rec {
      name = "nimble_parsec";
      version = "1.2.3";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "1c3hnppmjkwnqrc9vvm72kpliav0mqyyk4cjp7vsqccikgiqkmy8";
      };

      beamDeps = [];
    };

    table = buildMix rec {
      name = "table";
      version = "0.1.2";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0aah0rkq6ikl1w359n65rmhk0p0npwj0fr35grf321pqzrzbr6by";
      };

      beamDeps = [];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.1.0";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "0j6zq3y7xz768djz25x55gampyhd9nv6ax9dzx67f52nyyhv49xp";
      };

      beamDeps = [];
    };

    temp = buildMix rec {
      name = "temp";
      version = "0.4.7";

      src = fetchHex {
        pkg = "${name}";
        version = "${version}";
        sha256 = "039ys0yccxnydgq8c9c8j0diwamfs5s1a0p1id3jg945d9yrxwba";
      };

      beamDeps = [];
    };
  };
in self

