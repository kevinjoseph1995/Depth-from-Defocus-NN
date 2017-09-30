function seg = imseg(img,Lseg,F)
% IMSEG Image Segmentation
%   SEG = IMSEG(IM,L,F) segments an image IM into square regions of
%   size LxL pixels starting from the top left. Remaining 
%   portions of IM, that are smaller than LxL will be discarded.
%   If F=1, the function will create figures for
%   visualization. If F=0, no figures are created.
%   The function returns SEG, a cell array containing the
%   image segments.
%   
%   Example:
%       im  = imread('football.jpg');
%       seg = imseg(im,64,1)

% By Nathir A. Rawashdeh, March 2007
% Visual Systems Lab., University of Kentucky


if F
    figure; imshow(img); axis on; title('Original Image')
    figure; % open a figure to fill with image segments 
end


% segment the image 'imaster'
L = size(img);
max_row = floor(L(1)/Lseg);
max_col = floor(L(2)/Lseg);
seg = cell(max_row,max_col);

r1 = 1; % current row index, initially 1
for row = 1:max_row
    
    c1 = 1; % current col index, initially 1
    for col = 1:max_col
        %disp(['--- row/col ' num2str(row) '/' num2str(col)])

        % find end rows/columns for segment
        r2 = r1+Lseg-1;
        c2 = c1+Lseg-1;

        % store segment in cell array
        seg(row,col) = {img(r1:r2,c1:c2,:)};
        
        if F
        % plot segment
        subplot(max_row,max_col,(row-1)*max_col+col)
        imshow(cell2mat(seg(row,col)))        
        end
        
        % increment col start index
        c1 = c2 +1;
    end
    
    % increment row start index
    r1 = r2 +1;
end
