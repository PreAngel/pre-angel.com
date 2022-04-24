#!/usr/bin/env bash
set -e

function resize () {
  FILE=$1
  mogrify \
    -verbose \
    -quality 80 \
    -resize '1920>' \
    ${FILE}
}

DST=${1:-.}

if [ -f "$DST" ]; then
  echo "fit-image: $DST is file"
  resize "$DST"
  exit 0
fi

echo "fit-image: $DST is directory"
pushd ${DST}

# FILES=$(git ls-files --exclude-standard --others *.jpg)
FILE_LIST=($(find . -type f -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' -o -name '*.gif'))

echo "Checking ..."
for FILE in "${FILE_LIST[@]}"; do
  if [[ $FILE =~ assets/ventures/preangel/ ]]; then
    # echo "skipped $FILE for it's in whitelist directory."
    echo -n S
    continue
  fi

  WIDTH=$(identify -ping -format '%w' "$FILE")
  # echo "$FILE WIDTH: $WIDTH"
  if [ $WIDTH -gt 1920 ]; then
    resize $FILE
    echo "Resized $FILE"
  else
    echo -n O
  fi

done

echo
echo Done.

popd

# get the top square from the image
# magick -background white -gravity north image.webp  -extent "%[fx:h<w?h:w]x%[fx:h<w?h:w]"  corpped.ppm
# convert corpped.ppm corpped.webp
