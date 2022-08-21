object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'fTarefa2'
  ClientHeight = 299
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 257
    Top = 93
    Width = 183
    Height = 13
    Caption = 'Intervalo em milissegundos (Thread 1)'
  end
  object Label2: TLabel
    Left = 257
    Top = 157
    Width = 183
    Height = 13
    Caption = 'Intervalo em milissegundos (Thread 2)'
  end
  object ProgressBar1: TProgressBar
    Left = 257
    Top = 112
    Width = 290
    Height = 17
    TabOrder = 0
  end
  object ProgressBar2: TProgressBar
    Left = 257
    Top = 176
    Width = 290
    Height = 17
    TabOrder = 1
  end
  object edtIntervalo1: TSpinEdit
    Left = 473
    Top = 84
    Width = 74
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 100
  end
  object edtIntervalo2: TSpinEdit
    Left = 473
    Top = 148
    Width = 74
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 200
  end
  object btnIniciar: TButton
    Left = 257
    Top = 199
    Width = 290
    Height = 30
    Caption = 'Iniciar'
    TabOrder = 4
    OnClick = btnIniciarClick
  end
end
