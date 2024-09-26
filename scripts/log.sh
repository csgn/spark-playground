LOG_LEVEL=INFO
COLOR_RESET="\033[0m"
COLOR_DEBUG="\033[36m"
COLOR_INFO="\033[32m"
COLOR_ERROR="\033[31m"

function log_message() {
  local LEVEL="$1"
  shift
  local MESSAGE="$@"
  local TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
  local COLOR=""

  # Set the color based on log level
  case "$LEVEL" in
    DEBUG)
      COLOR="$COLOR_DEBUG"
      ;;
    INFO)
      COLOR="$COLOR_INFO"
      ;;
    ERROR)
      COLOR="$COLOR_ERROR"
      ;;
  esac

  # Define the order of log levels
  case "$LOG_LEVEL" in
    DEBUG)
      echo -e "${COLOR}$TIMESTAMP [$LEVEL]: $MESSAGE${COLOR_RESET}"
      ;;
    INFO)
      if [[ "$LEVEL" != "DEBUG" ]]; then
        echo -e "${COLOR}$TIMESTAMP [$LEVEL]: $MESSAGE${COLOR_RESET}"
      fi
      ;;
    ERROR)
      if [[ "$LEVEL" == "ERROR" ]]; then
        echo -e "${COLOR}$TIMESTAMP [$LEVEL]: $MESSAGE${COLOR_RESET}"
      fi
      ;;
  esac
}

function log_debug() {
  log_message "DEBUG" "$@"
}

function log_info() {
  log_message "INFO" "$@"
}

function log_error() {
  log_message "ERROR" "$@"
}
