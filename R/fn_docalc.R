utils::globalVariables(c("measurements"))

#' fn_docalc
#'
#' @param x Value to multiply by
#'
#' @return Measurements dataframe, multiplied by x
#' @export
#'

fn_docalc <- function(x){
  tmp <- measurements
  tmp$value <- tmp$value * x
  tmp
}
