
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pkgDataTest

<!-- badges: start -->
<!-- badges: end -->

The goal of pkgDataTest is to illustrate the issue I’m having with a
minimal reproducible expample. The issue is that I have created an
internal function called fn_docalc in which I reference a
package-exported dataset called measurements. I expect that fn_docalc
will always operate on this package-version of the measurements
variable. However, in the case that the user also creates a global
variable with the same name as the dataset (measurements), then
fn_docalc is using that new variable to operate on instead.

## Installation

You can install the development version of pkgDataTest from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("joeramirez/pkgDataTest")
```

## Example

Steps to reproduce the issue:

``` r
library(pkgDataTest)

#make a local global copy of package data "measurements" with a new  name (so we can compare):
tmp1 <- measurements

#call fn_docalc, which should multiply "measurements" by 100 and store in res:
res <- fn_docalc(100)

#tmp1 times 100 should be the same as res:
#this is to be expected and should pass:
testthat::expect_identical(tmp1$value*100, res$value)


#the real test case:
#create a new global variable named the same as "measurements" with different data than the one from the package:
measurements <- data.frame(id = c(1:5), value = c(21:25))

#call fn_docalc with the new "bad" measurements variable in the global environment:
res2 <- fn_docalc(100)
#you'll see that res2 is a 5-row dataframe with the results from operating on the new global measurements data

#this will fail beacuse I expect that fn_docalc will operate on the package's "measurements" variable, not the global one:
testthat::expect_identical(tmp1$value*100, res2$value)
```
