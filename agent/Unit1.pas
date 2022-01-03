unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.VirtualImage,
  Vcl.ControlList, Vcl.StdCtrls, Vcl.TitleBarCtrls, Vcl.WinXPickers,
  Vcl.WinXPanels, Vcl.OleCtrls, SHDocVw, JPEG,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Winsock, IdBaseComponent, IdComponent, IdIPWatch,
  IdTCPConnection, IdTCPClient, IdHTTP, IdServerIOHandler, IdSSL, IdSSLOpenSSL,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, JSON, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, Vcl.Menus;

type
  TFService = class(TForm)
    Tray: TTrayIcon;
    BShot: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Label3: TLabel;
    IdIPWatch1: TIdIPWatch;
    IdHTTP: TIdHTTP;
    Memo1: TMemo;
    Memo2: TMemo;
    MFQ: TFDQuery;
    MFC: TFDConnection;
    Label4: TLabel;
    TPM: TPopupMenu;
    N1: TMenuItem;
    TPMAID: TMenuItem;
    TPMHWID: TMenuItem;
    TPMIP: TMenuItem;
    TPMPCNAME: TMenuItem;
    TPMOS: TMenuItem;
    N2: TMenuItem;
    TPMUsername: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    TPMExit: TMenuItem;
    TPMAgentReg: TMenuItem;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BShotClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TPMExitClick(Sender: TObject);
    procedure TPMAgentRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


type
  TCNew = class
  private
    function isNewInsertSQL: String;
    function isHWIDRegistered(tmphwid: String): Boolean;
    function GetIDbyHWID(tmphwid: String): String;

  public
    procedure isNewAgentInstall(tHWID: String; tPCNAME: String; tOS: String; tIP: String; tID: String);
    function isNewCheck: Boolean;
  end;


type
  TCFunc = class
    function GetHname: string;
    function GetVolumeID: string;
    function GetLocalIP: string;
    function GetPubIP: string;
    procedure PScreen;
  private
    function AddIncident(itype, idesc: String): String;
    function GetUsername: String;
    procedure CheckConfigure;

  public

  end;


var
  FService: TFService;
  CFunc: TCFunc;
  CNew: TCNew;
  HWID: String;
  PCNAME: String;
  IP: String;
  OS: String;
  isNew: Boolean;
  AID: String;

  CB_ENABLED: Boolean;
  CB_KEYLOGGER: Boolean;
  CB_PERIODICSCR: Boolean;
  CB_PROCESSCONTROL: Boolean;
  CB_WEBCONSOLE: Boolean;

  DO_SHOT: Boolean;

implementation

{$R *.dfm}

function TCFunc.GetHname: string;
var
    buffer: array[0..255] of char;
    size: dword;
begin
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

function TCFunc.GetVolumeID: string;
var
   id, a, b: DWORD;
   Buffer: array [0..255] of char;
begin
  GetVolumeInformation('c:/', Buffer, sizeof(Buffer), @id, a, b, nil, 0);
  Result := IntToStr(id);
end;

function TCFunc.GetLocalIP: string;
var
   IpW: TIdIPWatch;
begin
  IpW := TIdIPWatch.Create(nil);
  try
    if IpW.LocalIP <> '' then
      Result := IpW.LocalIP;
  finally
    IpW.Free;
  end;
end;

function TCFunc.GetPubIP: string;
var   LJsonObj   : TJSONObject;
      str: string;
      http : TIdHttp;
begin
  str:='';
  http:=TIdHTTP.Create(nil);
  try
    str:=http.Get('http://ipinfo.io/json');
    LJsonObj:= TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(str),0) as TJSONObject;
    str := LJsonObj.Get('ip').JsonValue.Value;
    LJsonObj.Free;
    http.Free;
  except
  end;
  result:=str;
end;

procedure TCFunc.PScreen;
const
    CAPTUREBLT = $40000000;
var ScreenBM: TBitMap;
    SendJPG: TJPEGImage;
