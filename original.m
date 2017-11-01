%https://www.mathworks.com/help/images/ref/bwboundaries.html
I = imread('rice.png');
%Convert grayscale image to binary image using local adaptive thresholding.

BW = imbinarize(I);
%Calculate boundaries of regions in image and overlay the boundaries on the image.

[B,L] = bwboundaries(BW,'noholes');
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BW = imread('blobs.png');
Display parent boundaries in red and their holes in green.

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