unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UserInfo, Vcl.TitleBarCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, AnsiStrings;

type
  TFMainScreen = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Shape1: TShape;
    LUsername: TLabel;
    LUserrole: TLabel;
    PStats: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MFDMySQL: TFDConnection;
    MFDQuery1: TFDQuery;
    clAccs: TLabel;
    clViolations: TLabel;
    clActAgents: TLabel;
    clAgents: TLabel;
    clUpdateTime: TLabel;
    MFDQuery2: TFDQuery;
    DataSource1: TDataSource;
    MFDMySQL2: TFDConnection;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListBox1: TListBox;
    LSUName: TLabel;
    LSUStatus: TLabel;
    LSUOS: TLabel;
    LSUIP: TLabel;
    LSUPCUser: TLabel;
    ISUOSWin11: TImage;
    ISUOSWin10: TImage;
    ISUOSWin8: TImage;
    ISUOSWinXP: TImage;
    ISUOSWin95: TImage;
    ListBox2: TListBox;
    Bevel1: TBevel;
    TabSheet3: TTabSheet;
    DBGLogs: TDBGrid;
    MFDLogs: TFDConnection;
    MFDQueryLogs: TFDQuery;
    BCProcessDown: TButton;
    LBActionLog: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    LBPAgents: TListBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    BPUpdate: TButton;
    MFDQueryPolicy: TFDQuery;
    MFDPolicy: TFDConnection;
    GBFunctions: TGroupBox;
    Label9: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CBAgentEnable: TCheckBox;
    CBKeylogger: TCheckBox;
    CBProcess: TCheckBox;
    CBScreenshotsPeriodic: TCheckBox;
    CBProcessControl: TCheckBox;
    ECProcess: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CBWebControl: TCheckBox;
    Label13: TLabel;
    N6: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure clUpdateTimeClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControlDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure CBProcessClick(Sender: TObject);
    procedure BPUpdateClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainScreen: TFMainScreen;

implementation

uses
  Unit1;

{$R *.dfm}

procedure ALog(str: String);
begin
  FMainScreen.LBActionLog.Items.Add(TimeToStr(now) + ' :: ' + str);
  FMainScreen.LBActionLog.Perform( WM_VSCROLL, SB_BOTTOM, 0 );
  FMainScreen.LBActionLog.Perform( WM_VSCROLL, SB_ENDSCROLL, 0 );
end;

function SQ2(query: String): String;
begin
  with FMainScreen.MFDMySQL2 do begin
    Connected := True;
    //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
    with FMainScreen.MFDQuery2 do
      begin
        Active := False;
        sql.Clear;
        sql.Text := query;
        Active := True;
        First;
      end;
      if FMainScreen.MFDQuery2.RecordCount <> 0 then
        begin
          Result := FMainScreen.MFDQuery2.Fields[0].AsString;
        end
        else //Label1.Caption := '1';
    Connected := False;
    end;
end;

function SQ3(query: String): String;
begin
  with FMainScreen.MFDLogs do begin
    Connected := True;
    //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
    with FMainScreen.MFDQueryLogs do
      begin
        Active := False;
        sql.Clear;
        sql.Text := query;
        Active := True;
        First;
      end;
      if FMainScreen.MFDQueryLogs.RecordCount <> 0 then
        begin
          Result := FMainScreen.MFDQueryLogs.Fields[0].AsString;
        end
        else //Label1.Caption := '1';
    Connected := False;
    end;
end;

