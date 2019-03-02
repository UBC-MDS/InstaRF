context("test-rgbmanipulation")

library(testthat)
library(png)
library(InstaRF)
library(testit)

# test input: colour image
test_img_RGB_manipulation_input <- array(c(c(12, 24, 48,
                                             12, 24, 48,
                                             12, 24, 48),   #R
                                            c(2, 6, 1,
                                              2, 6, 1,
                                              2, 6, 1),   #G
                                            c(51, 12, 24,
                                              51, 12, 24,
                                              51, 12, 24)),  #B
                                            dim = c(3,3,3))

writePNG(test_img_RGB_manipulation_input/255, "tests/test_img/test_img_RGB_manipulation_input.png")

# test output: RGB_manipulated image

test_img_RGB_manipulation_ex_output = array(c(c(36, 72, 144,
                                                36, 72, 144,
                                                36, 72, 144),  #R
                                              c(6, 18, 3,
                                                6, 18, 3,
                                                6, 18, 3),   #G
                                              c(153, 36, 72,
                                                153, 36, 72,
                                                153, 36, 72)),  #B
                                              dim = c(3,3,3))

writePNG(test_img_RGB_manipulation_ex_output/255, "tests/test_img/test_img_RGB_manipulation_ex_output.png")

# Check whether RGB_manipulation function is working properly

test_that('function is working properly',{
  RGB_manipulation("tests/test_img/test_img_RGB_manipulation_input.png", R= 3L, G=3L, B=3L, "tests/test_img/RGB_manipulation_output.png")
  RGB_manipulation_output <- readPNG("tests/test_img/RGB_manipulation_output.png") * 255
  expect_equal(RGB_manipulation_output, test_img_RGB_manipulation_ex_output, tolerance = 1e-5)
})

#Handling the exceptions with RGB_manipulation_filter()
# test_that('function input is the right type',{
#   expect_is(test_img_RBG_input_matrix, 'array')
# })
#
# test_that('function output is the right type',{
#   expect_is(test_img_RBG_output_matrix, 'array')
# })
#
# test_that('function input path is incorrect',{
#   expect_error(RGB_manipulation(1234, R= 1L, G=2L, B=3L, "test_img/RGB_manipulation_output.png"))
# })
#
# test_that('input type is incorrect',{
#   expect_error(RGB_manipulation("tests/test.txt", R= 1L, G=2L, B=3L, "test_img/RGB_manipulation_output.png"))
# })
#
# test_that('function input path is incorrect',{
#   expect_error(RGB_manipulation("./1234/123.png", R= 1L, G=2L, B=3L, "test_img/RGB_manipulation_output.png"))
# })
#
# test_that('function output path is incorrect',{
#   expect_error(RGB_manipulation("test_img/test_img_RGB_manipulation_input.png", R= 1L, G=2L, B=3L, 1234))
# })
