{
  description = "A Nix flake to use poetry";


  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        python313
        poetry # <- Uses Nix's system default python by default
        pkgs.gcc.cc.lib # for jupyter
      ];

      shellHook = ''
          # Pass the libraries (to poetry's virtual environment for using Python packages)
          export "LD_LIBRARY_PATH=${pkgs.gcc.cc.lib}/lib:$LD_LIBRARY_PATH"

          poetry config virtualenvs.in-project true
          poetry init --no-interaction

          poetry env use python3.13
          # Hard-code the Python version in the poetry project setting.
          sed -i 's/requires-python = ">=3.12"/requires-python = "^3.13"/' pyproject.toml

          # You may add Python packages with poetry here, but it will be saved in the TOML file anyway.
          # poetry add jupyterlab notebook ipykernel

          # Activate environment
          eval $(poetry env activate)
        '';

    };
  };
  
}