function UpdateDashPanel(): String;
var time: TDateTime;
begin
  try
    //UPDATE ACCS IN SYS

    with FMainScreen.MFDMySQL do begin
      Connected := True;
      with FMainScreen.MFDQuery1 do
        begin
          Active := False;
          sql.Clear;
          sql.Text := 'SELECT COUNT(id) FROM `users`;';
          Active := True;
          First;
        end;
        if FMainScreen.MFDQuery1.RecordCount <> 0 then
          begin
            FMainScreen.clAccs.Caption := FMainScreen.MFDQuery1.Fields[0].AsString;    //MessageBox(handle, PChar('Получены данные'), PChar('Ой'), MB_ICONINFORMATION);
            ALog('Горячая панель - Обновлено количество зарегистрированных аккаунтов');
          end
          else FMainScreen.clAccs.Caption := FMainScreen.clAccs.Caption + ' ?';
      Connected := False;

    end;

    //UPDATE AGENTS IN SYS

    with FMainScreen.MFDMySQL do begin
      Connected := True;
      with FMainScreen.MFDQuery1 do
        begin
          Active := False;
          sql.Clear;
          sql.Text := 'SELECT COUNT(id) FROM `agents`;';
          Active := True;
          First;
        end;
        if FMainScreen.MFDQuery1.RecordCount <> 0 then
          begin
            FMainScreen.clAgents.Caption := FMainScreen.MFDQuery1.Fields[0].AsString;    //MessageBox(handle, PChar('Получены данные'), PChar('Ой'), MB_ICONINFORMATION);
            ALog('Горячая панель - Обновлено количество зарегистрированных агентов');
          end
          else FMainScreen.clAgents.Caption := FMainScreen.clAgents.Caption + ' ?';
      Connected := False;
    end;

    //UPDATE ACTIVE AGENTS IN SYS

    with FMainScreen.MFDMySQL do begin
    Connected := True;
    with FMainScreen.MFDQuery1 do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT COUNT(id) FROM `agents` WHERE `status` = ''Active'';';
        Active := True;
        First;
      end;
      if FMainScreen.MFDQuery1.RecordCount <> 0 then
        begin
          FMainScreen.clActAgents.Caption := FMainScreen.MFDQuery1.Fields[0].AsString;    //MessageBox(handle, PChar('Получены данные'), PChar('Ой'), MB_ICONINFORMATION);
          ALog('Горячая панель - Обновлено количество активных агентов');
        end
        else FMainScreen.clActAgents.Caption := FMainScreen.clActAgents.Caption + ' ?';
      Connected := False;
    end;

    //UPDATE VIOLATION COUNT

    with FMainScreen.MFDMySQL do begin
    Connected := True;
    with FMainScreen.MFDQuery1 do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT COUNT(id) FROM `violations`;';
        Active := True;
        First;
      end;
      if FMainScreen.MFDQuery1.RecordCount <> 0 then
        begin
          FMainScreen.clViolations.Caption := FMainScreen.MFDQuery1.Fields[0].AsString;    //MessageBox(handle, PChar('Получены данные'), PChar('Ой'), MB_ICONINFORMATION);
          ALog('Горячая панель - Успешно обновлено количество событий');
        end
        else FMainScreen.clViolations.Caption := FMainScreen.clViolations.Caption + ' ?';
      Connected := False;
    end;
    Result := 'Обновлено: ' + TimeToStr(now);
    ALog('Горячая панель - Обновление завершено успешно');
  except
    on E : Exception do
    //UpdateDashPanel();
    Result := 'Обновлено неудачно: ' + TimeToStr(now);
  end;
end;

procedure TFMainScreen.CBProcessClick(Sender: TObject);
begin
  if CBProcess.Checked = False then
  begin
    ECProcess.Enabled := False;
    BCProcessDown.Enabled := False;
    ALog('Функции - Режим принудительного завершения неактивен');
  end
  else
    begin
      ECProcess.Enabled := True;
      BCProcessDown.Enabled := True;
      ALog('Функции - Режим принудительного завершения активирован');
    end;

end;

procedure TFMainScreen.clUpdateTimeClick(Sender: TObject);
begin
  ALog('Горячая панель - Инициализирован процесс обновления');
  clUpdateTime.Caption := UpdateDashPanel();
end;

procedure TFMainScreen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FAuth.Show;
end;

type
THask = class(TPageControl);

procedure TFMainScreen.FormCreate(Sender: TObject);
begin
  //THask(Pagecontrol).Color := $00292929;
  //THask(Pagecontrol).Font.Color := $0000D9FF;
  THask(PageControl).ParentColor := true;
  THask(PageControl).BorderWidth := 0;
  //Pagecontrol.IsLightStyleColor()
  //Tabsheet1.Colo

end;

procedure TFMainScreen.FormShow(Sender: TObject);
  var TUI: TUserInfo; i: Integer;
