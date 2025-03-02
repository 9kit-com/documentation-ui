{
  description = "KanbanApi development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ];
        };
      in
      {
        devShells.default = pkgs.mkShell {
          name = "kanban-api-dev";
          buildInputs = with pkgs; [

            # Database tools
            sqlite # Assuming SQLite is used based on the context

            # Utility tools
            act # For GitHub Actions local testing
            sops # For secrets management

            # Development tools
            jq
          ];

          shellHook = ''
            echo "DocumentationUI development environment loaded"
            # export DOTNET_ROOT=${pkgs.dotnet-sdk_8}
            # export PATH=$PATH:$HOME/.dotnet/tools
            # Ensure user-specific .NET tools are available
            # mkdir -p $HOME/.dotnet/tools
          '';
        };
      }
    );
}
