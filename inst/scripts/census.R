
library(GenomicRanges)

genome = "GRCh37"
cgc_path = "inst/raw/cancer_gene_census.tsv"
cgc_out_path = "data/cgc_67.rda"
cgc_out_name = "cgc_67"

library(org.Hs.eg.db)

cgc_raw = read.delim(cgc_path, stringsAsFactors = FALSE)

cgc = select(org.Hs.eg.db,
    keys = as.character(cgc_raw$GeneID),
    c("SYMBOL", "ENSEMBL"),
    keytype = "ENTREZID")
cgc = cgc[ ,c("SYMBOL", "ENTREZID", "ENSEMBL")]

assign(cgc_out_name, cgc)

save(list = cgc_out_name, file = cgc_out_path, compress = "xz")
