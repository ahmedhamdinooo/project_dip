function varargout = sclicing(varargin)
% SCLICING MATLAB code for sclicing.fig
%      SCLICING, by itself, creates a new SCLICING or raises the existing
%      singleton*.
%
%      H = SCLICING returns the handle to a new SCLICING or the handle to
%      the existing singleton*.
%
%      SCLICING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCLICING.M with the given input arguments.
%
%      SCLICING('Property','Value',...) creates a new SCLICING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sclicing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sclicing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sclicing

% Last Modified by GUIDE v2.5 05-May-2023 16:21:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sclicing_OpeningFcn, ...
                   'gui_OutputFcn',  @sclicing_OutputFcn, ...
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


% --- Executes just before sclicing is made visible.
function sclicing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sclicing (see VARARGIN)

% Choose default command line output for sclicing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sclicing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sclicing_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = handles.foto;
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

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = handles.foto;
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
close
point;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
reset=handles.reset;
handles.foto=reset;
guidata(hObject, handles);
axes(handles.axes2); 
imshow(reset);
