unit U_Fenetre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Ani,U_Base_Form;

type
  TFenetre = class(TBase_Form)
    F_Accueil: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Fla_Accueil: TFloatAnimation;
    F_NouveauP: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Fla_NouveauP: TFloatAnimation;
    F_RechercheP: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Fla_RechercheP: TFloatAnimation;
    F_Ordonnance: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Fla_Ordonnace: TFloatAnimation;
    F_RDV: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Fla_RDV: TFloatAnimation;
    F_Patient: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Fla_Patient: TFloatAnimation;
    Btn_Accueil: TButton;
    Btn_Patient: TButton;
    Btn_RDV: TButton;
    Btn_Ordonnace: TButton;
    Btn_RechercheP: TButton;
    Btn_NouveauP: TButton;
    Label14: TLabel;
    ColorAnimation1: TColorAnimation;
    procedure Btn_PatientClick(Sender: TObject);
    procedure Fla_PatientFinish(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_RecherchePClick(Sender: TObject);
    procedure Btn_OrdonnaceClick(Sender: TObject);
    procedure Btn_RDVClick(Sender: TObject);
    procedure Fla_RDVFinish(Sender: TObject);
    procedure Fla_OrdonnaceFinish(Sender: TObject);
    procedure Fla_RecherchePFinish(Sender: TObject);
    procedure Fla_NouveauPFinish(Sender: TObject);
    procedure Btn_NouveauPClick(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Btn_AccueilClick(Sender: TObject);
    procedure Fla_AccueilFinish(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fenetre: TFenetre;

implementation

uses
  U_Main;
{$R *.fmx}

procedure TFenetre.Btn_PatientClick(Sender: TObject);
begin
  Fla_Patient.Enabled := True;
  Main.Patient.Visible := False;
  Main.H_Gen_Patient.Visible := False;
end;

procedure TFenetre.Btn_RDVClick(Sender: TObject);
begin
  Fla_RDV.Enabled := True;
  Main.RDV.Visible := False;
  Main.H_Gen_RDV.Visible := False;
end;

procedure TFenetre.Btn_OrdonnaceClick(Sender: TObject);
begin
  Fla_Ordonnace.Enabled := True;
  Main.Ordonnance.Visible := False;
  Main.H_Gen_Ordo.Visible := False;
end;

procedure TFenetre.Btn_RecherchePClick(Sender: TObject);
begin
  Fla_RechercheP.Enabled := True;
  Main.Recherche_Patient.Visible := False;
  Main.H_Gen_RechercheP.Visible := False;
end;

procedure TFenetre.Btn_AccueilClick(Sender: TObject);
begin
  Fla_Accueil.Enabled := True;
  Main.P_Accueil.Visible := False;
end;

procedure TFenetre.Btn_NouveauPClick(Sender: TObject);
begin
  Fla_NouveauP.Enabled := True;
  Main.Nouveau_Patient.Visible := False;
  Main.H_Gen_NouveauP.Visible := False;
end;

procedure TFenetre.Fla_PatientFinish(Sender: TObject);
begin
  F_Patient.Visible := False;
end;

procedure TFenetre.Fla_RDVFinish(Sender: TObject);
begin
  F_RDV.Visible := False;
end;

procedure TFenetre.Fla_OrdonnaceFinish(Sender: TObject);
begin
  F_Ordonnance.Visible := False;
end;

procedure TFenetre.Fla_RecherchePFinish(Sender: TObject);
begin
  F_RechercheP.Visible := False;
end;

procedure TFenetre.Fla_AccueilFinish(Sender: TObject);
begin
  F_Accueil.Visible:=False;
end;

procedure TFenetre.Fla_NouveauPFinish(Sender: TObject);
begin
  F_NouveauP.Visible := False;
end;

procedure TFenetre.FormShow(Sender: TObject);
begin
  if (Main.P_Accueil.Visible = True) then
    F_Accueil.Visible := True
  else
    F_Accueil.Visible := False;
  if (Main.Patient.Visible = True) then
    F_Patient.Visible := True
  else
    F_Patient.Visible := False;
  if (Main.RDV.Visible = True) then
    F_RDV.Visible := True
  else
    F_RDV.Visible := False;
  if (Main.Ordonnance.Visible = True) then
    F_Ordonnance.Visible := True
  else
    F_Ordonnance.Visible := False;
  if (Main.Nouveau_Patient.Visible = True) then
    F_NouveauP.Visible := True
  else
    F_NouveauP.Visible := False;
  if (Main.Recherche_Patient.Visible = True) then
    F_RechercheP.Visible := True
  else
    F_RechercheP.Visible := False;
end;

procedure TFenetre.Label14Click(Sender: TObject);
begin
  Btn_Accueil.OnClick(Btn_Accueil);
  Btn_RDV.OnClick(Btn_RDV);
  Btn_Patient.OnClick(Btn_Patient);
  Btn_NouveauP.OnClick(Btn_NouveauP);
  Btn_Ordonnace.OnClick(Btn_Ordonnace);
  Btn_RechercheP.OnClick(Btn_RechercheP);
  Fla_Accueil.OnFinish(Fla_Accueil);
  Fla_RDV.OnFinish(Fla_RDV);
  Fla_Patient.OnFinish(Fla_Patient);
  Fla_NouveauP.OnFinish(Fla_NouveauP);
  Fla_Ordonnace.OnFinish(Fla_Ordonnace);
  Fla_RechercheP.OnFinish(Fla_RechercheP);
end;

end.

