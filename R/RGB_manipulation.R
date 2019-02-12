
#' RGB manipulation
#'
#' @param input_img string, path to the input .png file
#' @param R int, a weight value, equal to or greater than 1, for red the filter
#' @param G int, a weight value, equal to or greater than 1, for green the filter
#' @param B int, a weight value, equal to or greater than 1, for blue the filter
#' @param output_img string, path to the output .png file
#' @return png file at the output path
#' @export
#'
#' @examples
#' RGB_manipulation("input.png", 1, 2, 3, "output.png")


RGB_manipulation <- function(input_img, R = 1, G = 1, B =1, output_img) {
  print("RGB manipulation working")
}
