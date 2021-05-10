#!/bin/bash

set -e

MACOS_VERSION_MIN=10.14

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SYSTEM_NAME="$1"
BOOST_VERSION="$2"
WITH_PIC="$3"
BUILD_DIR="${SCRIPT_DIR}/boost_build"
INSTALL_DIR="${SCRIPT_DIR}/boost_install"
ARCHIVE_DIR="${SCRIPT_DIR}/boost_archive"

if [ "${SYSTEM_NAME}" = "" ]; then
	echo "SYSTEM_NAME cannot be empty!" >&2
	exit 1
fi

if [ "${BOOST_VERSION}" = "" ]; then
	echo "BOOST_VERSION cannot be empty!" >&2
	exit 1
fi

function determine_os_name() {
    local os_type=$(uname)
    case "$os_type" in
            "Darwin") {
                os_name_upper="DARWIN"
            };;
            "Linux") {
				os_name_upper="LINUX"
            };;
            *) {
                echo "Unsupported OS, exiting" >$2
                exit 1
            };;
    esac
	echo -n ${os_name_upper}
}



build_options="cxxflags=-std=c++14"
if [ "${WITH_PIC}" = "PIC" ]; then
	build_options="${build_options} cxxflags=-fPIC cflags=-fPIC"
fi

os_name=$(determine_os_name)
if [ "${os_name}" = "DARWIN" ]; then
	build_options="${build_options} cflags='-mmacosx-version-min=${MACOS_VERSION_MIN}'"
	build_options="${build_options} cxxflags='-mmacosx-version-min=${MACOS_VERSION_MIN}'"
fi

echo "Additional build options: ${build_options}"

mkdir -p "${BUILD_DIR}"
pushd "${BUILD_DIR}" || exit 1
	boost_version_with_dots="$(echo ${BOOST_VERSION} | sed 's/_/./g' )"
	wget https://boostorg.jfrog.io/artifactory/main/release/${boost_version_with_dots}/source/boost_${BOOST_VERSION}.tar.gz
	tar -xf "boost_${BOOST_VERSION}.tar.gz"

	mkdir -p "${INSTALL_DIR}"
	pushd boost_${BOOST_VERSION} || exit 1
		./bootstrap.sh
		./b2 --prefix="${INSTALL_DIR}" \
			runtime-link=shared,static link=shared,static variant=debug,release threading=multi \
			${build_options} \
			address-model=64 --layout=tagged \
			-j 5 install 
	popd || exit 1

	mkdir -p "${ARCHIVE_DIR}"
	pushd "${ARCHIVE_DIR}" || exit 1
		system_name_stripped=$(echo "${SYSTEM_NAME}" | sed 's/[.-]/_/g')
		pic_suffix="noPIC"
		if [ "$WITH_PIC" = "PIC" ]; then
			pic_suffix="PIC"
		fi
		archive_name="boost-${BOOST_VERSION}-${system_name_stripped}-${pic_suffix}.tar.bz2"
		tar -jcf ${archive_name} -C ${SCRIPT_DIR}/boost_install .
	popd || exit 1
popd || exit 1
