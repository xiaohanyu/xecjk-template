################################################################################
# A CMakeLists.txt file to compile latex files using cmake(http://www.cmake.org)
# You need to install UseLATEX.cmake(http://www.itk.org/Wiki/CMakeUserUseLATEX)
# To build latex pdf, you need an out-of-source build:
#     1, create a build dir in the dir contains CMakeLists.txt and tex files
#        : mkdir build
#     2, go into the build dir
#        : cd build
#     3, building now
#        : cmake .. && make 
################################################################################
project(main)
cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH ${CMAKE_ROOT}/Modules)
message("CMAKE ROOT is ${CMAKE_ROOT}")
message("CMAKE MODULE PATH is ${CMAKE_MODULE_PATH}")
include(${CMAKE_MODULE_PATH}/UseLATEX.cmake)

set(PDFLATEX_COMPILER xelatex)

set(INPUTS_TEX_FILES
   data/appendix.tex
   data/bib.tex
   data/content.tex
   data/en_preamble.tex
   data/title.tex
   data/xecjk_preamble.tex
)

ADD_LATEX_DOCUMENT(main.tex
   INPUTS ${INPUTS_TEX_FILES}
   IMAGE_DIRS images
   DEFAULT_PDF
)

