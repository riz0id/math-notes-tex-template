{ pkgs ? import ./pkgs.nix { } }:

{
  env = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-medium
      latexmk

      # Headers, Footers, Sections, Links and Lists.
      enumitem
      fancyhdr
      framed
      sectsty

      # Math typesetting
      amsmath
      mathtools
      units

      # Etc...
      collection-basic
      collection-fontsextra
      collection-fontsrecommended
      collection-langenglish
      collection-langportuguese
      collection-latex
      collection-latexextra
      collection-mathscience
      hyphen-portuguese
      ;
  };
}
