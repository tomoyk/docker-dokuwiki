#!/bin/bash -xe

mkdir wiki-data/

wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz

tar xvfz dokuwiki-stable.tgz -C ./wiki-data --strip-components 1 

rm -f dokuwiki-stable.tgz 
