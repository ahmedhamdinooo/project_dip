function varargout = multi(varargin)
% MULTI MATLAB code for multi.fig
%      MULTI, by itself, creates a new MULTI or raises the existing
%      singleton*.
%
%      H = MULTI returns the handle to a new MULTI or the handle to
%      the existing singleton*.
%
%      MULTI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTI.M with the given input arguments.
%
%      MULTI('Property','Value',...) creates a new MULTI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before multi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to multi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help multi

% Last Modified by GUIDE v2.5 05-May-2023 14:49:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @multi_OpeningFcn, ...
                   'gui_OutputFcn',  @multi_OutputFcn, ...
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


% --- Executes just before multi is made visible.
function multi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to multi (see VARARGIN)

% Choose default command line output for multi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes multi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = multi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%histogram
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = handles.foto;
[rows,cols]=size(im);
counts=zeros(1,256);
for i=1:rows
 for j=1:cols
    grayLevel=im(i,j);
    counts(grayLevel+1)=counts(grayLevel+1)+1;
end
end


grayLevels = 0 : 255;

 
 axes(handles.axes2);
 bar(grayLevels, counts, 'BarWidth', 1, 'FaceColor', 'b');
 xlabel('Gray Level', 'FontSize', 20);
 ylabel('Pixel Count', 'FontSize', 20);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)% two image
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
g5;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
project;


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im = imread(path);
im=rgb2gray(im);
axes(handles.axes1);
handles.foto=im;
guidata(hObject, handles);
handles.reset=im;
guidata(hObject, handles);
imshow(im);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)% add
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = handles.foto;
% im = rgb2gray(im);
n=str2double(get(handles.add,'string'));
AddImage = im + n;

axes(handles.axes2);
imshow(AddImage);

set(handles.add,'string','');

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)% subtract
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = handles.foto;
% im = rgb2gray(im);
n=str2double(get(handles.add,'string'));
subImage = im - n;

axes(handles.axes2);
imshow(subImage);

set(handles.add,'string','');

function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of add as text
%        str2double(get(hObject,'String')) returns contents of add as a double


% --- Executes during object creation, after setting all properties.
function add_CreateFcn(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close
AND;

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close
OR;
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton11.
function pushbutton11_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
reset=handles.reset;
handles.foto=reset;
guidata(hObject, handles);
axes(handles.axes2); 
imshow(reset);
