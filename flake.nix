{
  description = "Minimal typescript project";

  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
  };

  outputs = { self, dream2nix, nixpkgs }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      dream2nix = inputs.dream2nix.lib2.init {
        pkgs = pkgs;
        config.projectRoot = ./.;
      };
    in
      pkgs.lib.recursiveUpdate
      (dream2nix.makeFlakeOutputs {
        source = ./.;
        packageOverrides = {
          ts-dream-example = {
            add-inputs = {
              buildInputs = old: old ++ [
                #pkgs.nodePackages.typescript
              ];
            };
            install-symlinks = {
              installPhase = ''
                mkdir -p $out/bin
                ln -s $out/lib/node_modules/ts-dream-example/node_modules/ts-node/dist $out/dist
                ln -s $out/dist/bin.js $out/bin/ts-node
              '';
            };
          };
        };
      })
        {
          devShells."x86_64-linux".ts-dream-example = pkgs.mkShell {
            buildInputs = [ pkgs.nodePackages.typescript ];
            shellHook = ''
              export PATH="${self.packages."x86_64-linux".ts-dream-example}/bin/:$PATH"
            '';
          };
        };
}
