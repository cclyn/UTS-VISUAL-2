unit tugasuts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBXpress, FMTBcd, DBClient, Provider, SqlExpr,
  Grids, DBGrids;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    btnSimpan: TButton;
    btnEdit: TButton;
    btnUpdate: TButton;
    btnHapus: TButton;
    btnBatal: TButton;
    ds1: TDataSource;
    dbgrd1: TDBGrid;
    DBConnection: TSQLConnection;
    sqltbl1: TSQLTable;
    dtstprvdr1: TDataSetProvider;
    ds2: TClientDataSet;
    edtNama: TEdit;
    edtDiskripsi: TEdit;
    procedure btnBatalClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnBatalClick(Sender: TObject);
begin
  edtNama.Clear;
  edtDiskripsi.Clear;
end;

procedure TForm1.btnHapusClick(Sender: TObject);
var
  Query: TSQLQuery;
begin
  // Create a new query to delete data from kustomer table
  Query := TSQLQuery.Create(nil);
  try
    Query.SQLConnection := DBConnection;
    Query.SQL.Add('DELETE FROM satuan WHERE id = :id');
    Query.ParamByName('id').AsInteger := StrToInt(dbgrd1.DataSource.DataSet.FieldByName('id').AsString);
    Query.ExecSQL;
    dbgrd1.Datasource.DataSet.Refresh;
    ShowMessage('Data berhasil dihapus!');
  finally
    Query.Free;
  end;
end;

procedure TForm1.btnSimpanClick(Sender: TObject);
var
  Query: TSQLQuery;
begin
   // Create a new query to insert data into kustomer table
  Query := TSQLQuery.Create(nil);
  try
    Query.SQLConnection := DBConnection;
    Query.SQL.Add('INSERT INTO satuan (nama, diskripsi)');
    Query.SQL.Add('VALUES (:nama, :diskripsi)');
    Query.ParamByName('nama').AsString := edtNama.Text;
    Query.ParamByName('diskripsi').AsString := edtDiskripsi.Text;
    Query.ExecSQL;
    dbgrd1.Datasource.DataSet.Refresh;
    ShowMessage('Data berhasil disimpan!');
  finally
    Query.Free;
  end;
end;

procedure TForm1.btnEditClick(Sender: TObject);
var
  Query: TSQLQuery;
begin
  // Get the selected ID from the DBGrid
  if  dbgrd1.DataSource.DataSet.RecordCount > 0 then
  begin
    // Create a new query to retrieve the data
    Query := TSQLQuery.Create(nil);
    try
    Query.SQLConnection := DBConnection;
    Query.SQL.Add('SELECT * FROM satuan WHERE id = :id');
    Query.ParamByName('id').AsInteger := StrToInt( dbgrd1.DataSource.DataSet.FieldByName('id').AsString);
    Query.Open;
    edtNama.Text := Query.FieldByName('nama').AsString;
    edtDiskripsi.Text := Query.FieldByName('diskripsi').AsString;
      // Set the button text to "Update"
      //btnEdit.Caption := 'EDIT';
    finally
      Query.Free;
    end;
  end
  else
  begin
    ShowMessage('Select a record to edit!');
  end;
end;

procedure TForm1.btnUpdateClick(Sender: TObject);
var
  Query: TSQLQuery;
begin
          // Create a new query to update data in kustomer table
  Query := TSQLQuery.Create(nil);
  try
    Query.SQLConnection := DBConnection;
    Query.SQL.Add('UPDATE satuan SET ');
    Query.SQL.Add('nama = :nama, ');
    Query.SQL.Add('diskripsi = :diskripsi ');
    Query.SQL.Add('WHERE id = :id');

    Query.ParamByName('nama').AsString := edtNama.Text;
    Query.ParamByName('diskripsi').AsString := edtDiskripsi.Text;
    Query.ParamByName('id').AsInteger := StrToInt(dbgrd1.DataSource.DataSet.FieldByName('id').AsString);
    //dbgrd1.Datasource.DataSet.Refresh;
    ShowMessage('Data berhasil diupdate!');
    Query.ExecSQL;
    dbgrd1.Datasource.DataSet.Close;
    dbgrd1.Datasource.DataSet.Open;
  finally
    Query.Free;
  end;
end;

end.
