function varargout = ghistogram(varargin)
% GHISTOGRAM MATLAB code for ghistogram.fig
%      GHISTOGRAM, by itself, creates a new GHISTOGRAM or raises the existing
%      singleton*.
%
%      H = GHISTOGRAM returns the handle to a new GHISTOGRAM or the handle to
%      the existing singleton*.
%
%      GHISTOGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GHISTOGRAM.M with the given input arguments.
%
%      GHISTOGRAM('Property','Value',...) creates a new GHISTOGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ghistogram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ghistogram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ghistogram

% Last Modified by GUIDE v2.5 19-Apr-2022 03:39:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ghistogram_OpeningFcn, ...
                   'gui_OutputFcn',  @ghistogram_OutputFcn, ...
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


% --- Executes just before ghistogram is made visible.
function ghistogram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ghistogram (see VARARGIN)

% Choose default command line output for ghistogram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ghistogram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ghistogram_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
multi;
