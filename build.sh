#! /bin/bash

# remove old site
rm *.html

# update build date
BUILD_DATE=$(date)
sed -i "s/^<p>Last Updated.*/<p>Last Updated: $BUILD_DATE<\/p>/g" includes/footer.html

# build new html pages with pandoc
find . -name \*.md -type f -exec pandoc -c includes/style.css -B includes/header.html -A includes/footer.html -o {}.html {} \;

# rename from md.html to html
find . -depth -name '*.md.html' -execdir bash -c 'mv -i "$1" "${1//md.html/html}"' bash {} \;

# publish the site
# github: at this point if the changes are pushed, changes will be automatically published
# lo
# done