begin
  ScreenBM := TBitMap.Create;
  SendJPG := TJPEGImage.Create;
  ScreenBM.Width := Screen.Width;
  ScreenBM.Height := Screen.Height;
  BitBlt(ScreenBM.Canvas.Handle, 0, 0, Screen.Width, Screen.Height,
  GetDC(0), 0, 0, SRCCopy or CAPTUREBLT);
  SendJPG.Assign(ScreenBM);
  SendJPG.SaveToFile('temp\scrx\'+ StringReplace(TimeToStr(now), ':', '-', [rfReplaceAll]) +'_screenshot.jpg');
  SendJPG.Free;
  ScreenBM.Free;
end;

procedure TCNew.isNewAgentInstall(tHWID: string; tPCNAME: string; tOS: string; tIP: string; tID: string);
var
  NewTxt: TStringlist;
begin
  NewTxt:= TStringlist.Create;
  try
    NewTxt.Add(tID);
    NewTxt.Add(tHWID);
    NewTxt.Add(tPCNAME);
    NewTxt.Add(tOS);
    NewTxt.Add(tIP);
    NewTxt.SaveToFile('C:\SCRW\init.bin');
  finally
    NewTxt.Free
  end; {try}
end;

function TCNew.isHWIDRegistered(tmphwid: String): Boolean;
begin
  with FService.MFC do begin
    Connected := True;
    //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
    with FService.MFQ do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT `id`, `hwid`, `username` FROM `agents` WHERE `hwid` = '''+ tmphwid +''';';
        Active := True;
        First;
      end;
      if FService.MFQ.RecordCount <> 0 then
        begin
          FService.Memo1.Lines.Add('HWID ALREADY REGISTERED!');
          FService.Memo1.Lines.Add('AID: '+ FService.MFQ.Fields[0].AsString);
          FService.Memo1.Lines.Add('HWID: '+ FService.MFQ.Fields[1].AsString);
          FService.Memo1.Lines.Add('USERNAME: '+ UTF8Decode(FService.MFQ.Fields[2].AsString));
          Result := True;
        end
        else Result := False; //MessageBox(FService.handle, PChar('Данные не получены'), PChar('Ой'), MB_ICONINFORMATION);
    Connected := False;
  end;
end;

function TCNew.GetIDbyHWID(tmphwid: String): String;
begin
  with FService.MFC do begin
    Connected := True;
    //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
    with FService.MFQ do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT `id` FROM `agents` WHERE `hwid` = '''+ tmphwid +''';';
        Active := True;
        First;
      end;
      if FService.MFQ.RecordCount <> 0 then
        begin
          Result := FService.MFQ.Fields[0].AsString;
          //AID := FService.MFQ.Fields[0].AsString;
        end
        else Result := '1'; //MessageBox(FService.handle, PChar('Данные не получены'), PChar('Ой'), MB_ICONINFORMATION);
    Connected := False;
  end;
end;

function TCNew.isNewCheck: Boolean;
var
  initf: String;
begin
  initf := 'C:\SCRW\init.bin';
  if FileExists(initf) then Result := False
  else Result := True;
end;

function TCFunc.AddIncident(itype: String; idesc: String): String;
begin
  with FService.MFC do begin
    Connected := True;
    //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
    with FService.MFQ do
      begin
        ExecSQL('INSERT INTO `violations` (`DATE`, `TIME`, `AGENT`, `PCNAME`, `IP`, `TYPE`, `DESCRIPTION`) VALUES (:date, :time, :aid, :pcname, :ip, :type, :desc);', [FormatDateTime('yyyy-mm-dd', now), TimeToStr(now), AID, PCNAME, IP, itype, idesc]);
      end;
    Connected := False;
  end;
end;

function TCFunc.GetUsername: String;
begin
  with FService.MFC do begin
    Connected := True;
    //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
    with FService.MFQ do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT `username` FROM `agents` WHERE `hwid` = '''+ HWID +''';';
        Active := True;
        First;
      end;
      if FService.MFQ.RecordCount <> 0 then
        begin
          Result := FService.MFQ.Fields[0].AsString;
        end;
        //else MessageBox(handle, PChar('Данные не получены'), PChar('Ой'), MB_ICONINFORMATION);
    Connected := False;
  end;
end;

function TCNew.isNewInsertSQL: String;
var CF: TCFunc; CN: TCNew;
begin
  if isHWIDRegistered(HWID) = False then
  begin
    with FService.MFC do begin
      Connected := True;
      //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
      with FService.MFQ do
        begin
          ExecSQL('INSERT INTO `agents` (`HWID`, `USERNAME`, `IP ADDRESS`, `OS`, `PCNAME`, `STATUS`) VALUES (:hwid, ''New Agent Registered'', :IP, :OS, :PCNAME, ''Active'');', [HWID, IP, OS, PCNAME]);
          if CN.GetIDbyHWID(HWID) <> '1' then
          begin
            AID := CN.GetIDbyHWID(HWID);
            CN.isNewAgentInstall(HWID, PCNAME, OS, IP, AID);
          end
          else begin
            AID := CN.GetIDbyHWID(HWID);
            CF.AddIncident('HWREG', ('Can not get valid ID by HWID in DB. HWID: '+ HWID +', ID: '+ AID +'.'));
            MessageBox(FService.handle, PChar('Не удалось получить валидный ID по HWID АРМ. Сообщите об этом администратору безопасности.'), PChar('Ой'), MB_ICONINFORMATION);
          end;
        end;
      Connected := False;
    end;
  end
  else begin
    CF.AddIncident('HWREG', ('HWID: '+ HWID +' is already registered in sys by AID: '+ GetIDbyHWID(HWID) +', but init.bin file does not exists.'));
    MessageBox(FService.handle, PChar('Этот HWID уже зарегистрирован с ID агента A' + GetIDbyHWID(HWID) +'. Сообщите об этом администратору безопасности.'), PChar('Ой'), MB_ICONINFORMATION);
    FService.TPMAgentReg.Enabled:= True;
  end;
end;

procedure TCFunc.CheckConfigure;
begin
  with FService.MFC do begin
    Connected := True;
    with FService.MFQ do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT `CB_ENABLED`,`CB_KEYLOGGER`,`CB_PERIODICSCR`,`CB_PROCESSCONTROL`,`CB_WEBCONTROL` FROM `agents` WHERE `id` = '''+ AID +''';';
        Active := True;
        First;
      end;
      if FService.MFQ.RecordCount <> 0 then
        begin
          CB_ENABLED        :=  FService.MFQ.Fields[0].AsBoolean;
          CB_KEYLOGGER      :=  FService.MFQ.Fields[1].AsBoolean;
          CB_PERIODICSCR    :=  FService.MFQ.Fields[2].AsBoolean;
          CB_PROCESSCONTROL :=  FService.MFQ.Fields[3].AsBoolean;
          CB_WEBCONSOLE     :=  FService.MFQ.Fields[4].AsBoolean;
        end;
    Connected := False;
  end;
end;

//procedure TCFunc.FKeylogger;
//begin
//
//end;
//
//procedure TCFunc.FPerSCR;
//begin
//
//end;
//
//procedure TCFunc.FPC;
//begin
//
//end;
//
//procedure TCFunc.FWeb;
//begin
//
//end;

procedure TFService.BShotClick(Sender: TObject);
begin
  CFunc.PScreen;
end;

procedure TFService.Button2Click(Sender: TObject);
begin
  with MFC do begin
    Connected := True;
    //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
    with MFQ do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT `id` FROM `agents` WHERE `hwid` = '''+ HWID +''';';
        Active := True;
        First;
      end;
      if MFQ.RecordCount <> 0 then
        begin
          Button2.Caption := MFQ.Fields[0].AsString;
        end
        else MessageBox(handle, PChar('Данные не получены'), PChar('Ой'), MB_ICONINFORMATION);
    Connected := False;
  end;
end;

procedure TPMUpdate;
var CF: TCFunc;
begin
  FService.TPMAID.Caption :=        ' — A' + AID;
  FService.TPMIP.Caption :=         ' — ' + IP;
  FService.TPMPCNAME.Caption :=     ' — ' + PCNAME;
  FService.TPMOS.Caption :=         ' — ' + OS;
  FService.TPMHWID.Caption :=       ' — ' + HWID;
  FService.TPMUsername.Caption :=   ' — ' + UTF8toString(CF.GetUsername);
  FService.MFQ.ExecSQL('UPDATE `agents` SET `IP ADDRESS` = :ip, `OS` = :os, `PCNAME` = :pcname WHERE ID = :aid;', [IP, OS, PCNAME, AID]);
end;

procedure TFService.Button3Click(Sender: TObject);
var CF: TCFunc;
begin
  Label1.Caption := CF.GetVolumeID;
  Label2.Caption := CF.GetHname;
  Label3.Caption := CF.GetPubIP;
  Label4.Caption := System.SysUtils.TOSVersion.Name;
  Memo2.Lines.Add(FormatDateTime('yyyy-mm-dd', now));
end;

procedure TFService.FormCreate(Sender: TObject);
var CF: TCFunc; CN: TCNew;
begin
  HWID := CF.GetVolumeID;                      // Не должно обновляться в БД
  PCNAME := CF.GetHname;                       // Не должно обновляться в БД
  IP := CF.GetPubIP;                           // Обновлять при каждой загрузке агента
  OS := System.SysUtils.TOSVersion.Name;       // Не должно обновляться в БД

  if CN.isNewCheck = True then
  begin
    CN.isNewInsertSQL;
  end
  else begin
    MessageBox(handle, PChar('Агент уже был установлен.'), PChar('Ой'), MB_ICONINFORMATION);
    AID := CN.GetIDbyHWID(HWID);
    TPMUpdate;
  end;


  // Form1.Show;
end;

procedure TFService.TPMAgentRegClick(Sender: TObject);
var CF: TCFunc; CN: TCNew;
begin
  TPMAgentReg.Enabled:= False;
  //MFQ.ExecSQL('INSERT INTO `agents` (`HWID`, `USERNAME`, `IP ADDRESS`, `OS`, `PCNAME`, `STATUS`) VALUES (:hwid, ''New Agent Registered'', :IP, :OS, :PCNAME, ''Active'');', [HWID, IP, OS, PCNAME]);
  AID := CN.GetIDbyHWID(HWID);
  MFQ.ExecSQL('UPDATE `agents` SET `IP ADDRESS` = :ip, `OS` = :os, `PCNAME` = :pcname WHERE ID = :aid;', [IP, OS, PCNAME, AID]);
  CN.isNewAgentInstall(HWID, PCNAME, OS, IP, AID);
  CF.AddIncident('ADAGR', 'Agent with ID '+ AID +' was reregistered by administration tray button with new params.');
  Close;
  WinExec('Project1.exe', SW_SHOWNORMAL);                                        // ПОМЕНЯТЬ НАЗВАНИЕ ПРИЛОЖЕНИЯ НА ПРОД
end;

procedure TFService.TPMExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
