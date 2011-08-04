
cd public/comics
git pull

for img in *.png; do
  maxnumber=$(echo $img | cut -d- -f1)
done
maxnumber=$(expr $maxnumber - 0)
cdnprefix='\/comics'

for img in *.png; do
  number=$(echo $img | cut -d- -f1)
  number=$(expr $number - 0)
  filename=$(echo $img | cut -d- -f2-)
  title=$(echo $filename | cut -d. -f1 | sed 's/-/ /g')
  prevnum=$(if [[ $number -gt 1 ]]; then echo $(expr $number - 1); else echo '#'; fi)
  nextnum=$(if [[ $number -lt $maxnumber ]]; then echo $(expr $number + 1); else echo '#'; fi)

  cat ../../template.wtfbash | sed  -e "s/TITLEGOESHERE/$title/g" \
				    -e "s/MAXNUMBERGOESHERE/$maxnumber/g" \
				    -e "s/NUMBERGOESHERE/$number/g" \
				    -e "s/CONTENTGOESHERE/<img id=strip src=\"${cdnprefix}\/$img\">/" \
				    -e "s/PREVGOESHERE/$prevnum/" \
				    -e "s/NEXTGOESHERE/$nextnum/" \
			  > ../$number.html
done

echo "<!DOCTYPE html><html><head><meta http-equiv=refresh content='0;url=http://dev-rage.com/$maxnumber'></head></html>" > ../index.html
