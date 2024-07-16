object Form1: TForm1
  Left = 222
  Top = 157
  Width = 1044
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 64
    Top = 56
    Width = 10
    Height = 23
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 64
    Top = 96
    Width = 89
    Height = 23
    Caption = 'DISKRIPSI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnSimpan: TButton
    Left = 64
    Top = 176
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 0
    OnClick = btnSimpanClick
  end
  object btnEdit: TButton
    Left = 152
    Top = 176
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 1
    OnClick = btnEditClick
  end
  object btnUpdate: TButton
    Left = 240
    Top = 176
    Width = 75
    Height = 25
    Caption = 'UPDATE'
    TabOrder = 2
    OnClick = btnUpdateClick
  end
  object btnHapus: TButton
    Left = 336
    Top = 176
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 3
    OnClick = btnHapusClick
  end
  object btnBatal: TButton
    Left = 432
    Top = 176
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 4
    OnClick = btnBatalClick
  end
  object dbgrd1: TDBGrid
    Left = 80
    Top = 248
    Width = 873
    Height = 209
    DataSource = ds1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtNama: TEdit
    Left = 208
    Top = 64
    Width = 121
    Height = 21
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    Text = 'Nama'
  end
  object edtDiskripsi: TEdit
    Left = 208
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'edtDiskripsi'
  end
  object ds1: TDataSource
    DataSet = ds2
    Left = 336
    Top = 8
  end
  object DBConnection: TSQLConnection
    ConnectionName = 'MYSQLCONN'
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbexpmysql.dll'
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=db_penjualan_fitursatuan'
      'User_Name=root'
      'Password='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000')
    VendorLib = 'libmysql.dll'
    Connected = True
    Left = 72
    Top = 8
  end
  object sqltbl1: TSQLTable
    Active = True
    MaxBlobSize = -1
    SQLConnection = DBConnection
    TableName = 'satuan'
    Left = 160
    Top = 8
  end
  object dtstprvdr1: TDataSetProvider
    DataSet = sqltbl1
    Left = 224
    Top = 8
  end
  object ds2: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dtstprvdr1'
    Left = 288
    Top = 8
  end
end
