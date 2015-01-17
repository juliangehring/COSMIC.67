
library(testthat)
library(COSMIC.67)

context("Utils functions")

test_that("vcf linker works", {
    
    expect_true(file.exists(cosmicVcfPath()))
  
})
