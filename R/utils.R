
cosmicVcfPath = function() {
    vcf_path = system.file("vcf", "cosmic_67.vcf.gz", package = "COSMIC.67")
    stopifnot(file.exists(vcf_path))
    return(vcf_path)
}
