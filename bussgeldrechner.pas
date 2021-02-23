unit Bussgeldrechner;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, ExtCtrls, ActnList, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnBerechnen: TButton;
    btnBerechnenAlkohol: TButton;
    btnBerechnenReifen: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblBetragReifen: TLabel;
    Label6: TLabel;
    lblPunkteReifen: TLabel;
    lblStrafe: TLabel;
    lblPunkteAlkohol: TLabel;
    rdbtnBehinderungTrue: TRadioButton;
    rdbtnBehinderungFalse: TRadioButton;
    rdbtnAbgefahreneReifen: TRadioButton;
    rdbtnSommerreifen: TRadioButton;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    rdbtnVerstoss0: TRadioButton;
    rdbtnVerstoss1: TRadioButton;
    rdbtnVerstoss2: TRadioButton;
    RadioGroup5: TRadioGroup;
    tbxPromille: TEdit;
    Label1: TLabel;
    lblPunkte: TLabel;
    lblBussgeldBetrag: TLabel;
    lblBussgeld: TLabel;
    rdbtnProbezeitTrue: TRadioButton;
    rdbtnProbezeitFalse: TRadioButton;
    RadioGroup4: TRadioGroup;
    rdbtnToleranzTrue: TRadioButton;
    rdbtnToleranzFalse: TRadioButton;
    RadioGroup3: TRadioGroup;
    rdbtnFahrzeugPKW: TRadioButton;
    rdbtnFahrzeugLKW: TRadioButton;
    RadioGroup2: TRadioGroup;
    rdbtnWoInnerorts: TRadioButton;
    rdbtnWoAusserorts: TRadioButton;
    RadioGroup1: TRadioGroup;
    tbxZugelasseneGeschwindigkeit: TEdit;
    tbxGefahreneGeschwindigkeit: TEdit;
    PageControl1: TPageControl;
    Geschwindigkeit: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure btnBerechnenAlkoholClick(Sender: TObject);
    procedure btnBerechnenClick(Sender: TObject);
    procedure btnBerechnenReifenClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnBerechnenClick(Sender: TObject);
var
  GefahreneGeschwindigkeit:double;
  ZugelasseneGeschwindigkeit:double;
  geschwindigkeitDifferenz:double;
  Punkte:integer;
  Betrag:double;
begin
     GefahreneGeschwindigkeit:= strtofloat(tbxGefahreneGeschwindigkeit.Text);
     ZugelasseneGeschwindigkeit:=strtofloat(tbxZugelasseneGeschwindigkeit.Text);
     geschwindigkeitDifferenz:=GefahreneGeschwindigkeit-ZugelasseneGeschwindigkeit;

     if rdbtnToleranzTrue.Checked then geschwindigkeitDifferenz:= geschwindigkeitDifferenz - 3.00;

     if geschwindigkeitDifferenz<=0 then begin
     ShowMessage('Die gefahrene Geschwindigkeit müss höher als die zugelassene sein.');
     geschwindigkeitDifferenz:=1;
     Punkte:=0;
     Betrag:=0;
     end;
     //PKW innerorts
     if rdbtnFahrzeugPKW.Checked and rdbtnWoInnerorts.Checked then begin
     if geschwindigkeitDifferenz>=70.00 then begin
          Betrag:=680;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=61.00 then begin
          Betrag:=480;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=51.00 then begin
          Betrag:=280;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=41.00 then begin
          Betrag:=200;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=31.00 then begin
          Betrag:=160;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=26.00 then begin
          Betrag:=100;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=21.00 then begin
          Betrag:=80;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=16.00 then begin
          Betrag:=35;
          Punkte:=0;
     end
     else if geschwindigkeitDifferenz>=11.00 then begin
          Betrag:=25;
          Punkte:=0;
     end
     else if geschwindigkeitDifferenz>=1.00 then begin
          Betrag:=15;
          Punkte:=0;
     end
     else begin
          Betrag:=0;
          Punkte:=0;
     end
     end;
     //PKW außerorts
     if rdbtnFahrzeugPKW.Checked and rdbtnWoAusserorts.Checked then begin
     if geschwindigkeitDifferenz>=70.00 then begin
          Betrag:=600;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=61.00 then begin
          Betrag:=440;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=51.00 then begin
          Betrag:=240;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=41.00 then begin
          Betrag:=160;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=31.00 then begin
          Betrag:=120;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=26.00 then begin
          Betrag:=80;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=21.00 then begin
          Betrag:=70;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=16.00 then begin
          Betrag:=30;
          Punkte:=0;
     end
     else if geschwindigkeitDifferenz>=11.00 then begin
          Betrag:=20;
          Punkte:=0;
     end
     else if geschwindigkeitDifferenz>=1.00 then begin
          Betrag:=10;
          Punkte:=0;
     end
     else begin
          Betrag:=0;
          Punkte:=0;
     end
     end;
     //LKW innerorts
     if rdbtnFahrzeugLKW.Checked and rdbtnWoInnerorts.Checked then begin
     if geschwindigkeitDifferenz>=60.00 then begin
          Betrag:=680;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=51.00 then begin
          Betrag:=480;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=41.00 then begin
          Betrag:=280;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=31.00 then begin
          Betrag:=200;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=26.00 then begin
          Betrag:=140;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=21.00 then begin
          Betrag:=95;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=16.00 then begin
          Betrag:=80;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=11.00 then begin
          Betrag:=30;
          Punkte:=0;
     end
     else if geschwindigkeitDifferenz>=1.00 then begin
          Betrag:=20;
          Punkte:=0;
     end
     else begin
          Betrag:=0;
          Punkte:=0;
     end
     end;
     //LKW außerorts
     if rdbtnFahrzeugLKW.Checked and rdbtnWoAusserorts.Checked then begin
     if geschwindigkeitDifferenz>=60.00 then begin
          Betrag:=600;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=51.00 then begin
          Betrag:=440;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=41.00 then begin
          Betrag:=240;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=31.00 then begin
          Betrag:=160;
          Punkte:=2;
     end
     else if geschwindigkeitDifferenz>=26.00 then begin
          Betrag:=95;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=21.00 then begin
          Betrag:=80;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=16.00 then begin
          Betrag:=70;
          Punkte:=1;
     end
     else if geschwindigkeitDifferenz>=11.00 then begin
          Betrag:=25;
          Punkte:=0;
     end
     else if geschwindigkeitDifferenz>=1.00 then begin
          Betrag:=15;
          Punkte:=0;
     end
     else begin
          Betrag:=0;
          Punkte:=0;
     end
     end;
     lblBussgeldBetrag.Caption:= Betrag.ToString;
     lblPunkte.Caption:= Punkte.ToString;
