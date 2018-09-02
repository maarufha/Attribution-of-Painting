function varargout = MainGui(varargin)

%Owners: 
    %%%%%Hadi Abu-Maruf%%%%%%
      %%%%%Tomer Barak%%%%%
      
%MAINGUI MATLAB code for MainGui.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainGui

% Last Modified by GUIDE v2.5 01-Jul-2018 12:43:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainGui_OpeningFcn, ...
                   'gui_OutputFcn',  @MainGui_OutputFcn, ...
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

global  fpf;
global  fps;
global  fpt;
global  fpk;
global  fpw;
global  fpz;

% --- Executes just before MainGui is made visible.
function MainGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainGui (see VARARGIN)

% Choose default command line output for MainGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

a=imread('logo.jpg');
imshow(a);
% --- Outputs from this function are returned to the command line.
function varargout = MainGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in dataBasebtn.
function dataBasebtn_Callback(hObject, eventdata, handles)
% hObject    handle to dataBasebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
global fpf;
fpf = uigetdir();
set(handles.dataBasebtn,'String',fpf);
if(hObject.String=='0')
    hObject.String='Choose database folder';
end
guidata(hObject, handles);


% --- Executes on button press in iputImagebtn.
function iputImagebtn_Callback(hObject, eventdata, handles)
% hObject    handle to iputImagebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,FilePath]=uigetfile('*.jpg','select dicom file');
global fpt;
fpt = [FilePath FileName];
set(handles.iputImagebtn,'String',fpt);
if(hObject.String=='0')
    hObject.String='Choose painting to classify';
end
guidata(hObject, handles);

function numOfClusters_Callback(hObject, eventdata, handles)
% hObject    handle to numOfClusters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numOfClusters as text
%        str2double(get(hObject,'String')) returns contents of numOfClusters as a double
global fpk;
K=str2double(get(hObject,'String'));
fpk= K;
% --- Executes during object creation, after setting all properties.
function numOfClusters_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numOfClusters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numOfWindows_Callback(hObject, eventdata, handles)
% hObject    handle to numOfWindows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numOfWindows as text
%        str2double(get(hObject,'String')) returns contents of numOfWindows as a double
global fpw;

windows=str2double(get(hObject,'String'));
fpw=windows;
% --- Executes during object creation, after setting all properties.
function numOfWindows_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numOfWindows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
global fpz;

% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents=cellstr(get(hObject,'String'));
popChoice=contents(get(hObject,'Value'));
fpz='Choose database painters names';

if(strcmp(popChoice,'dali, rembrandt, vangogh, renior, aivazovsky'))
    fpz={'dali','rembrandt','vangogh','renior', 'aivazovsky' };
elseif(strcmp(popChoice,'monet, renoir'))
    fpz={'monet','renoir'};
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in classifybtn.
function classifybtn_Callback(hObject, eventdata, handles)
% hObject    handle to classifybtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fpt;
global fpf;
global fpk;
global fpw;
global fpz;

srcFiles = dir([fpf,'\*.jpg']); %the folder where images stored
numFiles = length(srcFiles);
if(numFiles==0)
       msgbox('The database folder have no paintings. Please choose again','Error','error');
elseif(fpf==0)
       msgbox('Please choose the database folder','Error','error');
elseif (fpt==0)
       msgbox('Please choose the input painting','Error','error');
elseif (isnan(fpk)||fpk<=0)
       msgbox('Penter enter a natural number of clusters','Error','error');
elseif (isnan(fpw)||fpw<=0)
       msgbox('Please enter the number of windows','Error','error');
elseif (mod(fpw,sqrt(fpw))~=0||fpw<=0)
       msgbox('Please enter square positive number','Error','error');

elseif(strcmp(fpz,'Choose database painters names'))
       msgbox('Please Choose the database painter names','Error','error');
else
    mainFunction(fpf, fpt, fpk, fpw, fpz);
end


% --- Executes on button press in HelpButton.
function HelpButton_Callback(hObject, eventdata, handles)

msgbox({'Hello and welcome to "Attribution of Painting" program';
    '';
    'Please complete the following:';
    'Choose database folder';
    'Choose painting to classify';
    'Number of clusters';
    'Number of windows';
    'Choose database painters names from the list';
    'Click "Classify"'},'Help');

% hObject    handle to HelpButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