begin
  LUsername.Caption := DBUserName;
  TUI := TUserInfo.Create();
  LUserrole.Caption := TUI.UserroleCaption(DBUserRole);
  FAuth.FDMySQL.Connected := False;
  FMainScreen.ListBox1.Items.Clear;
  FMainScreen.ListBox2.Items.Clear;
    with FMainScreen.MFDMySQL2 do begin
    Connected := True;
    //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
    with FMainScreen.MFDQuery2 do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT `username` FROM `agents`;';
        Active := True;
        First;
      end;
      if FMainScreen.MFDQuery2.RecordCount <> 0 then
        begin
          for i := 0 to (MFDQuery2.RecordCount - 1) do
            begin
              Listbox1.Items.Add('A' + IntToStr(i + 1) +' / ' + UTF8ToString(MFDQuery2.Fields[0].AsString));
              Listbox2.Items.Add(MFDQuery2.Fields[0].AsString);
              MFDQuery2.Next;
            end;
          ALog('Список агентов обновлен');
        end
        else ALog('Не получилось выгрузить список агентов');
    Connected := False;
    end;

  // LOGS SCREEN

  FMainScreen.LSUPCUser.Caption := SQ3('SELECT * FROM `violations`;');
  ALog('Лог - Обновлен список событий');
  DBGLogs.Columns[0].Width := 30;

  clUpdateTime.Caption := UpdateDashPanel();
end;

