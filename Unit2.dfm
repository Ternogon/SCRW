object FMainScreen: TFMainScreen
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    #1055#1072#1085#1077#1083#1100' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' // '#1057#1050#1059#1056#1057' '#8212' '#1057#1080#1089#1090#1077#1084#1072' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1091#1076#1072#1083#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1095#1080#1093' ' +
    #1089#1090#1072#1085#1094#1080#1081
  ClientHeight = 619
  ClientWidth = 857
  Color = 2697513
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 55807
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 857
    Height = 89
    Align = alTop
    Brush.Color = clBlack
    ExplicitTop = -6
    ExplicitWidth = 859
  end
  object LUsername: TLabel
    Left = 652
    Top = 24
    Width = 178
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '#Username'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 55807
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LUserrole: TLabel
    Left = 798
    Top = 44
    Width = 32
    Height = 17
    Alignment = taRightJustify
    Caption = '#Role'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 47063
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object PStats: TPanel
    Left = 0
    Top = 89
    Width = 857
    Height = 90
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 859
    object Label1: TLabel
      Left = 32
      Top = 64
      Width = 103
      Height = 15
      Caption = #1040#1056#1052' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 55807
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 168
      Top = 64
      Width = 76
      Height = 15
      Caption = #1040#1056#1052' '#1072#1082#1090#1080#1074#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 55807
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 288
      Top = 64
      Width = 130
      Height = 15
      Caption = #1053#1072#1088#1091#1096#1077#1085#1080#1081' '#1074#1099#1103#1074#1083#1077#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 55807
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 720
      Top = 64
      Width = 121
      Height = 15
      Caption = #1040#1082#1082#1072#1091#1085#1090#1086#1074' '#1074' '#1089#1080#1089#1090#1077#1084#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 55807
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object clAccs: TLabel
      Left = 720
      Top = 18
      Width = 121
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 55807
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object clViolations: TLabel
      Left = 288
      Top = 18
      Width = 130
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 55807
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object clActAgents: TLabel
      Left = 168
      Top = 18
      Width = 76
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 55807
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object clAgents: TLabel
      Left = 32
      Top = 18
      Width = 103
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 55807
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object clUpdateTime: TLabel
      Left = 1
      Top = 1
      Width = 855
      Height = 12
      Align = alTop
      Alignment = taCenter
      Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1086': #time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6052956
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
      Layout = tlCenter
      OnClick = clUpdateTimeClick
      ExplicitWidth = 72
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 179
    Width = 857
    Height = 454
    ActivePage = TabSheet1
    Align = alTop
    MultiLine = True
    OwnerDraw = True
    TabOrder = 1
    TabPosition = tpLeft
    StyleElements = []
    OnDrawTab = PageControlDrawTab
    ExplicitWidth = 859
    object TabSheet1: TTabSheet
      Caption = 'U'
      object Bevel1: TBevel
        Left = 636
        Top = 320
        Width = 170
        Height = 113
      end
      object LSUName: TLabel
        Left = 255
        Top = 3
        Width = 389
        Height = 25
        AutoSize = False
        Caption = '#NameUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 55807
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object LSUStatus: TLabel
        Left = 269
        Top = 26
        Width = 84
        Height = 15
        AutoSize = False
        Caption = '#Status'
        Color = 2697513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 55807
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object LSUOS: TLabel
        Left = 695
        Top = 400
        Width = 107
        Height = 17
        AutoSize = False
        Caption = '#OS'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 55807
        Font.Height = -13
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object LSUIP: TLabel
        Left = 641
        Top = 327
        Width = 122
        Height = 17
        AutoSize = False
        Caption = '#000.000.000.000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 55807
        Font.Height = -13
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object LSUPCUser: TLabel
        Left = 641
        Top = 342
        Width = 161
        Height = 17
        AutoSize = False
        Caption = '#PCUSERNAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 55807
        Font.Height = -13
        Font.Name = 'Segoe UI Semilight'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object ISUOSWin11: TImage
        Left = 641
        Top = 375
        Width = 60
        Height = 53
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F98700000006624B474400FF00FF00FFA0BDA793000000
          B84944415478DAEDD7B10DC2400C85615F9D556E0244104D0A26CA0A84613200
          ED41919E6C427F9C1406E0124796D1FF0A972FFE225DE120CE13AC170060BD00
          00EB05F603F4AF6799870DDD0F1962BB74CD7791DCA9745500F2E6DF33C4F0ED
          7A97D9A8740100000000000000000000E00290CA3CAEFE609024D7785ABAE6B1
          DC03E7D55D5926B9C54B1DC049FE18A07A522A765500341FB15E170000000000
          0000000000002E008A27A562D7CF002701601D00D6710FF800E2FCD731E61E72
          0B0000000049454E44AE426082}
        Visible = False
      end
      object ISUOSWin10: TImage
        Left = 641
        Top = 375
        Width = 60
        Height = 53
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F98700000006624B474400FF00FF00FFA0BDA793000005
          794944415478DAED99FB6F154514C7CFDEEB4DF42A7D00620079F4DE2D581E6D
          41A305140195C41F8C82FABB8F88A2A228888868883111634C638C31467E1144
          40C37FC04329EA2F8428DADB521128429F2055140977778E6777EFEE9DD99DDD
          3B7BD3B4D574D2ED3EE6CE99F399F33D33B3590DFEE3451B6E07460186DB8151
          80E176C05F1E3882E30D2DAF270075A6412D9A9041860379936D3DB0307D6E44
          00AC3881139279D04D30C9414D47CB59863A22D08155C800E85C38E89A21D05F
          CBBEA6EB160F19C0CA1C4E4C2441A71E9C8381AED199394E56584ED9CE714E7A
          D7F48FF110CEB5B16F413A35A8000D9F9D9FCC52791D0D8D1C633A9073B9C726
          3D6AD53DD261B9E22BF484714E464208753610EE5F984EC40698BB73A03A95CA
          6750D366939559643743763368E20C323C06ED5E8A9DB73D3E590B03E0469393
          060F14940E078BFB175DAF06307FEF852672B0996A1BE9F65ABB735F88DD7BF0
          8D5CFB137200A551974BC7ADC303AA00F3BE3ADF41A75AAF7389F3807C47C5BA
          E34FDE1C00101CF643448DBA000478F04E7500E6D6F93B015F07BE3043C75353
          8200BE5167810189948E17818377DD100F80370E81B0FA3BB63C03E8582502C8
          47568C2A0B0C8A3462F8F5E21800D450733B923ACF39015CDD2F4F4FF500A29D
          0A1F75264976CBDA37778F510368FCB2DFB2A14148E28A6062DD8967A6150104
          A764B95472D4F9B67868892AC09E7E931A26825A74EE41A27DB7EED7D50EC0C3
          C71906F5CC25A72461A320A80E0F2D550468D8DD6752E384CC78C0799F63279F
          9D6EDB5CD9CE30B674A2A7586C595AA10650BFAB970020C13BE8E54148E8DDFA
          93CFD538006D0E805CCFB1A4E34DA387972902CCDDD9EB4848B25015AF0B7262
          22D8A9350EC08A9C89D14E854084E7091EBEA7520D60CEE73D06FD3E09528332
          E78B75A75FC8D8361F6A35B1F4E255D81BA9ED89F0DB7B5501763800B285CA4B
          E29044EE7C316BDB7CB0954C94211D5172425BFCEE3E4580D9DBBB1D009F8361
          DB073E4F3AD716007E3650702A7C858D940E0784DF2FAF8ABF1B1DE9E5FF0970
          D3DBED069D92810A2EC4E0CB07F7FEF777EA6D9BB41D41BAB8448F0CA7A94F2A
          B6E45870666345FBFE043FF57CCDD8F200509CEBF919080420848BEF367A00FE
          F682F605A7959EE1E93519B51CE00164A3CD2F6CE0031A786F5E0040BA8E843E
          1307848B0AD2141D03C09E46A3E5C247050AA1FFE3FDF9024070E596ACEEB27D
          55F019D214AD0630E1ADB60240B45CF88D9D1B893F9B6FF500C48D1F86C0A8C8
          C989C099B58A00376EC9150122E4C26F35DCBA4B1FDC56049039AE20270889C0
          9997743580F16FB67A005172E15F66DCBABF3EBCDDB649EF1418261D7157AB1C
          15FCED654580719B7F22004896928B2CA9FFFEE80EDB66C39E7E84C808C48B8A
          1581B3EB6AD500C66E3AE62571945CF85174F3E3F2C74D0EC0EE3E9427677854
          FC03E64B683CBB5E11A07AE38F9C84C2E5C2EF565DA87F3E5960DBACDFD5179A
          0380B1A4E345E0DC2B33D400AA36FCE00094900B704EB8CFAE7CBAC801F8A257
          1E81F8D2F122D0B54111A072FDD14E1ADDA9A5E452CC89C23D952BDB1C007A29
          C212F3BA544E101E15EC7A75A61A40C5BAA3F783C9B651E3495172F100B8E202
          D04B11864903E226B4F31CBB37DE126F3B5DB9FA58753E753993605A064D9641
          3A8386D607870C19AD010CB6F70076F42844402631B99CAC9D5DF76B310122CB
          AA239569C867D1C42C59C95237F699726099554D2F45189E9C2A5B8BC0EFB067
          53DDD0BDD0CCD9DE556798A86B4C2338D3FAB0912587B2E4CD74722655C6FA60
          F4BE5E37B81F38CA294BB6E035DDE33AA75CD5349DA62927720C2D38EBCB4D96
          8EB4340226B6F4BD316BE83E31955BA635E7265ECD2769CFA06599C1B2F4CA53
          438F2F1A2CB1F5C2E69923E323DF60965180E12EA300C35DFE05567D54D694E9
          BE0A0000000049454E44AE426082}
        Visible = False
      end
      object ISUOSWin8: TImage
        Left = 641
        Top = 375
        Width = 60
        Height = 53
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F98700000006624B474400FF00FF00FFA0BDA793000001
          554944415478DAEDD8DF4AC3301406F073D254502A28EC42C67AD3F44670EFE0
          53381FC7D7F00164AC4FA74C61C3A59F2753BC72C5D549D2710E8404FA27DFAF
          4D2F1AA68117C70EA080D80114103BC071019E9E2FF33CAFDAB6ADC05C315091
          F424BDBF3F776900768524BA9176B5EB323F2B7ECCFA6F003B5FDE824DCD0427
          416B1064CC35118A3EF73B2CA041467E555AE3EB56429910520242C6EDAC9886
          53B2C52B0EF940F6073C22A7D1BAB49BCDF7ABC6D77A94A3D7D2CEBA268A0E90
          00EFD2D9BE13A500E81540010A50800214A0000528604075BC80C12F21052840
          010A50800214A0803F00A879A92D32D702CE103B1838809D5C10B6B94FD30774
          D5FC6D6CC93B64C631C2C62E07D4B6C944A3F401BFA86CB1BC0B3086C08C346C
          8193BE73A6F143D3E084B2F564DF1DEF74005DF50043D35569FD46BE35599AF4
          B934C1086FB112C045DA809EA580D8A580D83578C007B3FC4040542083F10000
          000049454E44AE426082}
        Visible = False
      end
      object ISUOSWinXP: TImage
        Left = 641
        Top = 375
        Width = 60
        Height = 53
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F98700000006624B474400FF00FF00FFA0BDA793000005
          584944415478DAED996D50545518C79F73F605261635610419F165E98BE3402F
          92384EC8024E33243856032C81E58C35F6A5699AC61885701130EB43D367726A
          C68C16F18D41C3466517B044D414A7893E24051399A2968AF1B27BEFD3FF0A35
          7D08760F4BB33471660EE7DC7BCF739FFFEFDC739EFBDC45D07FBC88700B9805
          08B7805980700B980508B780B00270D1232B88B51CD2653A094EC6A97854494C
          B771E78B688F9345D6894FBFBF3BA300B820692309BD02E68F0731FC366A39E9
          3DB5A281B499015068BF84E6314533B7A8EF290A3B00972C59483E53BFB2ADA0
          4AE1EE71951D7D3A7160D1AD5F6A532FFAC203E05CB68558EC55F7A4AF16EE1F
          CF953765D5E268AD14FCFAAE5CCF1781CCB61FCE8E315B29A72AF7F4FEE90128
          B41F44F3BCA2D94D5ADE13275CA4973765F6C16DE2F8F94EF4EB84D0CF98987B
          6988867D56EBC364F12F235DAC86370704660B219A01B03164007638CC14D737
          80EE3CB5D9A7FD583E9BDE3EBE2E9975FD8AEAA409C15BAB723DB5A103E42FCD
          2029BDAA02E0A5180075654DD96F09E27755CD59D2D29AF52DBDA10314D8F7C0
          A254D1BF46A3D63871E4BB5B583E1EB87428DA7F539DD7923CF1DCA80014DABB
          D0A428B9177C56B87F58E3FA3C678E5F1BB98933162573E2F7AAF23CA5135F0F
          56BC333181D8F2932A34167085705FAD2A3F96F91CA2D72125DB07456656E79D
          F24E03C084E1F30EAA0DD534818727B1FE2F9435657D08672F2BAABF671E8A89
          7515348C860E30163E9F417E730247CD80E9A081C5DDC2EBF5733EC49B92F084
          28D318897139E3F7BE8EF09930163EB38C4DB858493ED3E1EA0D2D93866C0580
          2427E9DC2C1A7AEE041C9B9FB4924CFC017A57B1FE37EF68CC4E9192BB1467DF
          10F74A555ECBDE006314CA01B69AB57B69BA34A50BE615C83B13F1242484FE86
          CD86FC884FF80BE77C393679B877C99278B1BFF75AF9B1AC529CD8A30A6026B9
          C49577AA2F64006BDD608A26C5AB8828C6F2983FE9EC1375219F7EC35F18EDF9
          F31C96CF3E349B14F55F41F87C34D0A0A0004C07063BA02C4DC5BB607ADFEFB4
          BD69F45D1E87D93F68DA0ABC5D812660BC5C62E6CA9A0D9EC6D001EAEEC69A4C
          F23A191F2A4A005CE3774697B3272A9E1CF76F08417AE9C975732D43EC443F8F
          895762581CAA8ED13770FC2DFA5E96FAB1DDEBBD9783F61370F6DD83C5462EA3
          227EECC6FA53C67EE0B6885AEC9327505F138EA1B3C1D8F257345FAC79F02134
          0D00F58386F86245FDBF6A0BA2162097D4A82DC2D8848B0C5DF0761A59661D31
          B753F448AF48251F5FC09BF94E640259747C20C955B8968391578563243F7400
          174BD3F2FBD7D05BA008E0D60A6D45DC664DC1CC4F163E875123FF41D6169131
          FC51C80096CF7E47C8D43B14C51B73FD92E6B4ED03C07600EC56B6F6CB44913D
          D41F3280B9FE9E0BCF7DA7A2005DD328815EB05DE7D688361CA72BDA5F161923
          C1FC58101800EBFF1C9A558A023AB17CD2F824CD256B84F1F1A3947DE289BD23
          1CC33B4207986AF824AEC44BCCC5ADD6021CD52BC21B006B01D01E32C054C3A7
          1432CD57F050277BAD1F2395DEAC687E97A246628DE8143A40FDE027684A10D6
          7A300C6B5918394EBF947483359EC752D8712D1D229FC5B4D9C6CD06B4EEA878
          DE89F7705B84B109172AC9673A186CF80C08200FDCAF30913861CCE6A477681C
          88360F476EC366DF06010D883E2FB2C7928A6FE7F38AB34F2AE1332080723934
          6CB7F8B4189F33EA3C964F059E4CA5E21D94C2E7F403FC5D499B751F36A35AF6
          C9D485E5A3FA73E5BF04C0885CAD915B90D1192FB1D8204CBE8651B5708C1E99
          11007F819CA168D2220B202E179E8CECD348A5F1C9403FE3AF917DB603B25964
          8C764FD5C7FFFB1F1C33A1CC0284BBCC0284BBCC0284BBFC01647FFA409D198C
          CB0000000049454E44AE426082}
        Visible = False
      end
      object ISUOSWin95: TImage
        Left = 641
        Top = 375
        Width = 60
        Height = 53
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F98700000006624B474400FF00FF00FFA0BDA79300000C
          544944415478DAED590B5494D516DEE7FF67061886970229A9A0A880E50B5014
          75F9C847D65524A392BCD6D5AEA8696AA52BBD59F444D3F2BAEC6699EF84BACE
          5553AF953D7C2B188219990A2E5F083E1001E535C3FCE7DCEF1F06668021A2EE
          BAD85AF7B88639FF79ECB3BFBDBFBDCFFE47467FF0C65A5A81FF03686905FE27
          00A6CE99D356669AFBEEF132EC4D4C4CE42DAD74F3013CF77C220911B97AE5F2
          3FB5B4C2BF09404D8B8B4BD479FADE9AC02476EF9A7FAC78BBA5956F368029D3
          67C609C1B660D3AAB51FAE9CD1D2CAFF2A00776226CC20C17EF2D8997270F2F4
          E99DAAAA984BA587CB45E3F2E5152DAD7C93004AC64EECAC617C836034D3F079
          CA0F8E73932627AC138C0D47B734B77D9B1EFB13132D771D00C75636263E8664
          1ACE14963CD957972793E60286657CDE648CB2B8A004086B4D24BE4D5EBFE6C5
          BB0A80888B93CBCCDA8BE87A98CCACC33483B952ABF5754F495955AC4E4F9834
          E5277CDF675D2CD16852484B12F36542F893A04B299FACFD4C9D8A9B3AD5CBB5
          82B722D29429CCDC8333262462C55CE657433B74B8F65B5274A300CAC64D1887
          807DC2BD247FA2FA7CDBCFCFD3CB68BC6505347AB44B89E4A397741AE9193D0B
          658C7D8161154C0E13046A51722D78C19E869EAFA1DBCEE6B10A805A889397D7
          3BD20C754E09218E02D47EC55CBADB68343619678D02B8336EC27859485CBF23
          797B1D6031F10F09A2DDD5CAD17804F736C7F9B8F8497B313FD4F658C0482C10
          C4D638F8731323168C35039AD0ED0ED66E5724F1DEF6CD9B4F361B40ADC28F4C
          6CCB15F12F08BBE1B123251659691B2C34020AE40B9DCB406636ED831895FB7A
          A38E06EF94583284DE8492D705E3F08C34054807D61EC84402BCF251D3E4B023
          C6BF2F6441F38DC6E49F9B0DE0CEB8F8E9E03252292D31ECFC74739DB9B1F133
          11C02B6D82B6C2FD6B84C4FA499CFC39136DCECAF2B3AB4889ED2E9112C699C5
          9F8BC2538C4DF7241A5923A3181BAFE1731DDCBB0261261CD448ABC221CBBCF5
          2EAF6FD8B0A1B25100717171864A857DC3047B6FE7F67F1A1DE72AC7C777B258
          A813AC68D0F70AD9599E99FD3E8E6B0F31C592863E84A7D4F56D6D763B00E999
          E8CDADD96F96C47C93608B3D0442BD5E53F099255BA808DF165F1762959CE4D2
          2A6740323953E2766FDD7ADE298091B1B1FE1A92FBBA6BD87E04512900E9302C
          6F311A2BCB63E2B3A17067ECDAEBEE6F78B0B4A8C89B5768BDD57D92CC7A82EF
          76C0423C0DF14BB1D6CF3652718044F26062CF38D32A9D382D63D55749515C47
          32757027D7B32564387C8334C5A6FACB8B88F3F1BB776EDBF78B141A3D367623
          BE262158076D21D79BA88192B0A10CCF6BF1FD24949B526D05F12A785D020674
          81E50BB84437C088324C6DB489C235C13E3E272C8F7761B2B7B3B31623096508
          85B8970B154E0DC3E56FDFA94F2F20C3A1ABD6BE232170465CA300860C19E2EA
          A2F7FA14517765CFEECF6739CEDD00CDF4666D3EBA1EAAF72549334808CB8B30
          A23F0EF6C3C7C8B994A62111C0896998B0B8EE91948B2349BBCDD981B7B031C1
          5241EA25503E3880CAA3DB3458A3BD709B3CB75D206656EC4E26CAAB2B6F41F6
          7292C4507A2BA497E3F0A851A35A2992E6512CF6017D0FECD0BA9B84244DC473
          B1E0741E0A77437F61CD7A2EB13112173B1D289A95CA2D95FD254D1F67C6DAA2
          9828051F5C7E5432B327710FAD53A31A3ECD26EDF9128711B6A42E804539F721
          D2EED092E0CB34FF8C0749921F2DEE7AFE8151A35F004596A94B24CEBA090DF3
          E642B49204F76E6F66DFBDEFE59D81A9009B555291420FA337AF46AC49881770
          232DF566AC41F0AAA448A8BC4DD760094B880F953DDED5A9F2D26D1379AC3869
          BD7C6AEDC45917E7145A706600A8A32A91426F873E3978F8C8B950EA1E24E44B
          82E4348978A6EDF0FC8FF43E7DDA913CA29029653F582CDCA0954F4609F9A84A
          2F08CF53D7ECB5984F0FD3E8129C1D7542A9A24500A0B68AF830B274F571AA92
          6E5F2EB91CC87500CEBE3EF0ED57A3EC0016E40CC6DF024AEAF2332D38FB149C
          DF17B96D352D09A9730B0E1A3AF20304ED741B80B7D10F862B63F0E84A6AC5A1
          D58ED40A2532CFC25B41F83D88C6F4E506EFE521B2C6A9664915B7E9509589B8
          A70B55BC18A9DE740D172178DDDE3D6EF58283EFC61FDCF7AD2DA65E3E13429C
          1D827B622929F4483D6FA899A607A9B54A52E8BCE8C1C366E10C3892E10E52CE
          9090D2A8BAC65109BFCA9A668946D4B25488A790BD36E85582AB3CC6E6D69244
          81B296022599D654DC2135DB5B86069265789073FA9CBE49BACDA71C87F2B58C
          07EEDFBFDFD210EE82D35D61855E48EC19A4D11492D9940735F498C18DABAC26
          21F7C6BC37CC7FA1FFE1BF2228D92BB5CA127B5410DF829E8DEBE247F4BF46A7
          C9F25A896C4B7C482089D66E0DE6341B4E9274F696C3087B23F5D0BE576C46AB
          D7169E4140B2EE101988591D141E013396C04C4748C3B662453F9B691F0B4F5F
          5058EAD1C5B3D0E37EA9DC3DE06A8FCCD707208BFD19E0AE60C50D8BECB6A3B0
          4DF426A45135DD925C55463A7309B9565C27ADF9764314AA6BC3DB92320AACF4
          76A91E2AAA2079F151C7E0552C92E89471F8F065EB7C6474F4FD88E688EFD38E
          6CA4B9B96EE45AFE18C6CF5352C8A13AC2179DEE8E8CFFA3EDE92692F6541404
          F64A94D3B378564BE67B01AE0DB8EFED977F24B52060C06C6716F72ACCA2AE27
          AB2B6A2F83854A4A35F649372D899810129101C4F69C23F6CD793BF319DB7D3C
          F570EDAF232CBC4F3FB5402BC94C4F7BB6CE092F9D8E006DDF051B0CD0EE0D95
          32B0501840149146B98424F60EC48DB5AD2E23599A460AFFC4C19CEBDC4BCEC5
          947905B7760620F0D45A6A9D7F907C3CABE8DF2B4ED0F1539E94B2A72D1DCBF2
          B24B18D6894406185C52A794180B5D77D9696B6B1111117A2E6B272198CD278E
          A7AEA385D96BA1E0644C9592590E269DB214CFC824E03FB1E7D04FAFA63D3217
          179B0114B413A36AE47914E52494FA047FE4A46E2359A9A4EE079F23C962A289
          0F5FA5D9132ED5CE7D0F004B3F09A28BF90D63012D3738A87D47D4684A0300F0
          C4D3F85A8F919733BF4F7B0B69B51B7857494C2981720F93BDAE390816CE20AD
          2E8CB8E28AF5BEC4E45D28AE365AA945E0BF60177D0A8EC516F9F78D76A685EF
          95BDD4E1F4466BC6DCB2E4240505D47DF1AA3449B4787D47DA7DD8AFCE3822E4
          958CF4636FD41DB3B5C8C80121A8E7510E9A2E67646454D9BCE2857E092D3CAB
          C6C340DB8E49A0D3EBE805559392B2A0C96274D4BB40BD8DDBCADCF48E64A95C
          55A5F36A687EB4D06389A4BF7D817A87DCA1D58B4E395B42F9375D68DCDCDE0E
          B14B1645C3824EA6A6E63905E0D8C2FB4421EC597F7433C1B7087A29BB13B956
          E19DB75B31559E1D89D8F8D22E81CDC629F3490DDEEA56D6EADAD18F6FB5899E
          E34CB65B692E85A5BE6CEDBF36ED1C3D34F0A65300AB8CED69DD8E7BED03427C
          9E79FC586CFD750D004444F40B17126558F7309ACE38B981C68FC0D2DE58FD59
          E6F04D3D91650621EB1460C97508DE00408E6F6A6BDC8B73C6957977F175A658
          FB339BC82FF73B32E815FA726506B9BA34FC2142E18CC6CCEE4D05453A475547
          67A6A77ED52480A8A8284FD550E55AAD59575181AA53AB46986F355BA4C11213
          ED487094CCCC1F11FC43C6031B4388F1308802189EEF732DF58CC93D60574D49
          C0251D99F46A4521A31034237867E33E28A7B811D768FE53179D5A7FFFF15634
          EFEF5D1D95BC90919EA6DEF0BC49008EAD5764548C24B115D88640A62C04D14F
          282192ECEC614F226E9E400FAF9142E57F1E507E8DB57F7394A32AAF82B0E80C
          6428CAB68E6D7E338B4282CA9C9E3B6B4928A565D9DF7B60A88519E9A949CED6
          36E7C75D16DEB75F3614EC6C53EB2C107C86E757ED9A8A991853DF0B029A1236
          ACEF2DFACB983C0AED5817841ABCB1CFF74652AB1DAA62BC2A10C9E4EAEF0210
          1E15D5039E7807AF71D71123D7254EDF7066FDBDA7834D52A9E06206BCB2A919
          46A1FE3D8A6976FC650A6E576E7DFE00C1BBDE3178898C48248F356AD5E61CE6
          D87AF5EB17242B340DF186D73A7605E5488E42A2BBC47867002B40158A297243
          ACF8C04BB853E87E9C16E64C96562328E1D15C8A7FF02A8D9D134E378BED6F64
          A0ECF013E9A9DFFDD701FC96D6BB7774A0A4E13148EDEA0DDFB3FE7C97F6E594
          93AB771CCA81F543881AFFB1A8A5FE938F4546468D86A7D40B31A271E5C43CDC
          BCCB7E51500B01A869122ECD67A0C67BE8BBD79B330B8BB6DD8913870AEE6600
          D61611D1BFBB90C52E1025D0613819F499D8D4DEBB0280DAFAF4E9D346210DCA
          6411A93EAB97E689F4A307FF3000D4A6168FB8F9F7A1EB06EB77A35F08DEBB12
          80DAAA3D214703C0B65FB3FEAE03D0DCF68707F01FB5BFCEBC6B57571A000000
          0049454E44AE426082}
        Visible = False
      end
      object ListBox1: TListBox
        Left = 3
        Top = 3
        Width = 246
        Height = 390
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 55807
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 15
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        OnDblClick = ListBox1DblClick
      end
      object ListBox2: TListBox
        Left = 195
        Top = 3
        Width = 54
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 55807
        Font.Height = -8
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 11
        ParentColor = True
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object LBActionLog: TListBox
        Left = 255
        Top = 320
        Width = 375
        Height = 113
        TabStop = False
        AutoComplete = False
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = 2697513
        ExtendedSelect = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 55807
        Font.Height = -9
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemHeight = 12
        ParentFont = False
        TabOrder = 2
      end
      object GBFunctions: TGroupBox
        Left = 255
        Top = 47
        Width = 547
        Height = 258
        TabOrder = 3
        Visible = False
        DesignSize = (
          547
          258)
        object Label9: TLabel
          Left = 33
          Top = 80
          Width = 171
          Height = 15
          Caption = #1055#1086#1083#1080#1090#1080#1082#1072' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1087#1088#1086#1094#1077#1089#1089#1086#1074
        end
        object Label5: TLabel
          Left = 33
          Top = 17
          Width = 87
          Height = 15
          Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1072#1075#1077#1085#1090
        end
        object Label6: TLabel
          Left = 33
          Top = 38
          Width = 125
          Height = 15
          Caption = #1054#1090#1089#1083#1077#1078#1080#1074#1072#1090#1100' '#1082#1083#1072#1074#1080#1096#1080
        end
        object Label7: TLabel
          Left = 33
          Top = 59
          Width = 155
          Height = 15
          Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1089#1082#1088#1080#1085#1096#1086#1090#1099
        end
        object Label8: TLabel
          Left = 281
          Top = 17
          Width = 81
          Height = 15
          Caption = #1057#1085#1103#1090#1100' '#1087#1088#1086#1094#1077#1089#1089
        end
        object Label13: TLabel
          Left = 33
          Top = 101
          Width = 187
          Height = 15
          Caption = #1055#1086#1083#1080#1090#1080#1082#1072' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1074#1077#1073'-'#1088#1077#1089#1091#1088#1089#1086#1074
        end
        object CBAgentEnable: TCheckBox
          Left = 14
          Top = 17
          Width = 13
          Height = 17
          Checked = True
          Color = 2697513
          Enabled = False
          ParentColor = False
          State = cbChecked
          TabOrder = 0
          StyleElements = []
        end
        object CBKeylogger: TCheckBox
          Left = 14
          Top = 38
          Width = 13
          Height = 17
          Color = 2697513
          ParentColor = False
          TabOrder = 1
          StyleElements = []
        end
        object CBProcess: TCheckBox
          Left = 262
          Top = 17
          Width = 13
          Height = 17
          Color = 2697513
          ParentColor = False
          TabOrder = 2
          StyleElements = []
          OnClick = CBProcessClick
        end
        object CBScreenshotsPeriodic: TCheckBox
          Left = 14
          Top = 59
          Width = 13
          Height = 17
          Color = 2697513
          ParentColor = False
          TabOrder = 3
          StyleElements = []
        end
        object CBProcessControl: TCheckBox
          Left = 14
          Top = 80
          Width = 13
          Height = 17
          Color = 2697513
          ParentColor = False
          TabOrder = 4
          StyleElements = []
        end
        object ECProcess: TEdit
          Left = 368
          Top = 17
          Width = 160
          Height = 18
          Alignment = taCenter
          Anchors = [akLeft, akTop, akBottom]
          AutoSelect = False
          AutoSize = False
          BevelInner = bvLowered
          BorderStyle = bsNone
          CharCase = ecLowerCase
          Color = 5987163
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 55807
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = 'chrome.exe'
          TextHint = 'chrome.exe'
        end
        object Button1: TButton
          Left = 14
          Top = 216
          Width = 144
          Height = 25
          Caption = #1057#1076#1077#1083#1072#1090#1100' '#1089#1082#1088#1080#1085#1096#1086#1090
          TabOrder = 6
        end
        object Button2: TButton
          Left = 14
          Top = 185
          Width = 144
          Height = 25
          Caption = #1042#1099#1075#1088#1091#1079#1082#1072' syslog'
          TabOrder = 7
        end
        object Button3: TButton
          Left = 164
          Top = 185
          Width = 137
          Height = 25
          Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1086#1074#1072#1090#1100' RDP'
          TabOrder = 8
        end
        object BCProcessDown: TButton
          Left = 282
          Top = 41
          Width = 249
          Height = 20
          Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 55807
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object CBWebControl: TCheckBox
          Left = 14
          Top = 101
          Width = 13
          Height = 17
          Color = 2697513
          ParentColor = False
          TabOrder = 10
          StyleElements = []
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'P'
      ImageIndex = 1
      object Label10: TLabel
        Left = 16
        Top = 3
        Width = 173
        Height = 20
        Caption = #1047#1072#1087#1088#1077#1097#1077#1085#1085#1099#1077' '#1087#1088#1086#1094#1077#1089#1089#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 55807
        Font.Height = -15
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 272
        Top = 3
        Width = 194
        Height = 20
        Caption = #1047#1072#1087#1088#1077#1097#1077#1085#1085#1099#1077' '#1074#1077#1073'-'#1088#1077#1089#1091#1088#1089#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 55807
        Font.Height = -15
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 528
        Top = 3
        Width = 195
        Height = 20
        Caption = #1040#1075#1077#1085#1090#1099' '#1089' '#1075#1088#1091#1073#1086#1081' '#1087#1086#1083#1080#1090#1080#1082#1086#1081
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 55807
        Font.Height = -15
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ListBox3: TListBox
        Left = 16
        Top = 27
        Width = 233
        Height = 374
        AutoComplete = False
        Color = 2697513
        ExtendedSelect = False
        ItemHeight = 15
        Items.Strings = (
          'chrome.exe'
          'logic.exe')
        TabOrder = 0
      end
      object ListBox4: TListBox
        Left = 272
        Top = 27
        Width = 233
        Height = 374
        Color = 2697513
        ExtendedSelect = False
        ItemHeight = 15
        Items.Strings = (
          '8.8.8.8'
          '4.4.4.4'
          '93.20.10.121')
        TabOrder = 1
      end
      object LBPAgents: TListBox
        Left = 528
        Top = 27
        Width = 273
        Height = 374
        Color = 2697513
        ExtendedSelect = False
        ItemHeight = 15
        TabOrder = 2
      end
      object BPUpdate: TButton
        Left = 16
        Top = 407
        Width = 785
        Height = 25
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 3
        OnClick = BPUpdateClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'L'
      ImageIndex = 2
      object DBGLogs: TDBGrid
        Left = 5
        Top = 2
        Width = 820
        Height = 440
        BorderStyle = bsNone
        Color = 2697513
        Ctl3D = True
        DataSource = DataSource1
        DrawingStyle = gdsGradient
        FixedColor = clBlack
        GradientEndColor = 2697513
        GradientStartColor = 1184274
        Options = [dgTitles, dgColumnResize, dgTabs, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = 55807
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 824
    Top = 600
    object N1: TMenuItem
      Caption = #1054#1089#1085#1086#1074#1085#1086#1077
      object N6: TMenuItem
        Caption = #1042#1099#1081#1090#1080
        OnClick = N6Click
      end
      object N2: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = N2Click
      end
    end
    object N3: TMenuItem
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
      object N4: TMenuItem
        Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      end
    end
    object N5: TMenuItem
      Caption = #1056#1077#1078#1080#1084#1099
    end
  end
  object MFDMySQL: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=cw61131_delphi'
      'Password=delphiPass1'
      'Server=92.53.96.150'
      'User_Name=cw61131_delphi')
    Left = 424
    Top = 24
  end
  object MFDQuery1: TFDQuery
    Connection = MFDMySQL
    Left = 456
    Top = 24
  end
  object MFDQuery2: TFDQuery
    Connection = MFDMySQL2
    SQL.Strings = (
      'SELECT `username` FROM `agents`;')
    Left = 32
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = MFDQueryLogs
    Left = 256
    Top = 24
  end
  object MFDMySQL2: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=cw61131_delphi'
      'Password=delphiPass1'
      'Server=92.53.96.150'
      'User_Name=cw61131_delphi')
    Left = 64
    Top = 24
  end
  object MFDLogs: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=cw61131_delphi'
      'Password=delphiPass1'
      'Server=92.53.96.150'
      'User_Name=cw61131_delphi')
    Left = 192
    Top = 24
  end
  object MFDQueryLogs: TFDQuery
    Connection = MFDLogs
    SQL.Strings = (
      'SELECT `username` FROM `agents`;')
    Left = 224
    Top = 24
  end
  object MFDQueryPolicy: TFDQuery
    Connection = MFDPolicy
    SQL.Strings = (
      'SELECT `username` FROM `agents`;')
    Left = 552
    Top = 24
  end
  object MFDPolicy: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=cw61131_delphi'
      'Password=delphiPass1'
      'Server=92.53.96.150'
      'User_Name=cw61131_delphi')
    Left = 584
    Top = 24
  end
end
