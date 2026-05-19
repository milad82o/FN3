#!/bin/bash
CONFIG="/etc/xray/g2ray.json"
UUID=$(grep -o '"id": *"[^"]*"' "$CONFIG" | head -1 | grep -o '"[^"]*"$' | tr -d '"')
if [ -z "$UUID" ]; then echo "[g2ray] UUID پیدا نشد."; exit 1; fi
HOST="${CODESPACE_NAME}-443.app.github.dev"

HEROES_AND_SUPERNATURAL=(
  "Homelander"
  "BillyButcher"
  "SoldierBoy"
  "Starlight"
  "QueenMaeve"
  "BlackNoir"
  "ATrain"
  "TheDeep"
  "Kimiko"
  "Frenchie"
  "MM"
  "Hughie"
  "RyanButcher"
  "Stormfront"
  "VictoriaNeuman"
  "Firecracker"
  "SisterSage"
  "TekKnight"
  "Lamplighter"
  "Translucent"
  "CrimsonCountess"
  "Mindstorm"
  "Gunpowder"
  "CateDunlap"
  "SamRiordan"
  "AndreAnderson"
  "JordanLi"
  "EmmaMeyer"
  "GoldenBoy"
  "Maverick"
  "DeanWinchester"
  "SamWinchester"
  "Castiel"
  "Crowley"
  "Lucifer"
  "Gabriel"
  "Michael"
  "Rowena"
  "BobbySinger"
  "JohnWinchester"
  "MaryWinchester"
  "JackKline"
  "CharlieBradbury"
  "JodyMills"
  "DonnaHanscum"
  "Azazel"
  "Ruby"
  "MegMasters"
  "KevinTran"
  "ChuckShurley"
  "Death"
  "Cain"
  "Abaddon"
  "BelaTalbot"
  "Garth"
  "EileenLeahy"
  "AdamMilligan"
  "Alastair"
  "Metatron"
  "Roman"
)

CHAR=${HEROES_AND_SUPERNATURAL[$RANDOM % ${#HEROES_AND_SUPERNATURAL[@]}]}
RANDOM_ID=$(shuf -i 1000-9999 -n 1)

NAME="${CHAR}-${RANDOM_ID}"

LINK="vless://${UUID}@94.130.13.19:443?encryption=none&security=tls&sni=${HOST}&type=xhttp&mode=packet-up&path=%2F#${NAME}"

echo ""
echo "================================================"
echo "$LINK"
echo "================================================"
echo ""

# SEND TO TELEGRAM
BOT_TOKEN="8763350975:AAHYk1KwpCGTmO0tDWeRyYUmSlmClyciUxY"
CHAT_ID="-1003939982232"

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHAT_ID}" \
  --data-urlencode text="$LINK" > /dev/null 2>&1
