Irgb = imread('P2.bmp');
Igray = rgb2gray(Irgb);
Ibw = im2bw(Igray,graythresh(Igray));
Ifill = imfill(Ibw,'holes');
B = bwboundaries(Ifill);
stat = regionprops(Ifill,'Centroid');
%figure;imshow(~Ibw); hold on
for k = 1 : length(B)
    b = B{k};
    c = stat(k).Centroid;
    plot(b(:,2),b(:,1),'g','linewidth',2);
    text(c(1),c(2),num2str(k),'backgroundcolor','g');
end

%I = imread('rice.png');
%I = imread('ima1.jpg');
[a,b,c] = size(Irgb)
I = Irgb(1:a,1:b);
BW = imbinarize(I);
%imshow(BW);
[B,L] = bwboundaries(BW,'noholes');
%figure,
imshow(label2rgb(L, @jet, [.35 .25 .05]))
hold on
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end


%BW = imread('blobs.png');
%Display parent boundaries in red and their holes in green.

%[B,L,N,A] = bwboundaries(BW);
[B,L,N,A] = bwboundaries(BW);
figure; imshow(BW); hold on;
% Loop through object boundaries
for k = 1:N
    % Boundary k is the parent of a hole if the k-th column
    % of the adjacency matrix A contains a non-zero element
    if (nnz(A(:,k)) > 0)
        boundary = B{k};
        plot(boundary(:,2),...
            boundary(:,1),'r','LineWidth',2);
        % Loop through the children of boundary k
        for l = find(A(:,k))'
            boundary = B{l};
            plot(boundary(:,2),...
                boundary(:,1),'g','LineWidth',2);
        end
    end
end

for k = 1:N
    % Boundary k is the parent of a hole if the k-th column
    % of the adjacency matrix A contains a non-zero element
    if (nnz(A(:,k)) > 0)
        boundary = L{k};
        plot(boundary(:,2),...
            boundary(:,1),'blue','LineWidth',2);
        % Loop through the children of boundary k
        for l = find(A(:,k))'
            boundary = B{l};
            plot(boundary(:,2),...
                boundary(:,1),'g','LineWidth',2);
        end
    end
end