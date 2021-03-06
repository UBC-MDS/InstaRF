# InstaRF Proposal

<img src="tests/testthat/test_img/logo.png" align="right" border = "5" width="275" height="200"/>

[![Build Status](https://travis-ci.org/UBC-MDS/InstaRF.svg?branch=master)](https://travis-ci.org/UBC-MDS/InstaRF)

## Contributors:

Betty Zhou     
Linyang Yu    
Reza Bagheri    
Simon Chiu    

## Overview

Image processing uses computer algorithms to enhance an image or to extract useful information from it. In this package, we have implemented some R functions for image processing. These functions perform Gaussian blurring, Laplacian edge detection, and color changing.

## Functions

1. **Gaussian Blur**    
   This function performs convolution to de-emphasize differences in adjacent pixel values with a Gaussian distribution. The blurring effect removes detail and noise in the input image.
2. **Laplacian Edge Detecting**    
   This function performs convolution to emphasize differences in adjacent pixel values. The function detects edges by sharpening/highlighting the edges of an image.
3. **RBG Manipulation**    
   This function adjusts the red, blue and green intensity of an image by applying different weights for each RBG channel. This is similar to a colour filter in Instagram.

## R Ecosystem

 It is important to note that are several packages that have similar image processing functionality. For example, [InstaR]( https://github.com/UBC-MDS/InstaR/tree/v4.0) is a R package that contains the three functions: blur, flip and greyscale to transform images. Or a similar package called [magick](https://cran.r-project.org/web/packages/magick/index.html) exists which has some image processing filters like blur, crop and trim.  In this project, we plan to implement three more image processing functions in R by exploring additional filters.

## Repo structure:

#### InstaRF
  * R: [R](R/) folder contains all of our functions:
    * gaussian_blur.R
    * laplacian_filter.R
    * RGB_manipulation.R
  * Testing Units Design: [test_r](test_r/)
    * Contains images for testing: [test_image](test_r/test_image/)
    * Testing units for Gaussian Blurring: [test_gaussian_blur.R](test_r/test_gaussian_blur.R)
    * Testing units for Laplacian edge: [test_Laplacian_edge_detecting.R](test_r/test_Laplacian_edge_detecting.R)
    * Testing units for RGB channel: [test_RGB_manipulation.R](test_r/test_RGB_manipulation.R)
  * [CONTRIBUTING.md](CONTRIBUTING.md)
  * [Code_of_CONDUCT.md](Code_of_CONDUCT.md)
  * [LICENSE](LICENSE)
  * README.md


## Installation

Installing InstaRF is easy with only the following two steps:

1. Open your R studio
2. Enter ```devtools::install_github("UBC-MDS/InstaRF", build_opts = c("--no-resave-data", "--no-manual"))``` to console.

To build vignettes:

1. `devtools::install_github("UBC-MDS/InstaRF", build_opts = c("--no-resave-data", "--no-manual"))`
2. `browseVignettes(package ='InstaRF')`


## Usage

```library(InstaRF)```


## Functions

#### 1. Gaussian Blur
```gaussian_blur(input_image_path, output_image_path, sigma = 1)```

Arguments:

* ```input_image_path```: Path to the input image
* ```output_image_path```: Path to the output image
* ```filter_shape```: Size of the filter
* ```sigma```: Standard diviation of the gaussian distribution (higher sigma size allows stronger blurring)

Example:

```gaussian_blur("tests/testthat/test_img/carnovsky_RGB_1.png", "tests/testthat/test_img/test.png", sigma = 1)```

Before:

<img src="tests/testthat/test_img/input_image.png" border = "5" width="350" height="157"/>

After:

<img src="tests/testthat/test_img/exp_output.png" border = "5" width="350" height="157"/>

#### 2. RGB manipulation
```RGB_manipulation(input_path, output_path, R = 2, G = 2, B = 2)```

Arguments:

* ```input_path```: Path to the input image
* ```output_path```: Path to the output image
* ```R```: Adjusting intensity for red channel (integer)
* ```B```: Adjusting intensity for blue channel (integer)
* ```G```: Adjusting intensity for green channel (integer)

Example:
```RGB_manipulation(""tests/testthat/test_img/carnovsky_RGB_1.png", "tests/testthat/test_img/Carnovsky_RGB_manipulated.png", R = 1, G = 1, B = 5)```

Before:

<img src="tests/testthat/test_img/input_image.png" border = "5" width="350" height="157"/>

After:

<img src="tests/testthat/test_img/Carnovsky_RGB_manipulated.png" border = "5" width="350" height="157"/>


#### 3. Laplacian Edge Detecting
```laplacian_edge_detecting(input_image,  output_image)```

Arguments:

* ```input_path```: Path to the input image
* ```output_path```: Path to the output image

Example:

```laplacian_filter("tests/testthat/test_img/test_img_laplacian_bird_before.png", "tests/testthat/test_img/test_img_laplacian_bird_after.png")```

Before:

<img src="tests/testthat/test_img/test_img_laplacian_bird_before.png" border = "5" width="199" height="253"/>

After:

<img src="tests/testthat/test_img/test_img_laplacian_bird_after.png" border = "5" width="199" height="253"/>

## Branch coverage

The package passed all the tests that were planned before.

It had 100% branch coverage:

<img src="tests/testthat/test_img/InstaRF_covr.png" border = "5" width="500" height="200"/>

The functions passed all the tests:

<img src="tests/testthat/test_img/Test_pass_results.png" border = "5" width="460" height="200"/>

and R cmd test was also passed:

<img src="tests/testthat/test_img/CMD_check_results.png" border = "5" width="500" height="200"/>

## Unit tests results

In the root of the repository, input `devtool::test()` or `devtool::check()`, the former will generate the test units reports and the later will give you a full report of the package.

Results for `devtool::test()`

<img src="tests/testthat/test_img/test_result.png" border = "5" width="500" height="200"/>

## Package dependencies
||||
|---|---|---|
|testthat|png|spatialfil|
