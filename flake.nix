{
  description = "Minimal typescript project";

  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
  };

  outputs = { self, dream2nix }@inputs:
    let
      dream2nix = inputs.dream2nix.lib2.init {
        systems = [ "x86_64-linux" ];
        config.projectRoot = ./.;
      };
    in dream2nix.makeFlakeOutputs {
      source = ./.;
    };
}
