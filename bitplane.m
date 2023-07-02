function varargout = bitplane(varargin)
% BITPLANE MATLAB code for bitplane.fig
%      BITPLANE, by itself, creates a new BITPLANE or raises the existing
%      singleton*.
%
%      H = BITPLANE returns the handle to a new BITPLANE or the handle to
%      the existing singleton*.
%
%      BITPLANE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BITPLANE.M with the given input arguments.
%
%      BITPLANE('Property','Value',...) creates a new BITPLANE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bitplane_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bitplane_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bitplane

% Last Modified by GUIDE v2.5 19-Apr-2022 03:23:50

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


% --- Executes just before bitplane is made visible.
function bitplane_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bitplane (see VARARGIN)

% Choose default command line output for bitplane
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bitplane wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bitplane_OutputFcn(hObject, eventdata, handles) 
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
imshow(im);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im

axes(handles.axes1); 
imshow(im);
im = rgb2gray(im); 
[rows cols] = size(im);
newImage = zeros(rows,cols,8);
knum=str2double(get(handles.edit1,'string'));

for k=1:8
     for row_index=1:1:rows
        for col_index=1:1:cols
            newImage(row_index,col_index,k)=bitget(im(row_index,col_index),k);
        end
     end
     
     
     
end
% figure
set(handles.edit1,'string','');
axes(handles.axes2);
imshow(newImage(:,:,knum));

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text



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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
multi;
