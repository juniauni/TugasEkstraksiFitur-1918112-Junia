function varargout = ekstrasi_ciri(varargin)
% EKSTRASI_CIRI MATLAB code for ekstrasi_ciri.fig
%      EKSTRASI_CIRI, by itself, creates a new EKSTRASI_CIRI or raises the existing
%      singleton*.
%
%      H = EKSTRASI_CIRI returns the handle to a new EKSTRASI_CIRI or the handle to
%      the existing singleton*.
%
%      EKSTRASI_CIRI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EKSTRASI_CIRI.M with the given input arguments.
%
%      EKSTRASI_CIRI('Property','Value',...) creates a new EKSTRASI_CIRI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ekstrasi_ciri_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ekstrasi_ciri_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ekstrasi_ciri

% Last Modified by GUIDE v2.5 26-May-2022 12:15:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ekstrasi_ciri_OpeningFcn, ...
                   'gui_OutputFcn',  @ekstrasi_ciri_OutputFcn, ...
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


% --- Executes just before ekstrasi_ciri is made visible.
function ekstrasi_ciri_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ekstrasi_ciri (see VARARGIN)

% Choose default command line output for ekstrasi_ciri
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ekstrasi_ciri wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ekstrasi_ciri_OutputFcn(hObject, eventdata, handles) 
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

% menampilkan menu browse file
[nama_file,nama_folder] = uigetfile({'*.jpg;*.png;'},'openimage');
% jika ada nama file yang dipilih
if ~isequal(nama_file,0)
    % membaca file citra rgb
    x = imread(fullfile(nama_folder,nama_file));
    % menampilkan citra rgb pada axes
    axes(handles.axes1)
    imshow(x)
    handles.x = x;
    % menyimpan variabel x pada lokasi handles
    guidata(hObject, handles)
else
    % jika tidak ada nama file yang dipilih
    return
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% memanggil variable yang ada di lokasi handles
x = handles.x;

% mengetahui komposisi warna rgb
fR=x(:,:,1);
fG=x(:,:,2);
fB=x(:,:,3);

% mengetahui tingkat rgb
fr=mean(mean(fR));
fb=mean(mean(fG));
fc=mean(mean(fB));
frr=fr/255;
fbb=fb/255;
fcc=fc/255;

% menampilkan hasil ekstraksi pada teks edit
set(handles.edit1,'String',frr)
set(handles.edit2,'String',fbb)
set(handles.edit3,'String',fcc)



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
