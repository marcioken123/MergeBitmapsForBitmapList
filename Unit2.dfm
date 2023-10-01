object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 401
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 140
  TextHeight = 23
  object Label1: TLabel
    Left = 456
    Top = 91
    Width = 78
    Height = 23
    Caption = 'Columns:'
  end
  object Label2: TLabel
    Left = 30
    Top = 91
    Width = 103
    Height = 23
    Caption = 'Folder path:'
  end
  object Label3: TLabel
    Left = 30
    Top = 246
    Width = 51
    Height = 23
    Caption = 'Raws:'
  end
  object Label4: TLabel
    Left = 30
    Top = 288
    Width = 123
    Height = 23
    Caption = 'Frames Count:'
  end
  object Label5: TLabel
    Left = 30
    Top = 20
    Width = 547
    Height = 46
    AutoSize = False
    Caption = 'App works only with PNG files in folder. Delete other files. '
    WordWrap = True
  end
  object Edit1: TEdit
    Left = 30
    Top = 120
    Width = 409
    Height = 31
    TabOrder = 0
    Text = 'c:\1\'
  end
  object Button1: TButton
    Left = 30
    Top = 174
    Width = 97
    Height = 37
    Caption = 'Start'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ebColumns: TSpinEdit
    Left = 456
    Top = 120
    Width = 121
    Height = 34
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 5
  end
end
