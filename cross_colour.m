
filename = uigetfile('*.jpg'); 
raw_image = importdata(filename);
im_gray = rgb2gray(raw_image);
im = cat(3,im_gray,im_gray,im_gray);


sat_increase = 1.2;

sat_image = rgb2hsv(raw_image);
sat_image(:,:,2) = sat_image(:,:,2) * sat_increase;
sat_image(sat_image > 1) = 1;
sat_image = ceil(hsv2rgb(sat_image)*256);


grid_size = 50;
grid_width = 5;

vert_size = size(im,1);
horz_size = size(im,2);
for i_vert = grid_size:grid_size:vert_size
    im(i_vert:i_vert+grid_width,:,:) = sat_image(i_vert:i_vert+grid_width,:,:);
end

for i_horz = grid_size:grid_size:horz_size
    im(:,i_horz:i_horz+grid_width,:) = sat_image(:,i_horz:i_horz+grid_width,:);
end

figure; image(im); axis image; axis off;