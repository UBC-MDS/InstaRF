# Copyright 2018 Betty Zhou
# This script contains tests for the RGB_manipulation function

# input: image in .png format, weights for adjusting R,G,B
# output: a RGB manipulated image in .png format in the output path

library(testthat)
library(png)
library(InstaRF)
library(testit)

# test input: colour image
test_img_RGB_manipulation_input <- array(c(c(12, 24, 48,
                                      48, 96, 192,
                                      72, 144, 255),   #R
                                      c(2, 6, 0,
                                        12, 24, 6,
                                        18, 38, 8),   #G
                                      c(51, 12, 24,
                                        213, 51, 105,
                                        255, 78, 159)),  #B
                                 dim = c(3,3,3))

writePNG(test_img_RGB_manipulation_input, "tests/test_img/test_img_RGB_manipulation_input.png")
test_img_RBG_input_matrix <- readPNG("tests/test_img/test_img_RGB_manipulation_input.png")

# test output: RGB_manipulated image

test_img_RGB_manipulation_ex_output = array(c(c(18, 72, 108,
                                         36, 144, 216,
                                         9, 36, 54),   #R
                                       c(2, 6, 0,
                                         12, 24, 6,
                                         18, 38, 8),   #G
                                       c(51, 12, 24,
                                         213, 51, 105,
                                         255, 78, 159)),  #B
                                     dim = c(3,3,3))

writePNG(test_img_RGB_manipulation_ex_output, "tests/test_img/test_img_RGB_manipulation_ex_output.png")
test_img_RBG_output_matrix <- readPNG("tests/test_img/test_img_RGB_manipulation_ex_output.png")

# Check whether RGB_manipulation function is working properly

RGB_manipulation_output <- RGB_manipulation("tests/test_img/test_img_RGB_manipulation_input.png", R= 1L, G=2L, B=3L, "tests/test_img/RGB_manipulation_output.png")

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
  expect_error(RGB_manipulation(1234, R= 1, G=2, B=3, "tests/test_img/RGB_manipulation_output.png"))
})

test_that('input type is incorrect',{
  expect_error(RGB_manipulation("tests/test.txt", R= 1, G=2, B=3, "tests/test_img/RGB_manipulation_output.png"))
})

test_that('function input path is incorrect',{
  expect_error(RGB_manipulation("./1234/123.png", R= 1, G=2, B=3, "tests/test_img/RGB_manipulation_output.png"))
})

test_that('function output path is incorrect',{
  expect_error(RGB_manipulation("tests/test_img/test_img_RGB_manipulation_input.png", R= 1, G=2, B=3, 1234))
})
