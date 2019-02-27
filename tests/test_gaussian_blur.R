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
library(spatstat)
library(spatialfil)


# the normal rbg image and its gaussian output
input_img <- readPNG("tests/test_img/input_image.png")
output_img <- gaussian_blur("tests/test_img/input_image.png", "tests/test_img/function_output.png",sigma = 1)
expect_output_img <- readPNG("tests/test_img/exp_output.png")


# test the input type is correct for rbg image
test_that('function has right input type/class',{
  expect_is(input_img, 'array')
})

# test the function output type is correct for rbg image
test_that('function has right output type/class',{
  expect_is(output_img, 'array')
})


# test gaussian_blur's normal function on rbg
test_that('function working with RBG image',{
  expect_equivalent(dim(output_img), dim(expect_output_img))
})


# test how well function handle wrong input
test_that("function return error massage when the input is wrong",{
  expect_that(gaussian_blur("This is not a image matrix", "test_img/wrong_input.png",sigma = 1), ("wrong input type"))
})

