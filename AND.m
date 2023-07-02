function varargout = AND(varargin)
% AND MATLAB code for AND.fig
%      AND, by itself, creates a new AND or raises the existing
%      singleton*.
%
%      H = AND returns the handle to a new AND or the handle to
%      the existing singleton*.
%
%      AND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AND.M with the given input arguments.
%
%      AND('Property','Value',...) creates a new AND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AND_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AND_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AND

% Last Modified by GUIDE v2.5 05-May-2023 14:49:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AND_OpeningFcn, ...
                   'gui_OutputFcn',  @AND_OutputFcn, ...
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


% --- Executes just before AND is made visible.
function AND_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AND (see VARARGIN)

% Choose default command line output for AND
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AND wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AND_OutputFcn(hObject, eventdata, handles) 
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
global j 
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
j = imread(path);
axes(handles.axes1);
handles.foto=j;
guidata(hObject, handles);
handles.reset=j;
guidata(hObject, handles);
imshow(j);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
i = imread(path);
axes(handles.axes2);
handles.foto=i;
guidata(hObject, handles);
handles.reset=i;
guidata(hObject, handles);

imshow(i);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global j
global i

axes(handles.axes2); 
imshow(i);
axes(handles.axes1); 
imshow(j);

% Convert the images to binary arrays
binary1 = imbinarize(i);
binary2 = imbinarize(j);

% Perform a logical OR operation on the binary images
result = binary1 & binary2;

% Display the result in the axes
axes(handles.axes3); 
imshow(result);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
multi;


% --- Executes on button press in pushbutton5.

  


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Clear the command window

% Clear all variables from the workspace


reset=handles.reset;
handles.foto=reset;
guidata(hObject, handles);
axes(handles.axes3); 
imshow(reset);
