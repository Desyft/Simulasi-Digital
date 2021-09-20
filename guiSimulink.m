function varargout = guiSimulink(varargin)
% GUISIMULINK MATLAB code for guiSimulink.fig
%      GUISIMULINK, by itself, creates a new GUISIMULINK or raises the existing
%      singleton*.
%
%      H = GUISIMULINK returns the handle to a new GUISIMULINK or the handle to
%      the existing singleton*.
%
%      GUISIMULINK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUISIMULINK.M with the given input arguments.
%
%      GUISIMULINK('Property','Value',...) creates a new GUISIMULINK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiSimulink_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiSimulink_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiSimulink

% Last Modified by GUIDE v2.5 18-Sep-2021 21:53:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiSimulink_OpeningFcn, ...
                   'gui_OutputFcn',  @guiSimulink_OutputFcn, ...
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


% --- Executes just before guiSimulink is made visible.
function guiSimulink_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiSimulink (see VARARGIN)

% Choose default command line output for guiSimulink
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiSimulink wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiSimulink_OutputFcn(hObject, eventdata, handles) 
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
st = 10e-3;
spp = 10;
A = 220;
f = 50;
t = 2;
n = 0;
phase = 0;
bias = 0;
for k = 0:st:t
    n = n+1;
    O(n) = A*sin(f*k+phase)+bias;
    wt(n) = k;
end
axes(handles.axes1)
plot(wt,O)
xlabel('waktu(detik)')
ylabel('Amplitudo (Volt)')
grid on


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
st = 10e-3;
spp = 10;
A = 220;
f = 50;
t = 2;
n = 0;
G = 2;
phase = 0;
bias = 0;
for k = 0:st:t
    n = n+1;
    O(n) = A*sin(f*k+phase)+bias;
    O1(n) = G*O(n);
    wt(n) = k;
end
axes(handles.axes2)
plot(wt,O,'m',wt,O1,'y')
xlabel('waktu(detik)')
ylabel('Amplitudo(Volt)')
grid on


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
