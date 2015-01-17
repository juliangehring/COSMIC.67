
library(VariantAnnotation)
library(variants)

genome = "GRCh37"
vcf_paths = c(coding = "inst/raw/CosmicCodingMuts_v67_20131024.vcf.gz",
    non_coding = "inst/raw/CosmicNonCodingVariants_v67_20131024.vcf.gz")
vcf_out_path = "inst/vcf/cosmic_67.vcf"
vr_out_name = "cosmic_67"
rda_out_path = "data/cosmic_67.rda"
seq_info_path = "inst/ref/seq_info_GRCh37.rda"

load(seq_info_path)

process_vcf <- function(path, seq_info, genome_name = as.character(genome(seq_info)[1])) {
    v = readVcf(path, genome_name)
    v = sortSeqlevels(v) 
    seqinfo(v) = seq_info
    return(v)
}

vcf_list = lapply(vcf_paths, process_vcf, seq_info)
vcf = sort(do.call(rbind, vcf_list))

vr = as(vcf, "VRanges")
mcols(vr) = dfConvertColumns(mcols(vr), "character", "factor")

assign(vr_out_name, vr)


save(list = vr_out_name, file = rda_out_path, compress = "xz")

writeVcf(vcf, vcf_out_path, index = TRUE)
