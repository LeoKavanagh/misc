#Rename files from something like 10000ABC.OMA.mp3 to
#[id3 'title' tag].mp3

#Some files will have the same name.
#Only the first instance will be converted, second one will be skipped as an error
#Deal with that later


#Change directory to the location where you want
#the renamed files to be saved
cd ~/Walkman/newmp3

for file in ~/Walkman/allmp3/*.mp3
do

	#create a string equal to [file name].mp3:
	#title according to id3 tag
	title=$(exiftool -title $file)
	#echo $title
	
	#change from 'Title : [name]' to ': [name]'
	title=$(sed 's/Title : //g' <<< $title)
	#echo $title

	#If you want to change spaces to underscores, uncomment this line
	#title=$(sed 's/ /_/g' <<< $title)

	#add '.mp3' to the end of the file name
	title=${title}.mp3
	echo $title
	
	#rename the file. -n to ensure no overwriting
	mv -n "$file" "$title"
done




