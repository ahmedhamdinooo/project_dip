function varargout = resampleup(varargin)
% RESAMPLEUP MATLAB code for resampleup.fig
%      RESAMPLEUP, by itself, creates a new RESAMPLEUP or raises the existing
%      singleton*.
%
%      H = RESAMPLEUP returns the handle to a new RESAMPLEUP or the handle to
%      the existing singleton*.
%
%      RESAMPLEUP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESAMPLEUP.M with the given input arguments.
%
%      RESAMPLEUP('Property','Value',...) creates a new RESAMPLEUP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before resampleup_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to resampleup_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help resampleup

% Last Modified by GUIDE v2.5 09-May-2022 22:24:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @resampleup_OpeningFcn, ...
                   'gui_OutputFcn',  @resampleup_OutputFcn, ...
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


% --- Executes just before resampleup is made visible.
function resampleup_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to resampleup (see VARARGIN)

% Choose default command line output for resampleup
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes resampleup wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = resampleup_OutputFcn(hObject, eventdata, handles) 
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
im=rgb2gray(im);
im=im(1:6:end,1:6:end);
factor=str2double(get(handles.factor,'string'));
[r c]=size(im);
new_r=r*factor;
new_c=c*factor;
s_r=1;

for i=1:factor:new_r
    s_c=1;
    for g=1:factor:new_c
        im(i:i+factor-1,g:g+factor-1)=im(s_r,s_c);
        s_c=s_c+1;
    end
    s_r=s_r+1;
end

axes(handles.axes2);
imshow(im)



function factor_Callback(hObject, eventdata, handles)
% hObject    handle to factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of factor as text
%        str2double(get(hObject,'String')) returns contents of factor as a double


% --- Executes during object creation, after setting all properties.
function factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to factor (see GCBO)
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
global im 
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im = imread(path);
axes(handles.axes1);
imshow(im);
