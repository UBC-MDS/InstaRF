#' RGB manipulation
#'
#' @param input_path string, path to the input .png file
#' @param R int, a weight value for red channel, equal to or greater than 0.
#' @param G int, a weight value for green channel, equal to or greater than 0.
#' @param B int, a weight value for blue channel, equal to or greater than 0.
#' @param output_path string, path to the output .png file
#' @return png file at the output path
#' @export
#'
#' @examples
#' RGB_manipulation("input.png", "output.png", R = 5L, G = 1L, B = 1L)

library(png)
library(testit)

RGB_manipulation <- function(input_path, output_path, R = 2L, G = 2L, B = 2L){

  # exceptional handling
  testit::assert("Please provide the input path as a string", is.character(input_path))
  testit::assert("Please provide the output path as a string", is.character(output_path))
  testit::assert("Please provide red channel weight as integer", is.integer(R))
  testit::assert("Please provide green channel weight as integer", is.integer(G))
  testit::assert("Please provide blue channel weight as integer", is.integer(B))

  # read in image from input path
  img <- png::readPNG(input_path) * 255

  # extract height and weight of input image
  h <- dim(img)[1]
  w <- dim(img)[2]

  # Separate out the RGB channels into individual matrices
  R_mat <- img[, , 1]
  G_mat <- img[, , 2]
  B_mat <- img[, , 3]

  # adjust the intensities for each channel based on weight arguments
  new_R <- R_mat * R
  new_G <- G_mat * G
  new_B <- B_mat * B

  # Correct RGB intensities to be within 0 to 255
  maxV <- 255
  minV <- 0
  RGB_bound <- c()

  for (i in list(new_R, new_G, new_B)){
    bound <- apply(i, c(1,2), function(x) min(max(x, minV), maxV))
    RGB_bound <- c(RGB_bound, bound)
  }

  output <- array(RGB_bound,
                  dim = c(h,w,3))

  # save RGB manipulated image to output path
  png::writePNG(output/255, output_path)
}


