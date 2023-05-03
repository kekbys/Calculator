unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type
  CompInfo=record
    index,top,left,width,height,fontsize:integer;
  end;
  complist=array of CompInfo;

  { TCALCULATION }


  TCALCULATION = class(TForm)
    PLUS: TButton;
    MINUS: TButton;
    UMN: TButton;
    DELEN: TButton;
    CLEAR: TButton;
    KOREN: TButton;
    Delete1element: TButton;
    KHOPKA1: TButton;
    KHOPKA2: TButton;
    KHOPKA3: TButton;
    KHOPKA4: TButton;
    KHOPKA5: TButton;
    KHOPKA6: TButton;
    KHOPKA7: TButton;
    KHOPKA8: TButton;
    KHOPKA9: TButton;
    Button29: TButton;
    RAVNO: TButton;
    GLAV_EKRAN: TEdit;
    procedure PLUSClick(Sender: TObject);
    procedure MINUSClick(Sender: TObject);
    procedure UMNClick(Sender: TObject);
    procedure DELENClick(Sender: TObject);
    procedure CLEARClick(Sender: TObject);
    procedure KORENClick(Sender: TObject);
    procedure Delete1elementClick(Sender: TObject);
    procedure KHOPKA1Click(Sender: TObject);
    procedure KHOPKA2Click(Sender: TObject);
    procedure KHOPKA3Click(Sender: TObject);
    procedure KHOPKA4Click(Sender: TObject);
    procedure KHOPKA5Click(Sender: TObject);
    procedure KHOPKA6Click(Sender: TObject);
    procedure KHOPKA7Click(Sender: TObject);
    procedure KHOPKA8Click(Sender: TObject);
    procedure KHOPKA9Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure RAVNOClick(Sender: TObject);
    procedure GLAV_EKRANChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    { private declarations }
    DefWidth,defHeight:integer;
    clist:complist;
  public
    { public declarations }

  end;

var
  CALCULATION: TCALCULATION;
  ch1, ch2, rez: real;
  znak: char;

implementation
uses math;

{$R *.lfm}

{ TCALCULATION }

procedure TCALCULATION.FormCreate(Sender: TObject);
var i:integer;
begin
  defwidth:=width;
  defheight:=height;
  for i:= 0 to ComponentCount-1 do
    if (Components[i].Classname = 'TRadioButton')
    or (Components[i].Classname ='TCheckBox')
    or (Components[i].Classname ='TButton')
    or (Components[i].Classname ='TBitBtn')
    or (Components[i].Classname ='TSpeedButton')
    or (Components[i].Classname ='TEdit')
    or (Components[i].Classname ='TRadioGroup')
    or (Components[i].Classname ='TCheckGroup')
    or (Components[i].Classname ='TListBox')
    or (Components[i].Classname ='TComboBox')
    or (Components[i].Classname ='TEdit')
    or (Components[i].Classname ='TSpinEdit')
    or (Components[i].Classname ='TLabel') then begin
      setlength(clist,Length(clist)+1);
      clist[Length(clist)-1].top:=(Components[i] as tcontrol).top;
      clist[Length(clist)-1].left:=(Components[i]as tcontrol).left;
      clist[Length(clist)-1].width:=(Components[i] as tcontrol).width;
      clist[Length(clist)-1].height:=(Components[i]as tcontrol).height;
      clist[Length(clist)-1].fontsize:=(Components[i]as tcontrol).font.Size;
      clist[Length(clist)-1].index:=i;
    end;
end;

procedure TCALCULATION.FormResize(Sender: TObject);
var i:integer;
begin
  if width >1000 then width:=800;
  if width<150   then width:=250;
  if height>800 then height:=800;
  if height<150 then height:=250;
  For i:=0 to length(clist)-1 do begin
    (components[clist[i].index] as tcontrol).Top:=round(clist[i].top*height/defheight);
    (components[clist[i].index] as tcontrol).height:=round(clist[i].height*height/defheight);
    (components[clist[i].index] as tcontrol).left:=round(clist[i].left*width/defwidth);
    (components[clist[i].index] as tcontrol).width:=round(clist[i].width*width/defwidth);
    (components[clist[i].index] as tcontrol).font.Size:=round(clist[i].fontsize*min(width/defwidth,height/defheight));
  end;
