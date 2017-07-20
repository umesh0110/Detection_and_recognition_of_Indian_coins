clc;
clear all;
close all;
%image acquistion
orgn=imread('U:\course page\IMG proj\img\3.jpg'); 
% padding
orgn=padarray(orgn,[10 10],'replicate'); 
gry=rgb2gray(orgn);
figure;
imshow(gry);
title('GRAY IMAGE');
%preparing filter
gflt = fspecial('gaussian',[5 5],2);
% applying filter
fltimg = imfilter(gry,gflt,'same');
figure;
imshow(fltimg);
title('AFTER GAUSSIAN FILTER');
% Edge detection
[~, threshold] = edge(fltimg, 'canny');
fudge = 1.5;
edgimg = edge(fltimg, 'canny', threshold * fudge);
figure;
imshow(edgimg);
title('CANNY DETECTION');
% Remove small stray objects
remsmall = bwareaopen(edgimg,100);
figure; 
imshow(remsmall);
title('REMOVAL STRAY PIXELS');

strct = strel('square',8);
dltd = imdilate(remsmall, strct);
figure;
imshow(dltd);
title('DILATED IMAGE');
% Boder removal
brdrclr = imclearborder(dltd, 8);
figure;
imshow(brdrclr);
title('CLEARED BORDER IMAGE');

nostray = bwareaopen(brdrclr,200);
figure;
imshow(nostray);
title('ERODED IMAGE');

filled = imfill(nostray,'holes');
figure;
imshow(filled);
title('HOLES FILLED');

% image eroded to make a clear cut between objects
struct2 = strel('square',5);
erdimg = imerode(filled,struct2);
figure;
imshow(erdimg);
title('ERODED IMAGE');

nostray = bwareaopen(erdimg,200);
figure;
imshow(nostray);
title('ERODE IMAGE');

figure;
imshow(orgn);
hold on;
[cntrs,rad,metric]=imfindcircles(nostray,[240 360],'sensitivity',0.9)
viscircles(cntrs, rad,'EdgeColor','b');

val=0;
k=orgn;
a=size(rad);
 for i=1:a
    
%     if(rad(i)>65)&&(rad(i)<73)
%     val=val+5;
%     k=insertText(k,[cntrs(i,1) cntrs(i,2)],'5','FontSize',20);
%  
% end
% if(rad(i)>75)&&(rad(i)<83)
%     val=val+10;
%     k=insertText(k,[cntrs(i,1) cntrs(i,2)],'10','FontSize',20);
% end;
% if(rad(i)>85)&&(rad(i)<92)
%      val=val+25;
%      k=insertText(k,[cntrs(i,1) cntrs(i,2)],'25','FontSize',20);
%     
% end;
% 
% if(rad(i)>95)&&(rad(i)<103)
%      val=val+50;
%      k=insertText(k,[cntrs(i,1) cntrs(i,2)],'50','FontSize',20);
%     
% end;
% 
% if(rad(i)>104)&&(rad(i)<115)
%      val=val+1;
%      k=insertText(k,[cntrs(i,1) cntrs(i,2)],'1','FontSize',20);
%     
% end;


if(rad(i)>250)&&(rad(i)<277)
    val=val+1;
    k=insertText(k,[cntrs(i,1) cntrs(i,2)],'1','FontSize',70);
 
end
if(rad(i)>278)&&(rad(i)<295)
   val=val+5;
    k=insertText(k,[cntrs(i,1) cntrs(i,2)],'5','FontSize',70);
end;
if(rad(i)>300)&&(rad(i)<315)
     val=val+1;
     k=insertText(k,[cntrs(i,1) cntrs(i,2)],'1','FontSize',70);
    
end;

if(rad(i)>316)&&(rad(i)<360)
     val=val+2;
     k=insertText(k,[cntrs(i,1) cntrs(i,2)],'2','FontSize',70);
    
end;

%    if(rad(i)>55)&&(rad(i)<59)
%    val=5;
%     k=insertText(img,[cntrs(i,1) cntrs(i,2)],'5');
%     imshow(k);
% end
% if(rad(i)>66)&&(rad(i)<68)
%     val=2;
%     k=insertText(img,[cntrs(i,1) cntrs(i,2)],'2');
%     imshow(k);
% end;
% if(rad(i)>68)&&(rad(i)<70)
%     val=1;
%      k=insertText(img,[cntrs(i,1) cntrs(i,2)],'1');
%    imshow(k);
% end;

 
 end

fprintf('The value of the coins in image = %i',val);
figure;
imshow(k)
title('VALUE')