end;

procedure TForm1.btnBerechnenReifenClick(Sender: TObject);
var
  PunkteReifen:String;
  BetragReifen:String;
begin
     if rdbtnAbgefahreneReifen.Checked then begin
        if rdbtnBehinderungFalse.Checked then begin
           PunkteReifen:='1';
           BetragReifen:='60';
        end
        else if rdbtnBehinderungTrue.Checked then begin
           PunkteReifen:='1';
           BetragReifen:='75';
        end
     end;

     if rdbtnSommerreifen.Checked then begin
        if rdbtnBehinderungFalse.Checked then begin
           PunkteReifen:='1';
           BetragReifen:='60';
        end
        else if rdbtnBehinderungTrue.Checked then begin
           PunkteReifen:='1';
           BetragReifen:='80';
        end
     end;
     lblBetragReifen.Caption:=BetragReifen;
     lblPunkteReifen.Caption:=PunkteReifen
end;

procedure TForm1.btnBerechnenAlkoholClick(Sender: TObject);
var
  Promille:double;
  PunkteAlkohol:integer;
  Strafe:string;
begin
  Promille:=strtofloat(tbxPromille.Caption);

  if Promille=0 then begin
  Strafe:='Keine Strafe';
  PunkteAlkohol:=0;
  end
  else if Promille<0 then begin
  ShowMessage('Bitte Wert über 0 eingeben');
  Promille:=0;
  end;

  if rdbtnProbezeitTrue.Checked and (Promille>0.0) then begin
     PunkteAlkohol:=1;
     Strafe:='250';
  end;

  if Promille>= 1.1 then begin
  PunkteAlkohol:=3;
  Strafe:='Freiheits oder Geldstrafe';
  end;

  if (Promille>=0.5) and (Promille<1.1) then begin
     if rdbtnVerstoss0.Checked then begin
        PunkteAlkohol:=2;
        Strafe:='500';
     end
      else if rdbtnVerstoss1.Checked then begin
        PunkteAlkohol:=2;
        Strafe:='1000';
     end
     else if rdbtnVerstoss2.Checked then begin
        PunkteAlkohol:=2;
        Strafe:='1500';
     end
  end;
  lblPunkteAlkohol.Caption:=PunkteAlkohol.ToString;
  lblStrafe.Caption:=Strafe;
end;

begin

end.

