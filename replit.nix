{ pkgs }: {
    deps = [
        (pkgs.haskellPackages.ghcWithPackages (pkgs: with pkgs; [
          scotty wai-extra  
          random random-shuffle
          split
          bytestring
          text
        ]))       
        pkgs.haskellPackages.ghc
        pkgs.haskell-language-server
    ];
}
