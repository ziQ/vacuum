#!/bin/bash
# Turn off Chinese New Year

LIST_CUSTOM_PRINT_USAGE+=("custom_print_usage_off_cn_ny")
LIST_CUSTOM_PRINT_HELP+=("custom_print_help_off_cn_ny")
LIST_CUSTOM_PARSE_ARGS+=("custom_parse_args_off_cn_ny")
LIST_CUSTOM_FUNCTION+=("custom_function_off_cn_ny")
ENABLE_TURN_OFF_NY=${ENABLE_TURN_OFF_NY:-"0"}

function custom_print_usage_off_cn_ny() {
    cat << EOF

Custom parameters for '${BASH_SOURCE[0]}':
[--enable-turn-off-ny]
EOF
}

function custom_print_help_off_cn_ny() {
    cat << EOF

Custom options for '${BASH_SOURCE[0]}':
  --enable-turn-off-ny       Turn off Chinese New Year
EOF
}

function custom_parse_args_off_cn_ny() {
    case ${PARAM} in
        *-enable-turn-off-ny)
            ENABLE_TURN_OFF_NY=1
            ;;
        -*)
            return 1
            ;;
    esac
}

function custom_function_off_cn_ny() {
    if [ $ENABLE_TURN_OFF_NY -eq 1 ]; then
        SILENT_PATH=$(dirname $(readlink_f "${BASH_SOURCE[0]}"))
        if [ -r "$SILENT_PATH/silent.wav" ]; then
            echo "+ Turn off Chinese New Year"
            install -m 0644 "${SILENT_PATH}/silent.wav" "${IMG_DIR}/opt/rockrobo/resources/sounds/start_greeting.wav"
        else
            echo "- $SILENT_PATH/silent.wav not found/readable"
        fi
    fi
}
