function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 05-May-2023 15:42:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im = imread(path);
%im=rgb2gray(im);
axes(handles.axes1);
handles.foto=im;
guidata(hObject, handles);
handles.reset=im;
guidata(hObject, handles);
imshow(im);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)%avg
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = handles.foto;

num=str2double(get(handles.edit7,'string'));
[rows,cols]=size(im);
out=im;
for i=2:rows-1
 for j=2:cols-1
     temp = [im(i-1, j-1) im(i-1, j) im(i-1, j + 1) im(i, j-1) im(i, j) im(i, j + 1) im(i + 1, j-1) im(i + 1, j) im(i + 1, j + 1)];
    
     ave=sum(temp)/num;
     out(i, j)= ave;
end
end
set(handles.edit7,'string','');
axes(handles.axes9);
imshow(out);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)%median
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = handles.foto;

[rows,cols]=size(im);
out=im;

for i=2:rows-1
 for j=2:cols-1
     temp = [im(i-1, j-1) im(i-1, j) im(i-1, j + 1) im(i, j-1) im(i, j) im(i, j + 1) im(i + 1, j-1) im(i + 1, j) im(i + 1, j + 1)];
     temp = sort(temp);
     out(i, j)= temp(5);
end
end
axes(handles.axes9);
imshow(out);


% % % --- Executes on button press in pushbutton5.
% % % function pushbutton5_Callback(hObject, eventdata, handles)
% % % hObject    handle to pushbutton5 (see GCBO)
% % % eventdata  reserved - to be defined in a future version of MATLAB
% % % handles    structure with handles and user data (see GUIDATA)
% % % global a
% % % a=imread('dog.jpeg')
% % % axes(handles.axes5);
% % % imshow(a)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)%subsample
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = handles.foto;
%im=rgb2gray(im);

sample_factor=str2double(get(handles.subsample,'string'));

[r,c]=size(im);
new_image=im(1:sample_factor:r,1:sample_factor:c);

set(handles.subsample,'string','');
axes(handles.axes9);
imshow(new_image);


% --- Executes on button press in pushbutton7.


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close
multi;



function subsample_Callback(hObject, eventdata, handles)
% hObject    handle to subsample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subsample as text
%        str2double(get(hObject,'String')) returns contents of subsample as a double


% --- Executes during object creation, after setting all properties.
function subsample_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subsample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;
g2;


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)%sharp image
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = handles.foto;

im = double(im);
[rows,cols]=size(im);

mask = [0,-1,0;
        -1,5,-1;
        0,-1,0];
    
out = im;
for i=2:rows-1
 for j=2:cols-1
     
     temp = mask.*im(i-1:i+1,j-1:j+1);
     value = sum(temp(:));
     out(i, j)= value;
end 
end

out = uint8(out);
axes(handles.axes9);
imshow(out);

% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)%resample up
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = handles.foto;
%im=rgb2gray(im);
im=im(1:6:end,1:6:end);
factor=str2double(get(handles.edit8,'string'));
[r c]=size(im);
new_r=r*factor;
new_c=c*factor;
s_r=1;


for i=1:factor:new_r
    s_c=1;
    for g=1:factor:new_c
        y(i:i+factor-1,g:g+factor-1)=im(s_r,s_c);
        s_c=s_c+1;
    end
    s_r=s_r+1;
end
set(handles.edit8,'string','');
axes(handles.axes9);
imshow(y);

% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
project;

function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)% edge detection(Sobel operator)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = handles.foto;
im = double(im);
[rows,cols]=size(im);

mask = [-1 0 1;
        -2 0 2;
        -1 0 1];
out = im;
for i=2:rows-1
 for j=2:cols-1
     temp = mask.*im(i-1:i+1,j-1:j+1);
     value = sum(temp(:));
     out(i, j)= value;
end
end
out = uint8(out);
axes(handles.axes9);
imshow(out);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton6.
function pushbutton6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
reset=handles.reset;
handles.foto=reset;
guidata(hObject, handles);
axes(handles.axes9); 
imshow(reset);
