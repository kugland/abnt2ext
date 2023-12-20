{ pkgs, lib, config, ... }:

with lib;

let
  cfg = config.customization.abnt2ext;

  abnt2ext = fetchGit {
    url = "https://github.com/kugland/abnt2ext.git";
    ref = "main";
    rev = "1e8cf48fdfc2c5c76729aa07033b7863f70417cd"; # main
  };

in
{
  options.customization.abnt2ext = {
    enable = mkEnableOption "Enable ABNT2 extended keyboard layout";
    setAsDefault = mkOption {
      type = lib.types.bool;
      default = false;
      description = "Set ABNT2 extended keyboard layout as default";
    };
  };

  config = mkIf cfg.enable {
    services.xserver = {
      extraLayouts.abnt2ext = {
        description = "ABNT2 extended keyboard";
        languages = [ "br" ];
        symbolsFile = "${abnt2ext}/abnt2ext";
      };
    } // (if cfg.setAsDefault then {
      layout = "abnt2ext";
      xkbVariant = "";
    } else { });
  };
}
