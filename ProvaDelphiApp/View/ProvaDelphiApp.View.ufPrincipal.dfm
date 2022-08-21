object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Desafio T'#233'cnico Softplan'
  ClientHeight = 453
  ClientWidth = 813
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = menTarefas
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object menTarefas: TMainMenu
    Left = 160
    Top = 104
    object Tarefa1: TMenuItem
      Caption = 'Tarefa 1'
      OnClick = Tarefa1Click
    end
    object Tarefa2: TMenuItem
      Caption = 'Tarefa 2'
      OnClick = Tarefa2Click
    end
    object Tarefa3: TMenuItem
      Caption = 'Tarefa 3'
      OnClick = Tarefa3Click
    end
  end
end
