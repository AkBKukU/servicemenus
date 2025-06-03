#!/bin/bash

mime=`mimetype -b $1`

if [[ $mime == "audio/"* ]]
then
	audio=$1
	video=$2
else
	audio=$2
	video=$1
fi

video_file=`basename $video`
audio_file=`basename $audio`

extension="${video_file##*.}"
videoname="${video_file%.*}"
audioname="${audio_file%.*}"

ffmpeg -i $video -i $audio -c:v copy -map 0:v:0 -map 1:a:0 "$videoname"_"$audioname.$extension"
