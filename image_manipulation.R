#https://cran.r-project.org/web/packages/magick/vignettes/intro.html
#https://cran.r-project.org/web/packages/magick/magick.pdf 

library(tesseract)
library(magick)
library(magrittr)
library(imager)

file <- system.file('myCar_plate.png',package='imager')

im <- load.image('myCar_plate.png')


img_text <- im %>% image_ocr()


im.blurry <- isoblur(im,10)


img <- grayscale(im, method = "Luma", drop = TRUE)









#img <- image_read("textoverimageexample_g.png")
print(img)


img <- image_read("myCar_plate.png")
#img <- image_convert(im, type = 'grayscale')

#img <- image_channel(im, channel='hue')
print(img)


img <- img %>% image_resize("100")
#img <- img %>% image_convert(channel_types() = 'YellowChannel') 
#img <- image_trim()

print(img)

img <- image_contrast(img, sharpen = 100)
print(img)




#------------------------
# bit that works
img <- image_read("myCar_plate_2.png")
img <- image_scale(img, "600") 



print(img)
img_text <- img %>% image_ocr()

print(img_text)
cat(img_text)

substr(img_text, 1, 4)

reg_no <- c('51', '02', '52', '03', '53', '04', '54', '05', '55', '06', '56', 
            '07', '57', '08', '58', '09', '59', '10', '60', '11', '61', '12', 
            '62', '13', '63', '14', '64', '15', '65', '16', '66', '17', '67', 
            '18', '68')

year <- c('2001', '2002', '2002', '2003', '2003', '2004', '2004', '2005',
          '2005', '2006', '2006', '2007', '2007', '2008', '2008', '2009', 
          '2009', '2010', '2010', '2011', '2011', '2012', '2012', '2013', 
          '2013', '2014', '2014', '2015', '2015', '2016', '2016', '2017', 
          '2017', '2018', '2018')

car_reg_year <- data.frame(reg_no, year)


my_reg_no <- substr(img_text, 3, 4)
my_car_year <- car_reg_year[car_reg_year['reg_no']==my_reg_no][2]

print(my_car_year)

#---------------------------------