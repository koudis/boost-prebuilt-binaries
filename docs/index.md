## Boost prebuild binaries for Linux

Project which aims to prebuild newest Boost for Linux.

Supported systems are

- Ubuntu 20.04
- Ubuntu 22.04
- Ubuntu 24.04
- Debian Buster
- Debian Bullseye
- Debian Bookworm
- Debian Trixie
- Fedora 42
- Fedora 43

Not supported anymore

- Mac OS 11.0 (until Boost 1.79)
- Ubuntu 18.04 (until Boost 1.79)

Each Boost prebuild for each system is compiled with and without `-fPIC` compile option.

- Distributions compiled with PIC has '-PIC' in the archive name.
- Distributions compiled without PIC has '-noPIC' in the archive name.

Archive with binaries can be found at [Github Release](https://github.com/koudis/boost-prebuilt-binaries/releases)

Detailed documentation can be found at [repository root](https://github.com/koudis/boost-prebuilt-binaries)

### Bug reports, feature requests and questions

If you have some questions or want to submit bugfix/feature use [Discussions](https://github.com/koudis/boost-prebuilt-binaries/discussions) or create a [Ticket](https://github.com/koudis/boost-prebuilt-binaries/issues)

### License

The repository code is released under [MIT License](https://github.com/koudis/boost-prebuilt-binaries/LICENSE)

Boost binaries and Boost sources are licensed under standard Boost license.
