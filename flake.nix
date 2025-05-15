{
  description = "A Nix flake to use poetry";


  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        python313
        (python313.withPackages (ps: with ps; [
            poetry-core
        ]))
      ];

    };
  };
  
}

