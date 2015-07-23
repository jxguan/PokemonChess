rm -rf imgs
rm -rf sprites
mkdir imgs
mkdir sprites
j=1
for i in $(seq -f "%03g" 1 649)
do
  wget -O "imgs/$i.png" "assets22.pokemon.com/assets/cms2/img/pokedex/full/$i.png"
  wget -O "sprites/$i-front.gif" "sprites.pokecheck.org/i/$i.gif"
  wget -O "sprites/$i-back.gif" "sprites.pokecheck.org/b/$i.gif"
  wget -O "sprites/$i-front-shiny.gif" "sprites.pokecheck.org/s/$i.gif"
  wget -O "sprites/$i-back-shiny.gif" "sprites.pokecheck.org/bs/$i.gif"
  wget -O "sprites/$i-icon.png" "sprites.pokecheck.org/icon/$((j)).png"
  wget -O "sprites/$i-icon-shiny.png" "sprites.pokecheck.org/sicon/$((j++)).png"
done
