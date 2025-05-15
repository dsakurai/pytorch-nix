{
  description = "A Nix flake to use poetry";


  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        python313
        poetry # <- Uses Nix's default python by default
      ];

      shellHook = ''
          poetry config virtualenvs.in-project true
          poetry init --no-interaction
          poetry env use python3.13
          sed -i 's/requires-python = ">=3.12"/requires-python = "^3.13"/' pyproject.toml
          poetry add jupyterlab notebook ipykernel
          # poetry env activate # <- Doesn't work well with nix because nix seems to prevent $PATH overrides...
          echo "Poetry will use: $(poetry env use ${pkgs.python313}/bin/python3)"
        '';

    };
  };
  
}

