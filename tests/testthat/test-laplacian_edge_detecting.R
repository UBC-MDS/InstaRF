context("test-laplacian_edge_detecting")

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

test_img_laplacian_input <- readPNG("test_img/test_img_laplacian_input.png")
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

test_img_laplacian_output <- laplacian_filter("test_img/test_img_laplacian_input.png", "test_img/test_img_laplacian_output.png")

# Check whether laplacian_filter function is working properly
test_that('output match expectation',{
  expect_equivalent(test_img_laplacian_output, test_img_laplacian_ex_output)
})

#Handling the exceptions with laplacian_filter()
test_that('function input is the right type',{
  expect_is(test_img_laplacian_input, 'array')
})

test_that('function output is the right type',{
  expect_is(test_img_laplacian_output, 'array')
})

test_that('function input path is incorrect',{
  expect_error(laplacian_filter(1234, "test_img/test_img_laplacian_output.png"))
})

test_that('input type is incorrect',{
  expect_error(laplacian_filter("test_img/test.txt", "test_img/test_img_laplacian_output.png"))
})

test_that('function input path is incorrect',{
  expect_error(laplacian_filter("./1234/123.png", "test_img/test_img_laplacian_output.png"))
})

test_that('function output path is incorrect',{
  expect_error(laplacian_filter("test_img/test_img_laplacian_input.png", 1234))
})
