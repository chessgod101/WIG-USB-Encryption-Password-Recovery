unit MainForm;

interface

uses
  Windows, Forms, StdCtrls, Controls, Classes;

type
  TWigFrmMain = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EnumDrives;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type _WIN32_FIND_STREAM_DATA = Record
  StreamSize:int64;
  cStringName: array[0..295] of WideChar;
  End;

CONST HiddenFileName:WideString=':data.img:$DATA';


var
  WigFrmMain: TWigFrmMain;
  DriveArray:Array of WideChar;
  DAlen:Cardinal;
implementation

{$R *.dfm}
Function FileExists(filePath:String):Boolean;
Var
dwAttrib:Cardinal;
Begin
dwAttrib := GetFileAttributes(@filePath[1]);
if (dwAttrib = INVALID_FILE_ATTRIBUTES) or (dwAttrib =FILE_ATTRIBUTE_DIRECTORY) then
result:=false
else
result:=true;
End;

Function RecoverPassword(driveL:WideChar;var username:AnsiString):ansiString;
var
fhnd,tmp:Cardinal;
pswrd:Array[0..255] of AnsiChar;
stF:WideString;
Begin
Result:='';
stF:=driveL+':\'+HiddenFileName;
if FileExists(stF)=false then Begin
MessageBoxW(0,'Hidden File Does Not Exist!','Error',MB_OK);
Exit;
End;

fhnd:=CreateFileW(@stF[1],GENERIC_READ,FILE_SHARE_READ,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
if fhnd=INVALID_HANDLE_VALUE then begin
MessageBox(0,'Cannot open','Error',MB_OK);
exit;
end;
//read username for wondershare
SetFilePointer(fhnd,$70,nil,FILE_BEGIN);
if ReadFile(fhnd,pswrd[0],256,tmp,nil)=false then begin
MessageBox(0,'Cannot read file','Error',MB_OK);
CloseHandle(fhnd);
exit;
end;
username:=pswrd;

//read password
SetFilePointer(fhnd,$174,nil,FILE_BEGIN);


if ReadFile(fhnd,pswrd[0],256,tmp,nil)=false then begin
MessageBox(0,'Cannot read file','Error',MB_OK);
CloseHandle(fhnd);
exit;
end;


CloseHandle(fhnd);
Result:=pswrd;
End;

procedure TWigFrmMain.Button1Click(Sender: TObject);
var
usrn:ansistring;
begin

Edit1.Text:=String(RecoverPassword(DriveArray[ComboBox1.ItemIndex],usrn));
Edit2.Text:=String(usrn);
end;


Function GetDiskName(dPath:WideString):WideString;
var
s,s2:Array [0..255] of WideChar;
tmp,tmp1,ln:Cardinal;
Begin
ZeroMemory(@s[0],256);
ZeroMemory(@s2[0],256);
 Result:='';
if GetVolumeInformationW(@dPath[1],@s[0],256,@tmp,ln,tmp1,@s2[0],256)= false then exit;
Result:=s;
End;


procedure TWigFrmMain.Button2Click(Sender: TObject);
Begin
EnumDrives;
end;

procedure TWigFrmMain.EnumDrives;
var
I,dr,dt:Cardinal;
S:WideString;
begin
ComboBox1.Clear;
SetLength(DriveArray,0);
DAlen:=0;
dr:=GetLogicalDrives;
for I := 0 to 25 do Begin
 if dr and 1=1 then  Begin
 S:=WideChar($41+I)+':\';
 dt:=GetDriveTypeW(@S[1]);
 if dt=2 then begin
 inc(DAlen);
 SetLength(DriveArray,DAlen);
 DriveArray[DAlen-1]:=WideChar($41+I);
 S:=S+' ('+GetDiskName(S)+')';
  ComboBox1.Items.Add(S);
end;

 End;
  dr:=dr shr 1;
End;
ComboBox1.ItemIndex:=0;
//
end;

procedure TWigFrmMain.FormCreate(Sender: TObject);
begin
EnumDrives;
end;

end.
