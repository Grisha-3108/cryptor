unit FileCryptForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    ButtonOK: TButton;
    ButtonCancel: TButton;
    Panel1: TPanel;
    LabelInfo: TLabel;
    LabelIn: TLabel;
    LabelOut: TLabel;
    LabelPathIn: TLabel;
    LabelPathOut: TLabel;
    EditOffset: TEdit;
    LabelOffset: TLabel;
    UpDownFileOffset: TUpDown;
    OpenFileCrypted: TOpenDialog;
    SaveFileCrypted: TSaveDialog;
    ButtonSelectInFile: TButton;
    ButtonSelectOutFile: TButton;
    procedure ButtonSelectInFileClick(Sender: TObject);
    procedure ButtonSelectOutFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
///<summary>
///Обработчик события для кнопки Выбрать исходный файл
///</summary>
procedure TForm2.ButtonSelectInFileClick(Sender: TObject);
begin
  if OpenFileCrypted.Execute then
     LabelPathIn.Caption := OpenFileCrypted.FileName;
end;
///<summary>
///Обработчик события для кнопки Выбрать файл-результат
///</summary>
procedure TForm2.ButtonSelectOutFileClick(Sender: TObject);
var
  BufferPath : string;
  Len: longint;
begin
  if SaveFileCrypted.Execute then begin
    BufferPath := LabelPathIn.Caption;
    Len := Length(BufferPath);
    if (BufferPath[Len] = 's')
    and (BufferPath[Len - 1] = 'e')
    and (BufferPath[Len - 2] = 'h')
    and (BufferPath[Len - 3] = 'c')
    and (BufferPath[Len - 4] = '.') then
      LabelPathOut.Caption := SaveFileCrypted.FileName + '.txt'
    else
      LabelPathOut.Caption := SaveFileCrypted.FileName + '.ches';
  end;
end;

end.