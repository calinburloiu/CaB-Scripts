avconv -y -i "$1" -f mp4 -c:a libvo_aacenc -ab:a 256k -ar:a 44100 -ac:a 2 -c:v libx264 -preset medium -tune film -b:v 3072k "$2"
