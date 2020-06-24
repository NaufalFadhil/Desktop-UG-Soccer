unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    bola: TImage;
    gawang: TImage;
    Button1: TButton;
    waktu: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Tbola: TTimer;
    Tgawang: TTimer;
    Label3: TLabel;
    score: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure TbolaTimer(Sender: TObject);
    procedure TgawangTimer(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Overlay: Trect;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.Font.Size := 12;
  Button1.Caption := 'PLAY AGAIN?';
  Button1.Enabled := False;
    Panel1.Enabled := True;
    Tbola.Enabled := True;
    Tgawang.Enabled := True;
      bola.Visible := True;
      gawang.Visible := True;
      Panel1.Caption := '';
        bola.Top := 0;
        waktu.Caption := '60';
        waktu.Font.Color := clBlack;
        waktu.Tag := 60;
        score.Caption := '0';
        score.Tag := 0;
end;

procedure TForm1.TbolaTimer(Sender: TObject);
begin
  bola.Visible := True;
  bola.Top := bola.Top + 75;
  If bola.Top > Panel1.Height Then
  Begin
    bola.Top := 0;
    bola.Left := Random(Panel1.Width);
    End;
      If IntersectRect(Overlay,bola.BoundsRect,gawang.BoundsRect) Then
      Begin
        bola.Visible := False;
        bola.Top := 0;
        bola.Left := Random(Panel1.Width);
        score.Tag := score.Tag + 1;
        score.Caption := IntToStr(score.Tag);
        End;
end;



procedure TForm1.TgawangTimer(Sender: TObject);

begin
  waktu.Tag := waktu.Tag - 1;
  waktu.Caption := IntToStr(waktu.Tag);
  If waktu.Tag = 10 Then
  Begin
    waktu.Font.Color := clYellow;
    End;
    If waktu.Tag = 5 Then
      Begin
      waktu.Font.Color := clRed;
      End;
      If waktu.Tag = 0 Then
        Begin
        Button1.Enabled := True;
        Tgawang.Enabled := False;
        Panel1.Enabled := False;
        Tbola.Enabled := False;
        gawang.Visible := False;
        bola.Visible := False;
        Panel1.Caption := 'Click Play Again?';
        End;
end;



procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  gawang.Left := X - gawang.Width div 5;
  Panel1.Cursor := crHelp;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Application.Terminate
end;

end.
