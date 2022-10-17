#' Titlr
#'
#' @param p Plot name
#' @param title "Title text" in quotes
#' @param x.axis "X axis text" in quotes
#' @param y.axis "Y axis text" in quotes
#'
#' @import ggplot2::labs
#' @return
#'
#' @export
#'
#' @examples titlr(plot,"MPG and Weight", "MPG", "Weight")
titlr <- function(p, title, x_axis, y_axis) {

  p + labs(title = title, x = x_axis, y = y_axis)

}