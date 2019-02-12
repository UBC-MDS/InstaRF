# This script contains tests for the Laplacian_edge_detecting function

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

test_img_laplacian_input <- readPNG("test_r/test_image/test_img_laplacian_input.png")
# test output: Image with the Laplacian filter applied on it
# filter is [[0,-1,	0],[-1,4,-1],[0,-1,	0]] and boundary is symm

test_img_laplacian_ex_output = array(c(c(0, 255, 0,
                                         0, 0, 255,
                                         8, 12, 26),   #R
                                       c(155, 0, 153, 
                                         0, 255, 0,
                                         0, 155, 0),   #G
                                       c(0, 105, 0,
                                         60, 0, 16,
                                         95, 183, 0)),  #B
                                     dim = c(3,3,3))

test_img_laplacian_output <- laplacian_filter("test_r/test_image/test_img_laplacian_input.png", "test_r/test_image/laplacian_output.png")

# Check whether laplacian_filter function is working properly
test_that('function is working properly',{
  expect_equivalent(test_img_laplacian_output, test_img_laplacian_ex_output)
})

#Handling the exceptions with laplacian_filter()
test_that('function input is the right type',{
  expect_is(test_img_laplacian_input, 'matrix')
})

test_that('function output is the right type',{
  expect_is(test_img_laplacian_output, 'matrix')
})

test_that('function input path is incorrect',{
  expect_error(laplacian_filter(1234, "test_r/test_image/laplacian_output.png"))
})

test_that('input type is incorrect',{
  expect_error(laplacian_filter("test_r/test_image/test.txt", "test_r/test_image/laplacian_output.png"))
})

test_that('function input path is incorrect',{
  expect_error(laplacian_filter("./1234/123.png", "test_r/test_image/laplacian_output.png"))
})

test_that('function output path is incorrect',{
  expect_error(laplacian_filter("test_py/test_image/test_img_laplacian_input.png", 1234))
})
