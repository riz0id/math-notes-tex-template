{ pkgs ? (import ./nix/pkgs.nix { }) }:

let
  gitignoreSource = import ./nix/lib/gitignoreSource.nix {
    inherit pkgs;
  };

in pkgs.stdenv.mkDerivation {
  name = "aluffi-notes";

  src = gitignoreSource ./.;

  buildInputs = [
    (import ./nix/texlive.nix { inherit pkgs; }).env
  ];

  buildPhase = ''
    mkdir $out
    latexmk -verbose -pdf \
      -pdflatex="pdflatex -interaction=nonstopmode -halt-on-error -shell-escape"\
      slide.tex
  '';

  installPhase = ''
    cp main.pdf $out/main.pdf
  '';
}
