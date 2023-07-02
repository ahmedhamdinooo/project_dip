function varargout = freq(varargin)
% FREQ MATLAB code for freq.fig
%      FREQ, by itself, creates a new FREQ or raises the existing
%      singleton*.
%
%      H = FREQ returns the handle to a new FREQ or the handle to
%      the existing singleton*.
%
%      FREQ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FREQ.M with the given input arguments.
%
%      FREQ('Property','Value',...) creates a new FREQ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before freq_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to freq_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help freq

% Last Modified by GUIDE v2.5 05-May-2023 17:49:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @freq_OpeningFcn, ...
                   'gui_OutputFcn',  @freq_OutputFcn, ...
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


% --- Executes just before freq is made visible.
function freq_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to freq (see VARARGIN)

% Choose default command line output for freq
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes freq wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = freq_OutputFcn(hObject, eventdata, handles) 
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
global im 
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im = imread(path);

axes(handles.axes1);
handles.foto=im;
guidata(hObject, handles);
handles.reset=im;
guidata(hObject, handles);
imshow(im);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%ILPF
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im 

[M, N] = size(im);
FT_img = fft2(double(im));
D0 = str2double(get(handles.edit1,'string')); 

% Designing filter
u = 0:(M-1);
x = find(u > M/2);
u(x) = u(x)-M;

v = 0:(N-1);
y = find(v > N/2);
v(y) = v(y)-N;

[V, U] = meshgrid(v, u);

D = sqrt(U.^2+V.^2);
  

H = double(D <= D0);
 
G = H.*FT_img;
 
output_image = real(ifft2(double(G)));

axes(handles.axes2);
imshow(output_image, [ ]);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)%glpf
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% im =imread('gogo.jpg');
global im

[M, N] = size(im);
FT_img = fft2(double(im));

D0 = str2double(get(handles.edit1,'string')); 
D0 = (D0^2)*2;
% Designing filter
u = 0:(M-1);
x = find(u>M/2);
u(x) = u(x)-M;

v = 0:(N-1);
y = find(v>N/2);
v(y) = v(y)-N;

[V, U] = meshgrid(v, u);
  
% Calculating Euclidean Distance
D = sqrt(U.^2+V.^2);

D = -D.^2;

H = exp(D/D0);
  
G = H.*FT_img;
  

output_image = real(ifft2(double(G)));

axes(handles.axes2);
imshow(output_image, [ ]);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)%blpf
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im 

[M, N] = size(im);
FT_img = fft2(double(im));

D0 = str2double(get(handles.edit1,'string')); 
n=str2double(get(handles.edit2,'string'));
n=n*n;
% Designing filter
u = 0:(M-1);
idx = find(u>M/2);
u(idx) = u(idx)-M;
v = 0:(N-1);
idy = find(v>N/2);
v(idy) = v(idy)-N;


[V, U] = meshgrid(v, u);
  
D = sqrt(U.^2+V.^2);

D = D./ D0;

H = 1./((1+D).^n);
  

G = H.*FT_img;
  
output_image = real(ifft2(double(G)));

axes(handles.axes2);
imshow(output_image, [ ]);


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)%LHPF
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im 

[M, N] = size(im);
  
FT_img = fft2(double(im));
  

D0 = str2double(get(handles.edit1,'string')); 
  
u = 0:(M-1);
x = find(u>M/2);
u(x) = u(x)-M;

v = 0:(N-1);
y = find(v>N/2);
v(y) = v(y)-N;
  

[V, U] = meshgrid(v, u);
  

D = sqrt(U.^2+V.^2);
  
H = double(D >= D0);
  
G = H.*FT_img;
  
output_image = real(ifft2(double(G)));
 
axes(handles.axes2);
imshow(output_image, [ ]);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)%BHPF
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im 

[M, N] = size(im);
  
FT_img = fft2(double(im));
  
n = str2double(get(handles.edit2,'string')); 

D0 = str2double(get(handles.edit1,'string')); 
  
% Designing filter
u = 0:(M-1);
v = 0:(N-1);
x = find(u > M/2);
u(x) = u(x) - M;
y = find(v > N/2);
v(y) = v(y) - N;
  
[V, U] = meshgrid(v, u);

D = sqrt(U.^2 + V.^2);
  

H = 1./(1 + (D0./D).^(2*n));
  
G = H.*FT_img;
output_image = real(ifft2(double(G))); 
axes(handles.axes2);
imshow(output_image, [ ]);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)%GHPF
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im 
[M, N] = size(im);
FT_img = fft2(double(im));

D0 = str2double(get(handles.edit1,'string')); 
D0 = (D0^2)*2;
% Designing filter
u = 0:(M-1);
idx = find(u>M/2);
u(idx) = u(idx)-M;
v = 0:(N-1);
idy = find(v>N/2);
v(idy) = v(idy)-N;

[V, U] = meshgrid(v, u);
  
% Calculating Euclidean Distance
D = sqrt(U.^2+V.^2);

D = -D.^2;

H = 1-exp(D/D0);
  
G = H.*FT_img;
  

output_image = real(ifft2(double(G)));

axes(handles.axes2);
imshow(output_image, [ ]);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
imshow('C:\Users\DELL\Downloads\WhatsApp Image 2022-05-18 at 9.37.16 AM.jpeg');


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
reset=handles.reset;
handles.foto=reset;
guidata(hObject, handles);
axes(handles.axes2); 
imshow(reset);
