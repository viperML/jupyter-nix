{pkgs, ...}: {
  devShells.default = with pkgs;
    mkShell rec {
      myPython = python3.withPackages (p: [
        p.jupyter
      ]);

      packages = [
        myPython
        ruff
      ];

      shellHook = ''
        venv="$(cd $(dirname $(which python)); cd ..; pwd)"
        ln -Tsf "$venv" .venv
      '';
    };
}
