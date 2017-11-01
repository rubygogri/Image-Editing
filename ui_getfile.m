
function fname =ui_getfile(hObject,eventdata)
    global I2;
    fname=uigetfile;
 %   fname='ash.jpg';
    gray = imread(fname);
    [x,y,z]=size(gray)
    if x>y
       i=142;
       j=113;
    elseif y>x
        i=113;
        j=142;
    else 
        i=123;
        j=123;
    end
        
    I2=imresize(gray, [i j]);

    h=uicontrol('style','pushbutton',...
            'units','pixels',...
            'position',[20 150 i+10 j+10],...
            'cdata',I2);
end
