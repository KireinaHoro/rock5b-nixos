{inputs, ...}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {config, final, ...}: {
    overlayAttrs = builtins.mapAttrs (name: value: final.callPackage value {}) {
      mesa = config.packages.mesa-panfork;
      kodi-rock5b = config.packages.kodi;
      fan-control-rock5b = config.packages.fan-control;
      linux-rock5b = config.packages.linux-rock5b;
    };
  };
}
