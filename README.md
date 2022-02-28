
# Boost binary distribution for Linux and Macos OS

Prebuild Boost binaries for following systems

- Ubuntu 18.04
- Ubuntu 20.04
- Debian Buste
- Debian Bullseye
- Mac OS 11.0

Archives with binaries can by found at Release page.

Each OS has version with and without -fPIC flag.

- Distributions compiled with PIC has '-PIC' in the archive name.
- Distributions compiled without PIC has '-noPIC' in the archive name.

## Build environment

Standard system tools are used for build.

On linux the GCC and OpenSSL is used. Linux is built by [Docker images](docker/) from this repository.

On Mac OS standard clang and system ssl library is used.

## License

The repository code is released under [MIT License](LICENSE)

Boost binaries and Boost sources are licensed under standard Boost license.
