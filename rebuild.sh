
cd dev-rage
#git pull

for img in *.png; do
  maxnumber=$(echo $img | cut -d- -f1)
done
maxnumber=$(expr $maxnumber - 0)
githubprefix='https:\/\/github.com\/nddrylliog\/dev-rage\/blob\/master'

for img in *.png; do
  number=$(echo $img | cut -d- -f1)
  number=$(expr $number - 0)
  filename=$(echo $img | cut -d- -f2-)
  title=$(echo $filename | cut -d. -f1 | sed 's/-/ /g')
  prevnum=$(if [[ $number -gt 1 ]]; then echo $(expr $number - 1); else echo '#'; fi)
  nextnum=$(if [[ $number -lt $maxnumber ]]; then echo $(expr $number + 1); else echo '#'; fi)

  cat ../template.wtfbash | sed -e "s/TITLEGOESHERE/$title/g" \
				-e "s/MAXNUMBERGOESHERE/$maxnumber/g" \
				-e "s/NUMBERGOESHERE/$number/g" \
				-e "s/CONTENTGOESHERE/<img src=\"${githubprefix}\/$img?raw=true\">/" \
				-e "s/PREVGOESHERE/$prevnum/" \
				-e "s/NEXTGOESHERE/$nextnum/" \
			  > ../public/$number.html
done

echo "<!DOCTYPE html><html><head><meta http-equiv=refresh content='0;url=http://dev-rage.com/$maxnumber'></head></html>" > ../public/index.html