end;



procedure TCALCULATION.KHOPKA1Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '1';
end;

procedure TCALCULATION.Delete1elementClick(Sender: TObject);
var j, i:string;
begin
  j:=GLAV_EKRAN.Text;
  if j <> '' then Delete(j, Length(j), 1);
  GLAV_EKRAN.Text:=j;
end;

procedure TCALCULATION.CLEARClick(Sender: TObject);
begin
  GLAV_EKRAN.Clear;
end;

procedure TCALCULATION.KORENClick(Sender: TObject);
begin
  if GLAV_EKRAN.Text = '' then abort;
  ch1 := StrToFloat(GLAV_EKRAN.Text);
  if ch1 > 0 then
  rez := sqrt(ch1);
  GLAV_EKRAN.Text:=FloatToStr(rez);
  if ch1<0 then GLAV_EKRAN.Text:='';
end;

procedure TCALCULATION.PLUSClick(Sender: TObject);
begin
  if GLAV_EKRAN.Text = '' then abort;
  ch1:=StrToFloat(GLAV_EKRAN.Text);
  znak:= '+';
  GLAV_EKRAN.Clear;
end;


procedure TCALCULATION.MINUSClick(Sender: TObject);
begin
  if GLAV_EKRAN.Text = '' then abort;
  ch1:=StrToFloat(GLAV_EKRAN.Text);
  znak:= '-';
  GLAV_EKRAN.Clear;
end;

procedure TCALCULATION.UMNClick(Sender: TObject);
begin
  if GLAV_EKRAN.Text = '' then abort;
  ch1:=StrToFloat(GLAV_EKRAN.Text);
  znak:= '*';
  GLAV_EKRAN.Clear;
end;

procedure TCALCULATION.DELENClick(Sender: TObject);
begin
  if GLAV_EKRAN.Text = '' then abort;
  ch1:=StrToFloat(GLAV_EKRAN.Text);
  znak:= '/';
  GLAV_EKRAN.Clear;
end;

procedure TCALCULATION.KHOPKA2Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '2';
end;

procedure TCALCULATION.KHOPKA3Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '3';
end;

procedure TCALCULATION.KHOPKA4Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '4';
end;

procedure TCALCULATION.KHOPKA5Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '5';
end;

procedure TCALCULATION.KHOPKA6Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '6';
end;

procedure TCALCULATION.KHOPKA7Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '7';
end;

procedure TCALCULATION.KHOPKA8Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '8';
end;

procedure TCALCULATION.KHOPKA9Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '9';
end;

procedure TCALCULATION.Button29Click(Sender: TObject);
begin
  GLAV_EKRAN.Text:=GLAV_EKRAN.Text + '0';
end;

procedure TCALCULATION.RAVNOClick(Sender: TObject);
begin
  if GLAV_EKRAN.Text = '' then abort;
  ch2 := StrToFloat(GLAV_EKRAN.Text);
  GLAV_EKRAN.Clear;
  if znak = '+' then
  begin
    rez := ch1 + ch2;
  end;
  if znak = '-' then
  begin
    rez := ch1 - ch2;
  end;
  if znak = '*' then
  begin
    rez := ch1 * ch2;
  end;
  if znak = '/' then
  begin
    if ch2 = 0 then begin ShowMessage('Деление на ноль невозможно!'); Abort; end;
    rez := ch1 / ch2;
  end;
  GLAV_EKRAN.Text:= FloatToStr(rez);
end;

procedure TCALCULATION.GLAV_EKRANChange(Sender: TObject);
begin
  GLAV_EKRAN.MaxLength:=13;
end;








end.

