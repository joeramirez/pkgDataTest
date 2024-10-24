
#' fn_docalc2
#'
#' @param x Value to multiply by
#'
#' @return Measurements2 dataframe, multiplied by x
#' @export
#'

fn_docalc2 <- function(x){
  tmp <- measurements2
  tmp$value <- tmp$value * x
  tmp
}
