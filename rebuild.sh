
cd dev-rage
#git pull

for img in *.png; do
  number=$(echo $img | cut -d- -f1)
  number=$(expr $number - 0)
  filename=$(echo $img | cut -d- -f2-)
  title=$(echo $filename | cut -d. -f1 | sed 's/-/ /g')

  cat ../template.wtfbash | sed "s/TITLEGOESHERE/$title/g" | sed "s/NUMBERGOESHERE/$number/g" | sed "s/PREVIOUSCONTENTGOESHERE/<iframe src='\/$(expr $number - 1)'>/" | sed "s/NEXTCONTENTGOESHERE/<iframe src='\/$(expr $number + 1)'>/" | sed "s/CONTENTGOESHERE/<img src=\"https:\/\/github.com\/nddrylliog\/dev-rage\/blob\/master\/$img?raw=true\">/" > ../public/$number.html
  echo "<!DOCTYPE html><html><head><meta http-equiv=refresh content='0;url=http://dev-rage.com/$number'></head></html>" > ../public/index.html
done
