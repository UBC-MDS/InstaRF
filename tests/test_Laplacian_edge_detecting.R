# This script contains tests for the laplacian_filter function

# input: image in .png format
# output: a Laplacian edge detecting image in .png format

library(testthat)
library(png)
library(InstaRF)

# test input: colour image
test_img_laplacian_input <- array(c(c(12, 171, 48,
                                      36, 96, 215,
                                      92, 144, 112),   #R
                                    c(79, 55, 90, 
                                      72, 144, 36,
                                      32, 216, 54),   #G
                                    c(15, 63, 14,
                                      80, 28, 40,
                                      168, 209, 60)),  #B
                                  dim = c(3,3,3))

test_img_laplacian_input <- readPNG("test_img_laplacian_input.png")
# test output: Image with the Laplacian filter applied on it
# filter is [[0,-1,	0],[-1,4,-1],[0,-1,	0]] and boundary is symm

test_img_laplacian_ex_output = array(c(c(72, 255, 255,
                                         163, 73, 255,
                                         255, 255, 120),   #R
                                       c(255, 107, 255,
                                         216, 255, 75,
                                         31, 255, 111),   #G
                                       c(142, 255, 180,
                                         255, 255, 255,
                                         255, 255, 126)),  #B
                                     dim = c(3,3,3))

# Correcting the scale from (0, 255) in here to (0, 1) as PNG getting loaded in
test_img_laplacian_ex_output <- (255 - test_img_laplacian_ex_output)/255

test_img_laplacian_output <- laplacian_filter("test_img_laplacian_input.png", "test_img_laplacian_output.png")

# Check whether laplacian_filter function is working properly
expect_equivalent(test_img_laplacian_output, test_img_laplacian_ex_output)

#Handling the exceptions with laplacian_filter()
expect_is(test_img_laplacian_input, 'array')

expect_is(test_img_laplacian_output, 'array')

expect_error(laplacian_filter(1234, "test_r/test_image/laplacian_output.png"))

expect_error(laplacian_filter("test_r/test_image/test.txt", "test_r/test_image/laplacian_output.png"))

expect_error(laplacian_filter("./1234/123.png", "test_r/test_image/laplacian_output.png"))

expect_error(laplacian_filter("test_img_laplacian_input.png", 1234))
