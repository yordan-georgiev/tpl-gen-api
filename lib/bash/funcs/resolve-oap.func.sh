# usage: do_resolve_oap ORG, do_resolve_oap APP
do_resolve_oap() {
  local basename_dir
  basename_dir=$(basename "$(dirname "$APP_PATH")")

  case "$1" in
    ORG)
      export ORG="${basename_dir%%-*}"
      return 0
      ;;
    APP)
      export APP="${APP_PATH#*-}"
      return 0
      ;;
    PROJ)
      export PROJ="$(echo `basename $PROJ_PATH`|cut -d'-' -f3)"
      return 0
      ;;
    *)
      echo "Invalid argument. Use ORG or APP." >&2
      return 1
      ;;
  esac
  }
