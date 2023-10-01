unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Samples.Spin,
  System.IOUtils, types, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    ebColumns: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  lFiles: TStringDynArray;
  i: Integer;
  X, Y, lCurColumn, lRaws, lWidth, lHeight: integer;
  MaxFiles: integer; // max files that fit to main bitmap (should div lNeedColumns without remnant )
  lNeedColumns, // horizontal count
  lNeedRows: integer; // vertical
  lBitmap: TBitmap;
  lPng: TPngImage;
  ResultBmp: TBitmap;
  lPath: string;
begin
  lPath := ExtractFilePath( Edit1.Text) + '~ResultAnim.png';
  if FileExists(lPath) then
    DeleteFile(lPath);

  lFiles := TDirectory.GetFiles(Edit1.Text);
  lNeedColumns := ebColumns.Value;
  lNeedRows := Length(lFiles) div lNeedColumns;
  MaxFiles := lNeedColumns * lNeedRows;

  // load first file to get width and height
  lPng := TPngImage.Create;
  try
    lPng.LoadFromFile(lFiles[0]);
    lWidth := lPng.Width;
    lHeight := lPng.Height;
  finally
    lPng.Free;
  end;

  // create base bitmap
  ResultBmp := TBitmap.Create;
  ResultBmp.SetSize(lNeedColumns * lWidth, lNeedRows * lHeight);

  X := 0;
  Y := 0;
  lCurColumn := 0;
  lRaws := 0;

  for i := 0 to MaxFiles - 1 do
  begin
    lPng := TPngImage.Create;
    try
      lPng.LoadFromFile(lFiles[i]);


      ResultBmp.Canvas.Draw(X, Y, lPng);
    finally
      lPng.Free;
    end;

    inc(lCurColumn);
    if lCurColumn < lNeedColumns then
      inc(X, lWidth)
    else
    begin
      // move to next raw (line)
     lCurColumn := 0;
     X := 0;
     inc(Y, lHeight);
     inc(lRaws);
    end;
  end;

 // Image1.Assign(ResultBmp);
  lPng := TPngImage.Create;
  try
    lPng.Assign(ResultBmp);
    lPng.SaveToFile(lPath);
  finally
    lPng.Free;
  end;

 // ResultBmp.SaveToFile(lPath );
  ResultBmp.Free;

  Label3.Caption := 'Raws: ' + lRaws.ToString;
  Label4.Caption := 'Frames Count: ' + (lRaws * lNeedColumns).ToString;

  ShowMessage('Done');
end;

end.
