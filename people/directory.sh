#!/usr/bin/bash

# set -evx

# Blow away the README and rebuild
touch README.md

echo "# ds2002-directory" > README.md
echo " " >> README.md
echo "A people directory for DS2002" >> README.md
echo " " >> README.md

for dir in */; do
    if [ -d "$dir" ]; then
        NAME=`head -1 $dir/README.md | sed -e 's/#//g;'`
        echo "- [$NAME](people/$dir)" >> README.md
    fi
done

mv README.md ../README.md

cd ..
git add .
git commit -m "New student added"
git push origin main

exit
