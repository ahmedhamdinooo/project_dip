function varargout = point(varargin)
% POINT MATLAB code for point.fig
%      POINT, by itself, creates a new POINT or raises the existing
%      singleton*.
%
%      H = POINT returns the handle to a new POINT or the handle to
%      the existing singleton*.
%
%      POINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POINT.M with the given input arguments.
%
%      POINT('Property','Value',...) creates a new POINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before point_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to point_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help point

% Last Modified by GUIDE v2.5 05-May-2023 16:21:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @point_OpeningFcn, ...
                   'gui_OutputFcn',  @point_OutputFcn, ...
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


% --- Executes just before point is made visible.
function point_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to point (see VARARGIN)

% Choose default command line output for point
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes point wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = point_OutputFcn(hObject, eventdata, handles) 
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
close
project;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)% negative
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = handles.foto;
L = 2 ^ 8;                   
neg = (L - 1) - im;

axes(handles.axes2);
imshow(neg);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
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

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)%log transform 
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = handles.foto;

%im=rgb2gray(im);
double_value = im2double(im);
num=str2double(get(handles.edit1,'string'));

num=double(num);
out1= num.*log(1+double_value);

axes(handles.axes2);
imshow(out1);

set(handles.edit1,'string','');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)% power law transform
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = handles.foto;
c=1;
%im=rgb2gray(im);
double_value = im2double(im);
m=str2double(get(handles.edit1,'string'));

out1= c*(double_value.^m); 

axes(handles.axes2);
imshow(out1);
set(handles.edit1,'string','');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
sclicing;

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)% bit plane 
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = handles.foto;

%im = rgb2gray(im);
[rows, cols] = size(im);
newImage = zeros(rows, cols, 8);
knum_str = get(handles.edit1, 'string');
knum = str2double(knum_str);
if isnan(knum)
    % Handle the error here, for example by setting a default value
    knum = 1;
end

for k = 1:8
     for row_index = 1:rows
        for col_index = 1:cols
            newImage(row_index, col_index, k) = bitget(im(row_index, col_index), k);
        end
     end     
end

set(handles.edit1, 'string', '');
axes(handles.axes2);
imshow(newImage(:,:,knum));


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close
gcontrast;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)% threshold
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = handles.foto;
threshold = str2double(get(handles.edit1,'string'));

[m, n] = size(im);

Ithres = zeros(m, n);

for i = 1:m
    for j = 1:n
        if im(i,j) > threshold
            Ithres(i,j) = 1;
        else
            Ithres(i,j) = 0;
        end
    end
end

set(handles.edit1, 'string', '');
axes(handles.axes2);
imshow(Ithres);



% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
reset=handles.reset;
handles.foto=reset;
guidata(hObject, handles);
axes(handles.axes2); 
imshow(reset);
