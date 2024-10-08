
# Boost binary distribution for Linux and Macos OS

Prebuild Boost binaries for following systems

- Ubuntu 18.04 (until Boost 1.79)
- Ubuntu 20.04
- Ubuntu 22.04
- Ubuntu 24.04
- Debian Buster
- Debian Bullseye
- Debian Bookworm
- Mac OS 11.0 (until Boost 1.79)

Archives with binaries can by found at Release page.

Each OS has version with and without -fPIC flag.

- Distributions compiled with PIC has '-PIC' in the archive name.
- Distributions compiled without PIC has '-noPIC' in the archive name.

## Build environment

Standard system tools are used for build.

On linux the GCC and OpenSSL is used. Linux is built by [Docker images](docker/) from this repository.

On Mac OS standard clang and system ssl library is used.

Build images regenerated: 30. 8. 2024 

## License

The repository code is released under [MIT License](LICENSE)

Boost binaries and Boost sources are licensed under standard Boost license.
