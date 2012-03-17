#!/bin/sh

wget -O transparency.html "http://wiki.piratenpartei.de/wiki//index.php?title=BW:Kreisverband_Konstanz/IT/Transparenz&action=render" &> /dev/null
tidy -asxml -utf8 -asxhtml -O transparency_tidy.html -f /dev/null transparency.html
xsltproc --output transpaline_source.xml --novalid makexml_kvkn.xsl transparency_tidy.html &> /dev/null    
xsltproc --output transpaline.rss --novalid transpaline_rss.xsl transpaline_source.xml 
