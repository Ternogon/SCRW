unit UserInfo;

interface

type
  TUserInfo = class
  private
    { Private declarations }
  public
    function UserroleCaption(Role: String): String;
  end;

var
  DBUserName: String;
  DBUserRole: String;
  DBFullRole: String;
  DBUserStat: String;

implementation

{ TUserInfo }

function TUserInfo.UserroleCaption(Role: String): String;
begin
  if Role = 'admin' then result := '�������������'
  else if Role = 'officer' then result := '������ ������������'
  else if Role = 'acs' then result := '������������� ��'
  else result := '���� �� ����������';
end;

end.
