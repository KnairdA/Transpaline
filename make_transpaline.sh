#!/bin/sh

wget -O transparency.html "http://api.piratenpartei-bw.de/wiki/getpagehtml/BW:Kreisverband_Konstanz/IT/Transparenz" &> /dev/null
tidy -asxml -utf8 -asxhtml -O transparency_tidy.html -f /dev/null transparency.html
xsltproc --output transpaline_source.xml --novalid makexml_kvkn.xsl transparency_tidy.html &> /dev/null    
xsltproc --output transpaline_result.html --novalid transpaline.xsl transpaline_source.xml 
