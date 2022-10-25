# Usage

Adopted from two YouTubers [craftzdog](https://www.youtube.com/watch?v=ajmK0ZNcM4Q&t=3439s) and [Josean](https://www.youtube.com/watch?v=vdn_pKJUda8),
though the video is long but can learn a lot.

This repo has merged the cons of the two above settings and it is now the elegentest NeoVim settings for me.

The original repo for the two above configurations are: [craftzdog](https://github.com/craftzdog/dotfiles-public) and
[Josean](https://github.com/josean-dev/dev-environment-files)

I added _Python_ and _C/Clang_ support to suite for my development needs.

## macOS

Copy this folder to ~/.config and use NeoVim to open any file then save it and _packer_ will automatically install the packages, after that everything should go smoothly.

## Dependencies

These dependencies can be installed via your favorite package manager such as: Homebrew and MacPorts.

`node`: to install language server, recommend to install via Homebrew, MacPorts version need root permission to install global packages.

`rg`: regular expression

`pyright`: python LSP

`lua-language-server`: lua LSP

`tailwindcss-language-server`: CSS LSP

`flake8`: python diagnostic

`black`: python formatting

`prettierd`: prettier dependency

~~`cppcheck`: C/C++ diagnostic~~

`clang-format`: C/C++/clang formatting

~~`ccls`: LSP for C/C++~~

`clangd`: LSP for C/C++ comes with llvm, can offer diagnostic so that cppcheck is not needed any more.

`Bear`: Tool to generate compilation database for C/C++, cland is relied on this.

`isort`: Python import ordering.

`instant-markdown-d`: Preview markdown lively
