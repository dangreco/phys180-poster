{
  description = "dangreco/phys180-poster environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        {
          pkgs,
          ...
        }:
        {
          devShells.default =
            let
              __zed = pkgs.writeTextFile {
                name = "zed-settings";
                text = builtins.toJSON {
                  lsp = {
                    tinymist = {
                      binary = {
                        path = "${pkgs.tinymist}/bin/tinymist";
                      };
                    };
                  };
                  languages = {
                    Typst = {
                      formatter = {
                        external = {
                          command = "${pkgs.typstyle}/bin/typstyle";
                        };
                      };
                      format_on_save = "on";
                    };
                  };
                };
                destination = "/settings.json";
              };
            in
            pkgs.mkShell {
              nativeBuildInputs = with pkgs; [
                nil
                nixd
                nixfmt

                git
                act
                just

                typst
                tinymist
                zathura
                inter
                typstyle
              ];

              shellHook = ''
                rm -rf .zed
                mkdir -p .zed
                cp ${__zed}/settings.json .zed/settings.json
                export TYPST_FONT_PATHS="${pkgs.inter}/share/fonts"
              '';
            };
        };
    };
}
