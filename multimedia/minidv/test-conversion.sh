avconv -y -i "$1" -f mp4 -c:a libvo_aacenc -ab:a 256k -ar:a 44100 -ac:a 2 -c:v libx264 -preset medium -tune film -b:v 3072k -async 2205 "${2} 2205.mp4"
sleep 1800

avconv -y -i "$1" -f mp4 -c:a libvo_aacenc -ab:a 256k -ar:a 44100 -ac:a 2 -c:v libx264 -preset medium -tune film -b:v 3072k -async 1 "$2 1.mp4"
sleep 1800

avconv -y -i "$1" -f matroska -c:a libvorbis -ab:a 256k -ar:a 44100 -ac:a 2 -c:v libx264 -preset medium -tune film -b:v 3072k -async 1 "$2 1.mkv"
sleep 1800

avconv -y -i "$1" -f matroska -c:a libvorbis -ab:a 256k -ar:a 44100 -ac:a 2 -c:v libx264 -preset medium -tune film -b:v 3072k -async 2205 "$2 2205.mkv"
