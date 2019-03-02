#' Gaussian blur
#'
#' @param input_image_directory string, path to the input .png file
#' @param output_image_directory string, path to the output .png file
#' @param sigma double, the sd of the gaussian distribution
#' @return png file at the output path
#' @export
#'
#' @examples
#' gaussian_blur("test.png", "test_output.png", sigma = 1)


library(png)
library(spatialfil)

gaussian_blur <- function(input_image_directory, output_image_directory, sigma){

  input_img <- png::readPNG(input_image_directory)
  image_demention <- dim(input_img)

  filter <- spatialfil::convKernel(sigma =sigma , k = "gaussian")
  full_f_matrix <- filter$matrix

  # find the 3X3 KERNEL MATRIX
  center_row <- (dim(full_f_matrix)[1]+1)/2
  center_col <- (dim(full_f_matrix)[2]+1)/2

  filter_matrix <- matrix(0,nrow = 3, ncol = 3)

  filter_matrix[1,1] <- full_f_matrix[center_row-1, center_col-1]
  filter_matrix[1,2] <- full_f_matrix[center_row-1, center_col]
  filter_matrix[1,3] <- full_f_matrix[center_row-1, center_col+1]

  filter_matrix[2,1] <- full_f_matrix[center_row, center_col-1]
  filter_matrix[2,2] <- full_f_matrix[center_row, center_col]
  filter_matrix[2,3] <- full_f_matrix[center_row, center_col+1]

  filter_matrix[3,1] <- full_f_matrix[center_row+1, center_col-1]
  filter_matrix[3,2] <- full_f_matrix[center_row+1, center_col]
  filter_matrix[3,3] <- full_f_matrix[center_row+1, center_col+1]

  # define the output image
  output_img <- array(0, c(image_demention[1], ncol = image_demention[2],3))

  # iterate though the image

  for(i in 3:(image_demention[1]-3)){
    for(j in 3:(image_demention[2]-3)){
      for(channel in 1:3){
        pix11 <- input_img[[i-1,j-1,channel]]*filter_matrix[[1,1]]
        pix12 <- input_img[[i-1, j ,channel]]*filter_matrix[[1,2]]
        pix13 <- input_img[[i-1, j+1 ,channel]]*filter_matrix[[1,3]]

        pix21 <- input_img[[i,j-1,channel]]*filter_matrix[[2,1]]
        pix22 <- input_img[[i, j ,channel]]*filter_matrix[[2,2]]
        pix23 <- input_img[[i, j+1 ,channel]]*filter_matrix[[2,3]]

        pix31 <- input_img[[i+1,j-1,channel]]*filter_matrix[[3,1]]
        pix32 <- input_img[[i+1, j ,channel]]*filter_matrix[[3,2]]
        pix33 <- input_img[[i+1, j+1 ,channel]]*filter_matrix[[3,3]]

        output_img[i,j,channel] <- pix11+pix12+pix13+pix21+pix22+pix23+pix31+pix32+pix33
    }
  }
}
png::writePNG(output_img, output_image_directory)

return(output_img)

}
