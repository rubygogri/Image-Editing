
clear;clc;
global fname;

ssPos = get(0,'ScreenSize');
fs = [ssPos(3:4)/4 ssPos(3:4)/2]; %centre & quater of a screen
set(0, 'DefaultFigurePosition', fs);

display.figHandle = figure('Name','Image Processing','NumberTitle','off'); 
%set(display.figHandle,'Position',ssPos+100*[0 .5 -1 -1]);
set(display.figHandle,'Color',[.9 .8 .5]);

handle1 = uicontrol('Style', 'pushbutton', 'String', 'Select Image', ...
'Position', [535, 320, 100, 30], ...
'Callback', @ui_getfile);

handle1 = uicontrol('Style', 'pushbutton', 'String', 'Binary Image', ...
'Position', [535, 280, 100, 30], ...
'Callback', @bw_image);

handle1 = uicontrol('Style', 'pushbutton', 'String', 'Contour Image', ...
'Position', [535, 240, 100, 30], ...
'Callback', @contour_image);

handle1 = uicontrol('Style', 'pushbutton', 'String', 'Edited Images', ...
'Position', [535, 200, 100, 30], ...
'Callback', @ImageEditing);
