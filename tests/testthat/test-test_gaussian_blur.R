# Feb 7th, 2019
# this script tests the function for gaussian_blur.py
# this function blurs an image using GaussianBlur
# Copy right: You may not use this file or copy the codes without noticing us.

# for the original program waiting to be tested
# input: image in matrix format
# output: a blured image in matrix format


context("test-test_gaussian_blur")

library(testthat)
library(png)
library(InstaRF)
library(spatialfil)



# the normal rbg image and its gaussian output
input_img <- readPNG("test_img/input_image.png")
output_img <- gaussian_blur("test_img/input_image.png", "test_img/function_output.png",sigma = 1)
expect_output_img <- readPNG("test_img/exp_output.png")

# to slove the float number difference problem, we calculate the average difference between each pixel.
rows <- dim(output_img)[1]
cols <- dim(output_img)[2]
diff <- 0
for(i in 1:rows){
  for(j in 1:cols){
    for(c in 1:3){
      diff <- diff + expect_output_img[i,j,c] - output_img[i,j,c]
    }
  }
}

diff <- diff/(rows*cols*3)

test_that('function working with RBG image',{
  expect_true(diff < 0.001)
})


# test the input type is correct for rbg image
test_that('function has right input type/class',{
  expect_is(input_img, 'array')
})

# test the function output type is correct for rbg image
test_that('function has right output type/class',{
  expect_is(output_img, 'array')
})
#
#
# test gaussian_blur's normal function on rbg
test_that('function working with RBG image',{
  expect_equivalent(dim(output_img), dim(expect_output_img))
})

# test gaussian_blur's normal function on rbg
test_that('function working with RBG image',{
  expect_equivalent(output_img, expect_output_img, tolerance = 1e-2)
})


#
# test how well function handle wrong input
test_that("function return error massage when the input type is wrong",{
  expect_error(gaussian_blur(123, "tests/test_img/wrong_input.png",sigma = 1))
})
#
test_that('function input path is incorrect',{
  expect_error(gaussian_blur("./1234/123.png", "tests/test_img/wrong_input.png",sigma = 1))
})
#
test_that('function output path is incorrect',{
  expect_error(gaussian_blur("tests/test_img/input_image.png", 123, sigma = 1))
})


