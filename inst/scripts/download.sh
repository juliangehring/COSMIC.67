#!/usr/bin/env sh

wget -crN -nd -l 1 -A *.vcf.gz ftp://ngs.sanger.ac.uk/production/cosmic/ -P inst/raw -q

wget -crN -nd -l 1 ftp://ftp.sanger.ac.uk/pub/CGP/cosmic/data_export/cancer_gene_census.tsv -P inst/raw -q
