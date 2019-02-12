# Copyright 2018 Betty Zhou
# This script contains tests for the RGB_manipulation function

# input: image in .png format, weights for adjusting R,G,B
# output: a RGB manipulated image in .png format in the output path

library(testthat)
library(png)
library(InstaRF)

# test input: colour image
test_img_RGB_manipulation_input <- array(c(c(12, 24, 48,
                                      48, 96, 192,
                                      72, 144, 255),   #R
                                    c(18, 36, 9,
                                      72, 144, 36,
                                      108, 216, 54),   #G
                                    c(28, 7, 14,
                                      112, 28, 56,
                                      168, 42, 84)),  #B
                                 dim = c(3,3,3))

writePNG(test_img_RGB_manipulation_input, "test_r/test_image/test_img_RGB_manipulation_input.png")
test_img_RBG_input_matrix <- readPNG("test_r/test_image/test_img_RGB_manipulation_input.png")

# test output: RGB_manipulated image

test_img_RGB_manipulation_ex_output = array(c(c(3, 6, 12,
                                         12, 24, 48,
                                         18, 36, 8),   #R
                                       c(2, 6, 0,
                                         12, 24, 6,
                                         18, 38, 8,   #G
                                       c(51, 12, 24,
                                         213, 51, 105,
                                         255, 78, 159)),  #B
                                     dim = c(3,3,3))

writePNG(test_img_RGB_manipulation_ex_output, "test_r/test_image/test_img_RGB_manipulation_ex_output.png")
test_img_RBG_output_matrix <- readPNG("test_r/test_image/test_img_RGB_manipulation_ex_output.png")

# Check whether RGB_manipulation function is working properly
RGB_manipulation_output <- RGB_manipulation("test_r/test_image/test_img_RGB_manipulation_input.png", R= 1, G=2, B=3, "RGB_manipulation_output.png")
test_that('function is working properly',{
  expect_equivalent(RGB_manipulation_output, test_img_RGB_manipulation_ex_output)
})

#Handling the exceptions with RGB_manipulation_filter()
test_that('function input is the right type',{
  expect_is(test_img_RBG_input_matrix, 'matrix')
})

test_that('function output is the right type',{
  expect_is(test_img_RBG_output_matrix, 'matrix')
})

test_that('function input path is incorrect',{
  expect_error(RGB_manipulation(1234, R= 1, G=2, B=3, "test_r/test_image/RGB_manipulation_output.png"))
})

test_that('input type is incorrect',{
  expect_error(RGB_manipulation("test_r/test_image/test.txt", R= 1, G=2, B=3, "test_r/test_image/RGB_manipulation_output.png"))
})

test_that('function input path is incorrect',{
  expect_error(RGB_manipulation("./1234/123.png", R= 1, G=2, B=3, "test_r/test_image/RGB_manipulation_output.png"))
})

test_that('function output path is incorrect',{
  expect_error(RGB_manipulation("test_r/test_image/test_img_RGB_manipulation_input.png", R= 1, G=2, B=3, 1234))
})
