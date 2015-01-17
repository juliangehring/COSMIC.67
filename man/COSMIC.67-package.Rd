
\name{COSMIC.67-package}
    
\docType{package}

\alias{COSMIC.67}
\alias{COSMIC.67-data}
\alias{COSMIC.67-package}
\alias{cosmic_67}
\alias{cosmic_67-data}
\alias{cgc_67}
\alias{cgc_67-data}

\title{COSMIC.67 package}

\description{
  Mutations of the 'Catalogue Of Somatic Mutations In Cancer'(COSMIC),
  version 67 (2013-10-24).
}

\details{
  The 'COSMIC.67' package provides the curated mutations published with
  the COSMIC release version 67 (2013-10-24).  Both variants found in
  coding and non-coding regions are included and offered as (a) a single
  object of class 'CollapsedVCF' and (b) a bgzipped and tabix-index
  'VCF' file.  Additionally, the package contains the cancer gene
  census, a list of genes causally linked to cancer.
  
  For details on the collection and curation of the original data,
  please see the webpage of the COSMIC project:
  \url{http://cancer.sanger.ac.uk/cancergenome/projects/cosmic/}.
  
  The following steps are performed for importing and processing of the
  VCF data:
  
  1. Downloading of the VCF files 'CosmicCodingMuts_v67_20131024.vcf.gz'
  and 'CosmicNonCodingVariants_v67_20131024.vcf.gz' from
  'ftp://ngs.sanger.ac.uk/production/cosmic/' to 'inst/raw/'.
  
  2. Importing of both files to R using 'readVcf'.

  3. Sorting of the seqlevels and adding 'seqinfo' data for the toplevel
  chromosomes of 'GRCh37'.
  
  4. Merging of both objects, sorting according to genomic position.

  5. Converting the object to class 'VariantAnnotation::VRanges'.

  6. Converting all 'character' columns to 'factors'.

  7. Saving the merged object to 'data/cosmic_v67_vcf.rda'.

  8. Exporting the merged object as a bgzipped and tabix-indexed 'VCF'
  to 'inst/vcf/cosmic_v67.vcf.gz'.

  The following steps are performed for importing and processing of the
  Cancer Gene Census data:

  1. Downloading of the 'cancer_gene_census.tsv' file from
  \url{ftp://ftp.sanger.ac.uk/pub/CGP/cosmic/data_export} to 'inst/raw'.

  2. Import of the files as a data frame.

  3. Annotation of the 'HGNC' and 'ENSEMBLID' identifiers, using the
  'ENTREZ gene ID' as query with the 'org.Hs.eg.db' object.

  4. Saving the object to 'data/cgc_67.rda'.

  The mutation data was obtained from the Sanger Institute Catalogue Of
  Somatic Mutations In Cancer web site, http://www.sanger.ac.uk/cosmic
  Bamford et al (2004) The COSMIC (Catalogue of Somatic Mutations in
  Cancer) database and website. Br J Cancer, 91,355-358.

  For details on the usage and redistribution of the data, please see
  \url{ftp://ftp.sanger.ac.uk/pub/CGP/cosmic/GUIDELINES_ON_THE_USE_OF_THIS_DATA.txt}.

}


\references{
  \url{http://cancer.sanger.ac.uk/cancergenome/projects/cosmic/}
  
  \url{http://nar.oxfordjournalls.org/content/39/suppl_1/D945.long}

  \url{ftp://ftp.sanger.ac.uk/pub/CGP/cosmic/GUIDELINES_ON_THE_USE_OF_THIS_DATA.txt}
}

\author{
  Julian Gehring, EMBL Heidelberg <julian.gehring@embl.de>
}

\seealso{
  \code{\link[VariantAnnotation]{VCF-class}}
}
  
\examples{
  data(package = "COSMIC.67")
  data(cosmic_67, package = "COSMIC.67")
  
  library(VariantAnnotation)
  library(GenomicRanges)
  
  tp53_range = GRanges("17", IRanges(7565097, 7590856))
  vcf_path = system.file("vcf", "cosmic_67.vcf.gz", package = "COSMIC.67")
  cosmic_tp53 = readVcf(vcf_path, genome = "GRCh37", ScanVcfParam(which = tp53_range))
  cosmic_tp53

  data(cgc_67, package = "COSMIC.67")
  head(cgc_67)
}

\keyword{package}
\keyword{datasets}
