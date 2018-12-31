# This is a small helper script for launching the Shockwave mod for generals on
# linux. The main generals game works with wine, but the Shockwave launcher does
# not (idk why).
cd "$(dirname "$(realpath "$0")")"

DATA=$(sed 's/\r//g' < Shockwave_Lnchr.dat | sed 's/ //g')
echo "$DATA"

echo "$DATA" | grep '>' | while IFS='>' read -r FROM TO; do
    mv "$FROM" "$TO"
done

wine Generals.exe

# TODO: wine Generals.exe exits before the game actually is done running.
#       Figure out a way to way for the game to exit before reverting
#       moved files
#echo "$DATA" | grep '<' | while IFS='<' read -r TO FROM; do
#    mv "$FROM" "$TO"
#done
