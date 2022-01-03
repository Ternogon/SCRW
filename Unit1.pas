unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Phys.ADS, FireDAC.Phys.ADSDef, Vcl.ComCtrls,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, UserInfo, Unit2, Vcl.WinXCtrls, Vcl.Imaging.pngimage,
  sSkinManager, sButton, sEdit, sSkinProvider, acTitleBar, Vcl.Buttons,
  sSpeedButton, sStatusBar, sPanel;

type
  TFAuth = class(TForm)
    ELogin: TEdit;
    btnConnect: TButton;
    Label1: TLabel;
    FDMySQL: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDQuery1: TFDQuery;
    btnAuth: TButton;
    timeAuth: TTimer;
    AIAuth: TActivityIndicator;
    StatusBar1: TStatusBar;
    iBG: TImage;
    EPassword: TEdit;
    iEM: TImage;
    LErrorMessage: TLabel;
    iLOGO: TImage;
    procedure btnConnectClick(Sender: TObject);
    procedure btnAuthClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timeAuthTimer(Sender: TObject);
    procedure EPasswordClick(Sender: TObject);
    procedure ELoginClick(Sender: TObject);
    procedure EPasswordChange(Sender: TObject);
    procedure LErrorMessageClick(Sender: TObject);
    procedure iEMClick(Sender: TObject);
    procedure ELoginEnter(Sender: TObject);
    procedure EPasswordEnter(Sender: TObject);
    procedure EPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ELoginKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAuth: TFAuth;

implementation

{$R *.dfm}

procedure ErrormessageOn(EM: String);
begin
  FAuth.LErrorMessage.Caption := EM;
  FAuth.iEM.Visible := True;
  FAuth.LErrorMessage.Visible := True;
  FAuth.ELogin.Enabled := True;
  FAuth.EPassword.Enabled := True;
  FAuth.btnAuth.Enabled := True;
  FAuth.AIAuth.Animate := False;
end;

procedure ErrormessageOff();
begin
  FAuth.iEM.Visible := False;
  FAuth.LErrorMessage.Visible := False;
end;

procedure TFAuth.btnConnectClick(Sender: TObject);
begin
  //FDPhysFBDriverLink1.VendorLib := 'C:\Program Files\MySQL\libmysql.dll';
  with FDMySQL do begin
    with Params do begin
      //Server := '92.53.96.150';
      UserName := ELogin.Text;
      Password := EPassword.Text;
    end;
    try
      begin
        //FDConnection1.Params.UserName := ELogin.Text;
        //FDConnection1.Params.Password := EPassword.Text;
        Connected := True;
        MessageBox(handle, PChar('Подключение успешно!'), PChar('Успех'), MB_ICONINFORMATION+MB_OK);
        if Connected = True then
          StatusBar1.Panels[0].Text := 'Подключено'
        else
          StatusBar1.Panels[0].Text := 'Ошибка при подключении'
      end;
    except
      on E : Exception do
        //MessageBox(handle, PChar('Возникла ошибка в поключении к серверу. Попробуйте снова.'), PChar('Ошибка'), MB_ICONWARNING+MB_OK);
        ErrormessageOn('Возникла ошибка в подключении к серверу. Попробуйте снова.');
    end;
  end;
end;

procedure TFAuth.ELoginEnter(Sender: TObject);
begin
  ELogin.Text := '';
end;

procedure TFAuth.ELoginKeyUp(Sender: TObject; var Key: Word;                      //УДАЛИТЬ ПРИ ПОПАДАНИИ В ПРОД!
  Shift: TShiftState);
begin
  if Key = VK_END then
  begin
    ELogin.Text := 'admin';
    EPassword.Text := 'admin';
    btnAuth.Click;
  end;

end;

procedure TFAuth.ELoginClick(Sender: TObject);
begin
  ELogin.Text := '';
end;

procedure TFAuth.EPasswordChange(Sender: TObject);
begin
  ErrormessageOff();
