#!bin/bash

set -e

OS_TYPE=$(uname)
DIRS=('assets' 'Packages'
      'src/server/components' 'src/server/services' 'src/server/scripts'
      'src/client/components' 'src/client/controllers' 'src/client/scripts'
      'src/common/configuration' 'src/common/modules' 'src/common/types')

usage() {
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  help          Show this Help Message (and fixes the Directory Structure)"
    echo "  init          Initialize The Project"
    echo "  run           Run Rojo Server"
    echo "  install       Install all Aftman and Wally Packages"
    echo "  fix           Fix the Directory Structure if the Project lacks any"
    echo
    echo "Example:"
    echo "  $0 init           Initialize"
    echo "  $0 install        Install Packages"
    echo "  $0 run            Run Rojo Server"
    exit 1
}

fix_dirs() {
    echo "Fixing Directories"
    for i in "${DIRS[@]}"; do
        if [[ ! -d "./$i" ]]; then
            mkdir -p "./$i"
        fi
    done
}

init() {
    echo "Initializing Project"
    aftman self-install
    aftman init
    aftman add rojo-rbx/rojo@7.4.4
    aftman add UpliftGames/wally@0.3.2
    aftman add JohnnyMorganz/wally-package-types@1.3.2
    aftman install

    rojo init

    wally init

    rm -rf ./src
    rm default.project.json
    cp ~/.templates/default.project.json ./

    fix_dirs

    touch src/client/scripts/runtime.client.luau
    touch src/server/scripts/runtime.server.luau
}

install_packages() {
    aftman self-install
    aftman install
    wally install

    rojo sourcemap --output sourcemap.json --include-non-scripts
    wally-package-types --sourcemap sourcemap.json Packages/
}

run_rojo() {
    rojo serve default.project.json &
    rojo sourcemap --watch default.project.json --output sourcemap.json --include-non-scripts
}

if [[ $1 == "init" ]]; then
    init
    exit 0
fi

if [[ -f "default.project.json" ]]; then
    if [[ $1 == "run" ]]; then
        run_rojo
        exit 0
    elif [[ $1 == "install" ]]; then
        install_packages
        exit 0
    elif [[ $1 == "fix" ]]; then
        fix_dirs
        exit 0
    fi
else
    echo "Project not initialized"
    exit 1
fi

echo "Invalid Arguement Passed"
usage
