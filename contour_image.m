function fname =bw_image(hObject,eventdata)
    global I2;
    [x,y,z]=size(I2);
    if z~=1
        %I=im2bw(I);
        I2=I2(1:x,1:y);
    end
    
    colormap(jet); imcontour(I2,100); pause(4);  
    colormap(winter); imcontour(I2,30);  

end