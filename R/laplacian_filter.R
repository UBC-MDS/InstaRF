#' laplacian edge detecting
#'
#' @param input_img string, path to the input .png file
#' @param output_img string, path to the output .png file
#' @return png file at the output path
#' @export
#'
#' @examples
#' laplacian_filter("input.png", "output.png")

library(png)
library(testit)

laplacian_filter <- function(input_img, output_img) {
  
  # exception handling
  assert("Please provide a string as the path for the input image file.", is.character(input_img))
  assert("Please provide a string as the path for the output image file.", is.character(output_img))
  
  # Exception handling, Raise an Error if file doesn't exist
  mtry <- try(png::readPNG(input_img), silent = TRUE)

  if (class(mtry) == "try-error") {
    stop("File doesn't exist!")
  }

  #add tests to address test unit
  #no need - readPNG throws error to take care of tests in test unit

  #import input & make a copy called "output"
  input <- png::readPNG(input_img)
  output <- input
  #print(input)

  #save the dimension of the image
  img_xdim <- length(input[1,,1])
  img_ydim <- length(input[,1,1])

  #apply filter pixel by pixel
  #Laplacian filter:
  #new pixel = orginal pixel*4 - pixel_below - pixel_above - pixel_left - pixel_right (use max/min to deal with pixels at the edges)
  #apply the same formula to each channel (R, G, B)
  for (i in c(1:img_ydim)) {
    for (j in c(1:img_xdim)) {
      output[i,j,1] <- min(1,max(0, input[i,j,1]*4 -
        input[max(1,       i-1), j                , 1] -
        input[min(img_ydim,i+1), j                , 1] -
        input[i                , max(1,       j-1), 1] -
        input[i                , min(img_xdim,j+1), 1])) %% 1 #+ 1/255

      output[i,j,2] <- min(1,max(0, input[i,j,2]*4 -
        input[max(1,       i-1), j                , 2] -
        input[min(img_ydim,i+1), j                , 2] -
        input[i                , max(1,       j-1), 2] -
        input[i                , min(img_xdim,j+1), 2])) %% 1 #+ 1/255

      output[i,j,3] <- min(1,max(0, input[i,j,3]*4 -
        input[max(1,       i-1), j                , 3] -
        input[min(img_ydim,i+1), j                , 3] -
        input[i                , max(1,       j-1), 3] -
        input[i                , min(img_xdim,j+1), 3])) %% 1 #+ 1/255
    }
  }
  #print(output)
  #save the output
  
  # Exception handling, Raise an Error if output path doesn't exist
  mtry <- try(png::writePNG(output, target=output_img), silent = TRUE)

  if (class(mtry) == "try-error") {
    stop("Output Path doesn't exist!")
  }
  
  return(output)
}