end;

procedure TFAuth.EPasswordEnter(Sender: TObject);
begin
  EPassword.Text := '';
end;

procedure TFAuth.EPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  btnAuth.Click;
end;

procedure TFAuth.EPasswordClick(Sender: TObject);
begin
  EPassword.Text := '';
end;

procedure TFAuth.btnAuthClick(Sender: TObject);
begin
  with FDMySQL do begin
    Connected := True;
    with FDQuery1 do
      begin
        Active := False;
        //ClearFields;
        sql.Clear;
        sql.Text := 'SELECT `login`, `password` FROM `users` WHERE `login` = ' + QuotedStr(ELogin.Text) + ' and `password` = ' + QuotedStr(EPassword.Text) + ';';
        Active := True;
        First;
      end;
      if FDQuery1.RecordCount <> 0 then
        begin
          DBUserName := ELogin.Text;
          StatusBar1.Panels[1].Text := 'Пользователь: ' + DBUserName;
          //Если авторизация прошла успешно, то лочим значения в полях
          ELogin.Enabled := False;
          EPassword.Enabled := False;
          btnAuth.Enabled := False;
          AIAuth.Animate := True;
        end
        else ErrormessageOn('Неверный логин пользователя или пароль');
    Connected := False;
  end;

  // ПРОВЕРКА СТАТУСА АККАУНТА

  if DBUserName <> '' then
  begin
    with FDMySQL do begin
      Connected := True;
      with FDQuery1 do
        begin
          Active := False;
          //ClearFields;
          sql.Clear;
          sql.Text := 'SELECT `status` FROM `users` WHERE `login` = ' + QuotedStr(ELogin.Text) + ' and `password` = ' + QuotedStr(EPassword.Text) + ';';
          Active := True;
          First;
        end;
        if FDQuery1.RecordCount <> 0 then
          begin
            DBUserStat := FDQuery1.Fields[0].AsString;
            //StatusBar1.Panels[2].Text := 'Роль: ' + DBUserRole;
            if DBUserStat = 'active' then
              timeAuth.Enabled := True                                                              // Точка удачной авторизации перехода на другую форму
            else if DBUserStat = 'inactive' then
              ErrormessageOn('Аккаунт отключен администратором')
            else if DBUserStat = 'banned' then
              ErrormessageOn('Аккаунт заблокирован');
          end
          else ErrormessageOn('Возникла ошибка при проверке статуса аккаунта.');
      Connected := False;
    end;
  end;

  // ПРОВЕРКА И ВЫГРУЗКА РОЛИ

  if DBUserName <> '' then
  begin
    with FDMySQL do begin
      Connected := True;
      with FDQuery1 do
        begin
          Active := False;
          //ClearFields;
          sql.Clear;
          sql.Text := 'SELECT `role` FROM `users` WHERE `login` = ' + QuotedStr(ELogin.Text) + ' and `password` = ' + QuotedStr(EPassword.Text) + ';';
          Active := True;
          First;
        end;
        if FDQuery1.RecordCount <> 0 then
          begin
            DBUserRole := FDQuery1.Fields[0].AsString;
            StatusBar1.Panels[2].Text := 'Роль: ' + DBUserRole;
          end
          else ErrormessageOn('Роль не найдена.');
      Connected := False;
    end;
  end;
end;

procedure TFAuth.FormCreate(Sender: TObject);
begin
  DBUserRole := '';
  DBUserName := '';
end;

procedure TFAuth.iEMClick(Sender: TObject);
begin
  ErrormessageOff();
end;

procedure TFAuth.LErrorMessageClick(Sender: TObject);
begin
  ErrormessageOff();
end;

procedure TFAuth.timeAuthTimer(Sender: TObject);
begin
  AIAuth.Animate := False;
  timeAuth.Enabled := False;
  btnAuth.Enabled := True;
  btnAuth.Caption := 'Войти';
  Hide;
  FMainScreen.Show;
end;

end.
