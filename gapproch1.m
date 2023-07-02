function varargout = gapproch1(varargin)
% GAPPROCH1 MATLAB code for gapproch1.fig
%      GAPPROCH1, by itself, creates a new GAPPROCH1 or raises the existing
%      singleton*.
%
%      H = GAPPROCH1 returns the handle to a new GAPPROCH1 or the handle to
%      the existing singleton*.
%
%      GAPPROCH1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAPPROCH1.M with the given input arguments.
%
%      GAPPROCH1('Property','Value',...) creates a new GAPPROCH1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gapproch1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gapproch1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gapproch1

% Last Modified by GUIDE v2.5 29-Apr-2022 03:27:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bitplane_OpeningFcn, ...
                   'gui_OutputFcn',  @bitplane_OutputFcn, ...
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


% --- Executes just before gapproch1 is made visible.
function gapproch1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gapproch1 (see VARARGIN)

% Choose default command line output for gapproch1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gapproch1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gapproch1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function min_Callback(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min as text
%        str2double(get(hObject,'String')) returns contents of min as a double


% --- Executes during object creation, after setting all properties.
function min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_Callback(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max as text
%        str2double(get(hObject,'String')) returns contents of max as a double


% --- Executes during object creation, after setting all properties.
function max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im 
axes(handles.axes1);
imshow(im);
 
im = rgb2gray(im);  
newImage = im;
[rows cols] = size(im);
min=str2double(get(handles.min,'string'));
max=str2double(get(handles.max,'string'));

for row_index=1:1:rows
    for col_index=1:1:cols
        if(im(row_index,col_index)>=min && im(row_index,col_index)<=max)
            newImage(row_index,col_index) = 255;
        else
             newImage(row_index,col_index) = im(row_index,col_index);
        end
    end
end

set(handles.min,'string','');
set(handles.max,'string','');
axes(handles.axes2);
imshow(newImage);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
axes(handles.axes1);
imshow(im);

im = rgb2gray(im);  
newImage = im;
[rows cols] = size(im);
min=str2double(get(handles.min,'string'));
max=str2double(get(handles.max,'string'));

for i=1:1:rows
    for j=1:1:cols
        if(im(i,j)>=min && im(i,j)<=max)
            newImage(i,j) = 255;
        else
             newImage(i,j) = 0;
        end
    end
end
set(handles.min,'string','');
set(handles.max,'string','');
axes(handles.axes2);
imshow(newImage);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
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
imshow(im);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
gui;
