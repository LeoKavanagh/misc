#change all the Atrac3Plus files in the folder to mp3
#Later I'll rename the file as whatever the track name
#metadata is


for file in ~/Walkman/AllMusic/*.OMA
do

	ffmpeg -i $file -acodec libmp3lame $file.mp3
done
