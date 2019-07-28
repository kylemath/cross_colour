
filename = uigetfile('*.jpg'); 
raw_image = importdata(filename);
im_gray = rgb2gray(raw_image);
im = cat(3,im_gray,im_gray,im_gray);


sat_increase = 1.2;

sat_image = rgb2hsv(raw_image);
sat_image(:,:,2) = sat_image(:,:,2) * sat_increase;
sat_image(sat_image > 1) = 1;
sat_image = ceil(hsv2rgb(sat_image)*256);


vert_size = size(im,1);
horz_size = size(im,2);

ndots =50000;
dot_size = 5;

for i_dot = 1:ndots
    i_vert = randi(vert_size-10);
    i_horz = randi(horz_size-10);
    im(i_vert:i_vert+dot_size,i_horz:i_horz+dot_size,:) = sat_image(i_vert:i_vert+dot_size,i_horz:i_horz+dot_size,:);
end


figure; image(im); axis image; axis off;