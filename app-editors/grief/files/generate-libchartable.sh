#!/bin/bash

TARGET=grief-libchartable-1.0.tar.xz

mkdir data
cd data

wget -r -nv -nH -e robots=off --cut-dirs=1 --no-parent --reject "index.html.*" http://ftp.unicode.org/Public/MAPPINGS/

#wget -nv http://ftp.unicode.org/Public/UNIDATA/Unihan.zip
wget -nv http://ftp.unicode.org/Public/UNIDATA/UCD.zip
#wget -nv http://www.cl.cam.ac.uk/~mgk25/download/uniset.tar.gz
#wget -nv http://de.selfhtml.org/html/referenz/zeichen.htm
		
echo "++ do not delete, managed content ++" > .created

tar -C .. cvJf $TARGET data

echo "Now copy $TARGET to the portage distfiles directory"

exit 0
