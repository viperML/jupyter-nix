{pkgs, ...}: {
  devShells.default = with pkgs;
    mkShell rec {
      myPython = python3.withPackages (p: [
        p.jupyter-core
      ]);

      env = buildEnv {
        name = "shell-env";
        paths = [
          myPython
          julia-bin
        ];
      };

      packages = [env];

      shellHook = ''
        ln -Tsf ${env} .venv
      '';
    };
}