function UpdateSU(tmpuname: String): String;
begin
  // OS GET

  FMainScreen.ISUOSWin11.Visible := False;
  FMainScreen.ISUOSWin10.Visible := False;
  FMainScreen.ISUOSWin8.Visible := False;
  FMainScreen.ISUOSWinXP.Visible := False;
  FMainScreen.ISUOSWin95.Visible := False;
  FMainScreen.LSUOS.Visible := False;

  FMainScreen.LSUOS.Caption := SQ2('SELECT `os` FROM `agents` WHERE `username` = ''' + tmpuname + ''';');
  if FMainScreen.LSUOS.Caption = 'Windows 11' then    FMainScreen.ISUOSWin11.Visible := True;
  if FMainScreen.LSUOS.Caption = 'Windows 10' then    FMainScreen.ISUOSWin10.Visible := True;
  if FMainScreen.LSUOS.Caption = 'Windows 8' then     FMainScreen.ISUOSWin8.Visible := True;
  if FMainScreen.LSUOS.Caption = 'Windows 7' then     FMainScreen.ISUOSWinXP.Visible := True;
  if FMainScreen.LSUOS.Caption = 'Windows XP' then    FMainScreen.ISUOSWinXP.Visible := True;
  if FMainScreen.LSUOS.Caption = 'Windows <2000' then FMainScreen.ISUOSWin95.Visible := True;
  FMainScreen.LSUOS.Visible := True;

  ALog('Агент - Обновлена информация об ОС');

  // Status GET
  FMainScreen.LSUStatus.Visible := False;
  FMainScreen.LSUStatus.Caption := SQ2('SELECT `status` FROM `agents` WHERE `username` = ''' + tmpuname + ''';');

  if FMainScreen.LSUStatus.Caption = 'Active' then FMainScreen.LSUStatus.Font.Color := $005AD39A
  else FMainScreen.LSUStatus.Font.Color := $003737F2;

  FMainScreen.LSUStatus.Visible := True;

  ALog('Агент - Обновлена информация о статусе');

  // IP GET
  FMainScreen.LSUIP.Visible := False;
  FMainScreen.LSUIP.Caption := SQ2('SELECT `ip address` FROM `agents` WHERE `username` = ''' + tmpuname + ''';');
  FMainScreen.LSUIP.Visible := True;

  ALog('Агент - Обновлена информация об IP адресе');

  // PCNAME GET
  FMainScreen.LSUPCUser.Visible := False;
  FMainScreen.LSUPCUser.Caption := SQ2('SELECT `pcname` FROM `agents` WHERE `username` = ''' + tmpuname + ''';');
  FMainScreen.LSUPCUser.Visible := True;

  ALog('Агент - Обновлена информация о имени устройства');
end;

function GBGetUpdate(tmpid: Integer): String;
begin
  FMainScreen.CBAgentEnable.Checked := False;
  FMainScreen.CBKeylogger.Checked := False;
  FMainScreen.CBScreenshotsPeriodic.Checked := False;
  FMainScreen.CBProcessControl.Checked := False;
  FMainScreen.CBWebControl.Checked := False;
    with FMainScreen.MFDMySQL2 do begin
    Connected := True;
    with FMainScreen.MFDQuery2 do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT `CB_ENABLED`,`CB_KEYLOGGER`,`CB_PERIODICSCR`,`CB_PROCESSCONTROL`,`CB_WEBCONTROL` FROM `agents` WHERE `id` = '''+ IntToStr(tmpid) +''';';
        Active := True;
        First;
      end;
      if FMainScreen.MFDQuery2.RecordCount <> 0 then
        begin
          //ALog(FMainScreen.MFDQuery2.Fields[0].AsString + FMainScreen.MFDQuery2.Fields[1].AsString + FMainScreen.MFDQuery2.Fields[2].AsString + FMainScreen.MFDQuery2.Fields[3].AsString + FMainScreen.MFDQuery2.Fields[4].AsString);
          FMainScreen.CBAgentEnable.Checked :=          FMainScreen.MFDQuery2.Fields[0].AsBoolean;
          FMainScreen.CBKeylogger.Checked :=            FMainScreen.MFDQuery2.Fields[1].AsBoolean;
          FMainScreen.CBScreenshotsPeriodic.Checked :=  FMainScreen.MFDQuery2.Fields[2].AsBoolean;
          FMainScreen.CBProcessControl.Checked :=       FMainScreen.MFDQuery2.Fields[3].AsBoolean;
          FMainScreen.CBWebControl.Checked :=           FMainScreen.MFDQuery2.Fields[4].AsBoolean;
          ALog('Функции - Получена конфигурация агента с ID A' + IntToStr(tmpid));
          FMainScreen.GBFunctions.Visible := True;
        end
        else ALog('Функции - Не удалось получить актуальную конфигурацию агента ID A' + IntToStr(tmpid));
    Connected := False;
    end;
end;

procedure TFMainScreen.ListBox1DblClick(Sender: TObject);
var SUName: String; SUName2: String;
begin
  SUName := StringReplace((StuffString(Listbox1.Items[Listbox1.ItemIndex], 0, (Pos('/ ', Listbox1.Items[Listbox1.ItemIndex]) + 1), '')), ' ', '', [rfIgnoreCase]);
  SUName2 := Listbox2.Items[Listbox1.ItemIndex];                                    // ОООО, КОСТЫЛИ!
  LSUName.Visible := True;
  LSUName.Caption := SUName;
  UpdateSU(SUName2);
  GBGetUpdate(Listbox1.ItemIndex + 1);
end;

procedure TFMainScreen.N2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFMainScreen.N6Click(Sender: TObject);
begin
  FMainScreen.Close;
end;

procedure TFMainScreen.BPUpdateClick(Sender: TObject);
var i: Integer;
begin
  LBPAgents.Items.Clear;
  with FMainScreen.MFDPolicy do begin
    Connected := True;
    //MessageBox(handle, PChar('Не могу подлючиться'), PChar('Ой'), MB_ICONINFORMATION);
    with FMainScreen.MFDQueryPolicy do
      begin
        Active := False;
        sql.Clear;
        sql.Text := 'SELECT `id`,`username` FROM `agents` WHERE `strictpolicy` = ''1'';';
        Active := True;
        First;
      end;
      if FMainScreen.MFDQueryPolicy.RecordCount <> 0 then
        begin
          for i := 0 to (MFDQueryPolicy.RecordCount - 1) do
            begin
              LBPAgents.Items.Add('A' + MFDQueryPolicy.Fields[0].AsString +' / ' + UTF8ToString(MFDQueryPolicy.Fields[1].AsString));
              MFDQueryPolicy.Next;
            end;
          ALog('Список агентов с грубой политикой обновлен');
        end
        else ALog('Не получилось получить список агентов с грубой политикой');
    Connected := False;
  end;
end;

procedure TFMainScreen.PageControlDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  AText: String;
  APoint: TPoint;
begin
  AText := TPageControl(Control).Pages[TabIndex].Caption;
    with Control.Canvas do
    begin
      APoint.x := (Rect.Right - Rect.Left) div 2 - TextWidth(AText) div 2;
      APoint.y := (Rect.Bottom - Rect.Top) div 2 - TextHeight(AText) div 2;
      TextRect(Rect, Rect.Left + APoint.x, Rect.Top + APoint.y, AText);
    end;
end;

end.
