#!bin/bash

set -e

OS_TYPE=$(uname)
DIRS=('assets' 'src' 'Packages'
      'src/server' 'src/server/components' 'src/server/services' 'src/server/scripts'
      'src/client' 'src/client/components' 'src/client/controllers' 'src/client/scripts'
      'src/common/configuration' 'src/common/modules' 'src/common/types')

fix_dirs() {
    for i in "${DIRS[@]}"; do
        if [[ ! -d $i ]]; then
            mkdir -p "$i"
        fi
    done
}

init() {
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

    rojo sourcemap default.project.json -o sourcemap.json
    wally-package-types --sourcemap sourcemap.json Packages/
}

run_rojo() {
    rojo serve default.project.json
    rojo sourcemap default.project.json -o sourcemap.json --watch
}

if [[ $1 == "init" ]]; then
    init
fi

if [[ -f "default.project.json" ]]; then
    if [[ $1 == "run" ]]; then
        run_rojo
    elif [[ $1 == "install" ]]; then
        install_packages
    elif [[ $1 == "fix" ]]; then
        fix_dirs
    fi
else
    echo "Project not initialized"
fi
