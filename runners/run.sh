#!/usr/bin/env bash

readonly solution="$1"
readonly dir=$(dirname "$1")
readonly solution_filename=$(basename -- "$solution")
readonly solution_extension="${solution_filename##*.}"

declare -A runners=(["js"]="node --trace-uncaught" ["py"]="python")
readonly command=${runners[$solution_extension]}
echo $command $solution_extension

for test_file in "$dir"/*.in.txt
do
    stdout_file="$(mktemp)"
    stderr_file="$(mktemp)"
    time_output="$(mktemp)"

    { time $command "$solution" < "$test_file" > "$stdout_file" 2> "$stderr_file"; } 2> "$time_output"

    file_name=$(basename "$test_file")
    runtime=$(grep real "$time_output" | egrep -o "[0-9]+\.[0-9]+s")
    result=$(diff -wyB "$stdout_file" "${test_file/.in./.out.}")

    if [[ $? == 0 ]]; then
        echo -e "$file_name \033[32;1;1mPASSING\033[0m $runtime"
    else
        echo -e "$file_name \033[31;1;1mFAILING\033[0m $runtime"
        error=$(cat "$stderr_file")
        if [[ -n "$error" ]]
        then
            echo -e "$error"
        else
            echo -e "$result"
        fi
        echo
    fi
done
