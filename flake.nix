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
                husky
                go-task
                parallel

                # Typst
                inter
                typst
                tinymist
                typstyle
                zathura

                # YAML
                yamlfmt
                yamllint
              ];

              shellHook = ''
                export TYPST_FONT_PATHS="${pkgs.inter}/share/fonts"
                rm -rf .zed
                mkdir -p .zed
                cp ${__zed}/settings.json .zed/settings.json
                husky install > /dev/null 2>&1 || true
              '';
            };
        };
    };
}
