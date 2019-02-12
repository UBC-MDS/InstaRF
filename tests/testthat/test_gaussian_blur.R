# Feb 7th, 2019
# this script tests the function for gaussian_blur.py
# this function blurs an image using GaussianBlur
# Copy right: You may not use this file or copy the codes without noticing us.

# for the original program waiting to be tested
# input: image in matrix format
# output: a blured image in matrix format

library(testthat)
library(png)
library(InstaRF)
# the normal rbg image and its gaussian output
input_img_1 <- readPNG("test_r/test_image/milad_cropped.png")
output_img_1 <- gaussian_blur(input_img_1, sigma = 1)
expect_output_img_1 <- readPNG("test_r/test_image/milad_gaussian.png")

# the normal grayscale image and its gaussian output
input_img_2 <- readPNG("test_r/test_image/milad_gray.png")
output_img_2 <- gaussian_blur(input_img_2, sigma = 1)
expect_output_img_2 <- readPNG("test_r/test_image/milad_gray_gaussian.png")



# test the input type is correct for rbg image
test_that('function has right input type/class',{
  expect_is(input_img_1, 'matrix')
})

# test the function output type is correct for rbg image
test_that('function has right output type/class',{
  expect_is(output_img_1, 'matrix')
})

# test the input type is correct for grayscale image
test_that('function has right input type/class',{
  expect_is(input_img_2, 'matrix')
})

# test the function output type is correct for grayscale image
test_that('function has right output type/class',{
  expect_is(output_img_2, 'matrix')
})

# test gaussian_blur's normal function on rbg
test_that('function working with RBG image',{
  expect_equivalent(output_img_1, expect_output_img_1)
})

# test gaussian_blur's normal function on grayscale
test_that('function working with grayscale image',{
  expect_equivalent(output_img_2, expect_output_img_2)
})

# test how well function handle wrong input
test_that("function return error massage when the input is wrong",{
  expect_that(gaussian_blur("This is not a image matrix", sigma = 1), print_text("wrong input type"))
})

