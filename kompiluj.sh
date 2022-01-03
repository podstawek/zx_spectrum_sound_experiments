filename=$(basename -- $1)
extension="${filename##*.}"
filename="${filename%.*}"

echo "Basename: ${filename}" &&\
echo -n "Compiling $1... " &&\
pasmo --tapbas $1 ${filename}.tap &&\
echo "done." &&\
echo -n "Opening ${filename}.tap... " &&\
open ${filename}.tap &&\
echo "done."
