# 使い方:
#   ./docker.sh [op] [dst]
#  [op]
#    -b: ビルド
#    -p: Dockerレジストリへpush
#      prod
#  [dst]
#    dev:  開発/Staging用
#    prod: 本番用
#
#  ex) 開発用ビルド
#   ./docker.sh -b dev
#

#!/bin/zsh

# Dockerレジストリ
REGISTRY=asia.gcr.io/xxx/
# このコンテナのタグ
TAG=php56

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

abort() { echo "$*" >&2; exit 1; }
unknown() { abort "unrecognized option '$1'"; }
required() { [ $# -gt 1 ] || abort "option '$1' requires an argument"; }

ARG_ENV=''

build() {
    echo "build ${ARG_ENV}"
    docker build -f Dockerfile.${ARG_ENV}  . --pull=true -t ${REGISTRY}${TAG}-${ARG_ENV}
}

push() {
    read -p "Press [Enter] key to push ${ARG_ENV}."
    docker push ${REGISTRY}${TAG}-${ARG_ENV}
}

while [ $# -gt 0 ]; do
  case $1 in
    -b | --build ) required "$@" && shift; ARG_ENV=$1; build ;;
    -p | --push ) required "$@" && shift; ARG_ENV=$1; push ;;
    -?*) unknown "$@" ;;
    *) break
  esac
  shift
done
