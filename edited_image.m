%clear;clc;
function fname =edited_image(hObject,eventdata)
Irgb = imread('ash1.png');
%Irgb = imread('ima1.jpg');
%Irgb = imread('moon.tif');
%Irgb = imread('lena.tif');
%Irgb = imread('PC.jpg');
[x,y,z]=size(Irgb);
x1=x/4;
y1=y/4;
if z~=1
    Igray = rgb2gray(Irgb);
    Ibw = im2bw(Igray,graythresh(Igray));
else
    Ibw = im2bw(Irgb,graythresh(Irgb));
end

Ifill = imfill(Ibw,'holes');
B = bwboundaries(Ifill);
%stat = regionprops(Ifill,'Centroid');
figure;imshow(~Ibw); hold on
%%%%%%%%%%%%%%%%%%add a breakpoint

for k = 1 : length(B)
    b = B{k};
 %   c = stat(k).Centroid;
    plot(b(:,2),b(:,1),'o','linewidth',0.5);
    plot(b(:,2)+1.5,b(:,1)+1.5,'y--o')
    plot(b(:,2)+2.5,b(:,1)+2.5,'p','linewidth',0.5);
    plot(b(:,2)+3.5,b(:,1)+3.5,'b','linewidth',1);
    plot(b(:,2)+4.5,b(:,1)+4.5,'y--o');
    plot(b(:,2)+6,b(:,1)+6,'p','linewidth',0.5);
    plot(b(:,2)+7,b(:,1)+7,'b','linewidth',1);
   % text(c(1),c(2),num2str(k),'backgroundcolor','g');
end

[a,b,c] = size(Irgb);
I = Irgb(1:a,1:b);
BW = imbinarize(I);
%%%%%%%%%%figure; imshow(BW); hold on
[B,L] = bwboundaries(BW,'noholes');
mask=label2rgb(L, @jet, [.35 .25 .05]);
%%%%%%%%%%figure, imshow(mask);

%mask1 = imerode(mask,strel('disk',3));
%mask1=imresize(mask1,[50,50]);
%mask1=imresize(mask1,[150,150]);
pause(4), imshow(mask); 

%for i = 1:x
%    hold on;
%    x2 = i + 1.5;
%    y2 = 1:1:y;
%    plot(x2, y2, 'r+');
%end

%mask = imerode(mask,strel('disk',3));
%figure, imshow(mask); hold on;
halfI = zeros(x,y);
x = 1:size(halfI,2);
y = 1:size(halfI,1);
[x y]=meshgrid(x,y);
Ang = flipud(atand(y./x));
imagesc(Ang),colormap(winter(50)),axis equal , axis tight;
%imagesc(Ang),colormap(parula(50)),axis equal , axis tight
%colormap(summer), winter, warm, hot, cool, yellow, gray, jet,parula(50)

%mask = imerode(mask,strel('disk',3));
%%%%%%%%%%figure, imshow(mask);
hold on;

%for k = 1:length(B)
%   boundary = B{k};
%   plot(boundary(:,2), boundary(:,1), 'black', 'LineWidth', 2);
%end

%Display parent boundaries in red and their holes in green.
[B,L,N,A] = bwboundaries(BW);

% Loop through object boundaries
for k = 1:N
    % Boundary k is the parent of a hole if the k-th column
    % of the adjacency matrix A contains a non-zero element
    if (nnz(A(:,k)) > 0)
        boundary = B{k};
        plot(boundary(:,2),...
            boundary(:,1),'black','LineWidth',2);
        % Loop through the children of boundary k
        for l = find(A(:,k))'
            boundary = B{l};
            plot(boundary(:,2),...
                boundary(:,1),'black','LineWidth',2);
        end
    end
end

for k = 1:N
    % Boundary k is the parent of a hole if the k-th column
    % of the adjacency matrix A contains a non-zero element
    if (nnz(A(:,k)) > 0)
        plot(boundary(:,2),...
            boundary(:,1),'blue','LineWidth',2);
        % Loop through the children of boundary k
        for l = find(A(:,k))'
            boundary = B{l};
            plot(boundary(:,2),...
                boundary(:,1),'black','LineWidth',2);
        end
    end
end
%close(gcf);

end