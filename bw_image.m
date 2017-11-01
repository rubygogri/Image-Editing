
function fname =bw_image(hObject,eventdata)
    global I2;
    Igray = rgb2gray(I2);
    imshow(Igray);
end
