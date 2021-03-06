unit U_Frame_Ordonnance;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Rtti, FMX.Grid.Style, FMX.Layouts, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Grid, FMX.ListBox, FMX.Edit, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  System.Generics.Collections;

type
  TFrame7 = class(TFrame)
    L_Top_Ordonnance: TLayout;
    Layout1: TLayout;
    ComboBox1: TComboBox;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Layout7: TLayout;
    Button1: TButton;
    Button2: TButton;
    BindSourceDB1: TBindSourceDB;
    StringGridBindSourceDB1: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure Layout2Resize(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure OnDataLoad;
    procedure Insert;
    procedure ID(const RandD: String);
    procedure StringGridResize;
  private
    { Private declarations }
  public
    { Public declarations }
    Tub: TList<String>;
  end;

implementation

Uses
  U_DataModule, U_Main;
{$R *.fmx}

procedure TFrame7.OnDataLoad;
begin
  With Main do
  Begin
    With DataModule1.FDQ_Ordonnance do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Text :=
        ('Select Medicament,Dose,Prise,Jour,Pendent From Ordonnance Where Patient_ID="'
        + Patient_ID + '";');
      Active := True;
      StringGridResize;
    End;
  End;
end;

procedure TFrame7.StringGridResize;
Var
  i: Integer;
Begin
  StringGridBindSourceDB1.Columns[0].Width := 830;
  StringGridBindSourceDB1.Columns[1].Width := 50;
  StringGridBindSourceDB1.Columns[2].Width := 50;
  StringGridBindSourceDB1.Columns[3].Width := 50;
  StringGridBindSourceDB1.Columns[4].Width := 70;
end;

procedure TFrame7.ID(const RandD: string);
Var
  Rand: String;
begin
  With Main do
  begin
    With DataModule1.FDQ_Ordonnance do
    Begin
      try
        for Rand in Tub do
        Begin
          Active := False;
          SQL.Clear;
          SQL.Text := ('Select Patient_ID From Ordonnance Where Ordo_ID="' +
            Rand + '"');
          Active := True;
          Edit;
          FieldByName('Patient_ID').AsString := RandD;
          Post;
          Active := False;
          SQL.Clear;
        End;
      except
        on E: Exception do
      end;
      With DataModule1.FDQ_Ordonnance do
      Begin
        SQL.Clear;
        SQL.Text :=
          ('Select Medicament, Dose, Prise, Jour, Pendent From Ordonnance Where Patient_ID="'
          + RandD + '";');
        Active := True;
        StringGridResize;
      End;
    end;
  end;
end;

procedure TFrame7.Insert();
Var
  Rand: String;
  bol: Boolean;
begin
  Tub := TList<String>.Create;
  With DataModule1.FDQ_Ordonnance do
  Begin
    Active := False;
    SQL.Create;
    SQL.Text :=
      ('Select Ordo_ID, Medicament,Dose,Prise,Jour,Pendent From Ordonnance');
    Active := True;
    Insert;
    repeat
    Begin
      try
        Rand := DataModule1.GenerateID;
        Rand := 'O' + Rand;
      except
        on E: Exception do
        Begin
          bol := True;
        End;
      end;
    End;
    bol := False;
    until bol = False;
    FieldByName('Ordo_ID').AsString := Rand;
    Tub.add(Rand);
    FieldByName('Medicament').AsString := ComboBox1.Selected.Text;
    FieldByName('Dose').AsString := Edit1.Text;
    FieldByName('Prise').AsString := Edit2.Text;
    FieldByName('Jour').AsString := Edit3.Text;
    FieldByName('Pendent').AsString := Edit4.Text;
    Post;
    Active := False;
  End;
end;

procedure TFrame7.Button4Click(Sender: TObject);
begin
  DataModule1.FDQ_Ordonnance.Active := False;
  DataModule1.FDQ_Ordonnance.Active := True;
end;

procedure TFrame7.Layout2Resize(Sender: TObject);
begin
  Layout1.Width := L_Top_Ordonnance.Width / 2;
  Layout2.Width := L_Top_Ordonnance.Width / 2;
  Layout3.Width := Layout2.Width / 4;
  Layout4.Width := Layout2.Width / 4;
  Layout5.Width := Layout2.Width / 4;
  Layout6.Width := Layout2.Width / 4;
end;

end.
