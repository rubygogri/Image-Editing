
%%%%%%%%%%%%%%%%

lena = double(imread('ash1.png'));
girl = double(imread('ash1.png'));

[Lh Lv] = imgrad(lena);  %Forward Horizontal and Vertical Difference
[Gh Gv] = imgrad(girl);

X = lena;
Fh = Lh;
Fv = Lv;

imshow(imread('ash1.png'));
[a,b]=ginput(2);
LX=round(a(1))     %(x1,y1) is the first co-ordinate
LY=round(b(1))
GX=round(a(2))     %(x2,y2) is the second co-ordinate
GY=round(b(2))

w = 57;
h = 55;
%LX = 23;
%LY = 25;
%GX = 89;
%GY = 101;

X(LY:LY+h,LX:LX+w,:) = girl(LY:LY+h,LX:LX+w,:);
Fh(LY:LY+h,LX:LX+w,:) = Gh(GY:GY+h,GX:GX+w,:);
Fv(LY:LY+h,LX:LX+w,:) = Gv(GY:GY+h,GX:GX+w,:);

msk = zeros(size(X));
msk(LY:LY+h,LX:LX+w,:) = 1;

imwrite(uint8(X),'C:\Users\rubyg\Desktop\X.png');

tic;
Y = PoissonJ( X, Fh, Fv, msk );
toc
imwrite(uint8(Y),'C:\Users\rubyg\Desktop\edited.png');

