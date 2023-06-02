#!/bin/zsh
KAKA=$(curl -s --location --request GET 'https://api.fredagskakan.se/thisweek' \
--header 'Content-Type: application/json' \
--data-raw '{
  "cc_name": "basic",
  "channel_name": "mychannel"
}')

kaka=$(printf %s "$KAKA" | jq '.Kaka')
kaka=${kaka/\"/}
kaka=${kaka/\"/}

echo "\e[1;31m$kaka\e[0m"


URL=$(printf %s "$KAKA" | jq '.URL')
URL=${URL/\"/}
URL=${URL/\"/}

#echo "URL IS $URL"
picPath="/tmp/fredagskakan/"
picName="latest.jpg"

wget -qP $picPath$picName $URL

tiv $picPath$picName -h 20

rm -r $picPath
