# Detection_and_recognition_of_Indian_coins
Detecting and recognizing coins in an image using various image processing techniques. 

The proposed model implements image acquisition, segmentation, edge enhancement, edge detection, morphological image processing, object recognition sections.
In image acquisition, an image is to be collected for processing. During segmentation, the areas in image are divide into different portions. Morphological image processes like erosion, dilation are utilized to obtain clear edges by casting and taking out pixels. During recognition, through comparing radiuses image is recognized. 


A. Image Acquisition  
     This process is crucial to implementation of our model. The method for acquisition of coins is very restrictive and conditional.

B. Padding   
     The acquired images are first padded with boundary replication, to space the coins at suitable distance from the boundary to prevent the coins from touching the boundary during dilation.   

C. Image Conversion  
     The acquired RGB images are converted into grey scale to improve the image processing and reduce the time taken for processing of images.  

D. Image Enhancement  
     The grey scale image obtained is now enhanced for edge detection by Gaussian filters. The Gaussian filter is used to smoothen the image to detect only the prominent and required edges. The Gaussian filter suppresses the non-prominent edges and noise in the image to provide for proper and clear edge detection.    

E. Edge Detection  
     The enhanced gray scale image is then used to detect the edges of the coins using the canny edge detector algorithm. We first use the canny edge operator to determine the appropriate threshold value for the canny edge detection. Now using the obtained threshold, we use the canny edge detector to obtain the edges of the coins. The canny edge detection provides us with excellent results for edge detection after the application of the above Gaussian filter.  

F. Stray Object Removal  
     Any stray objects in the image obtained from edge detection is removed by using the bwareaopen function. This function removes any object lesser than the specified number of pixels. This removes any stray white dots or strips in the image and prepares it for morphological operations.  

G.  Dilation - Morphological Processing 
     The dilation process is now used to dilate the edges obtained in the above image for clear detection i.e., the edges become broader and any discontinuities in the image or shape of the object are completed by the process of dilation. We first create a structuring element of suitable size and shape for the process using the strel function. The structuring element is then imposed on the image obtained from edge detection, make the edges clear and completing any discontinuities in the image.   

H. Clearing The Border  
     This step is very important in the project though it may seem insignificant. In this step we remove anything on the border of the image or in connection with the border. This needs to be done to get a proper image only with required edges, as otherwise in the next when we perform a fill operation, there is a high probability of mistaking the border as the required edge and results in fill the entire image with white pixels, thus leading to the loss of the image.  

I. Filling The Holes  
     In this step we use the imfill operation to fill the holes i.e., coins with white pixels to obtain a clear image of the coins and make it easier for the detection of coins. This process fills any area inaccessible from the border of the image, thus filling the holes in the image.  

J. Erosion - Morphological Processing 
     The erosion process is used to make the coins round on the edges and remove any protruding stray pixels. This is done in the same way as dilation by creating a structuring element and imposing it on the image to obtain an eroded image. The image thus obtained is clear and rounded on the edges and ready for detection.  

K.  Circular Hough Transform  
     The circular Hough Transform function is used to identify bright circles in the images along with their centres and radii. This is implemented by using the imfindcircles function to detect the bright circles and return the centre's and radii of the bright circles. 

L. Highlighting The Coins  
     The radii and centre's obtained in the previous step are used to plot blue circles around the coins and highlight them, thus detecting the coins.  

M. Determining The Value of Coin   
     The radii of various coins obtained in the above process are used to recognize the value of the coins. Coins with different are compared and assigned the value they denote based on their radii.  

N. Computing The Total Value  
     The values of the coins determined in the previous step are used to calculate the total value of coins present in the image. This value is printed out in the command window in matlab. This completes the process of detecting and recognizing the coins and their value in an image. 
 
 
