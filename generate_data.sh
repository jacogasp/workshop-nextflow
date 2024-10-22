#!/bin/bash
data_dir=$1

function usage() {
  echo "Usage: generate_data <output_dir>"
  echo "   Generate dummy files in the <output_dir> folder"
  echo
}

if [[ -z $data_dir ]]; then
  usage
  exit
fi

mkdir -p ${data_dir}

for letter in {A..E}; do
    random_number=$((RANDOM % 9001 + 1000))
    echo $random_number > "${data_dir}/${letter}.txt"
done

echo "Done."
