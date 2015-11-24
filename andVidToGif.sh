#!/bin/bash

usage() { echo "Usage: $0 -i input.mp4  -o output.gif" 1>&2; exit 1; }

while getopts ":i:o:" a; do
    case "${a}" in
        i)
            i=${OPTARG}
            ;;
        o)
            o=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${i}" ] || [ -z "${o}" ]; then
    usage
fi

echo "input_file = ${i}"
echo "output_file = ${o}"

tmp_dir="${o}_tmp"

#Create a temp directory
mkdir "${tmp_dir}"

#Dump all the frames from the video into the temp directory
ffmpeg -i "${i}" -r 30 "${tmp_dir}/frame%05d.png"

#Shrink the output frames for a more useful gif
convert "${tmp_dir}/frame*.png" -resize 25% "${tmp_dir}/small_frame%05d.png"

#Create the gif
convert -dispose none -delay 1x30 "${tmp_dir}/small_frame*.png" -coalesce "${o}"

#Clean up
rm -r "${tmp_dir}"
