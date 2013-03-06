IFS=$'\n'

for video in $(find "$1" -name "*.dv"); do
	name=$(basename "$video" .dv)
	out="$2/${name}.mp4"
	echo "Transcoding \"$video\"..."
	./convert-minidv.sh "$video" "$out"
	sleep 1800
done
