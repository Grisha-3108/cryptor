unit Cryptor;

interface
  function ChesarCrypt(input: string; offset: longint): string;
  function ChesarDecrypt(input: string; offset: longint): string;
  procedure FileCrypt(InFile, OutFile: string; offset: integer);
  procedure FileDecrypt(InFile, OutFile: string; offset: integer);
implementation
  ///<summary>
  ///������� ������ ������� ������
  ///</summary>
  ///<param name="input">
  ///������� ������
  ///</param>
  ///<param name="offset">
  ///����� ��� ����������
  ///</param>
  ///<returns>
  ///������������� ������
  ///</returs>
  function ChesarCrypt(input: string; offset: longint): string;
  const
   NUM_Of_SYMBOLS = 65535;
  var
    output: string;
    counter, StrLen: integer;
  begin
    if offset >  NUM_OF_SYMBOLS then
      offset := offset mod 65535;

    StrLen := Length(input);

    for counter := 1 to StrLen do begin
      output := output + chr((ord(input[counter]) + offset) mod NUM_OF_SYMBOLS);
    end;

    ChesarCrypt := output
  end;
  ///<summary>
  ///�������������� ������ ������� ������
  ///</summary>
  ///<param name="input">
  ///������� ������
  ///</param>
  ///<param name="offset">
  ///����� ��� ����������
  ///</param>
  ///<returns>
  ///�������������� ������
  ///</returs>
  function ChesarDecrypt(input: string; offset: longint): string;
  const
   NUM_Of_SYMBOLS = 65535;
  var
    output: string;
    counter, StrLen: integer;
  begin
    if offset >  NUM_OF_SYMBOLS then
      offset := offset mod 65535;

    StrLen := Length(input);

    for counter := 1 to StrLen do begin
      output := output + chr((ord(input[counter]) + NUM_OF_SYMBOLS - offset) mod NUM_OF_SYMBOLS);
    end;

    ChesarDecrypt := output
  end;
///<summary>
///������� ���� ������� ������
///</summary>
///<param name="InFile">
///������� ����
///</param>
///<param name="offset">
///����� ��� ����������
///</param>
///<param name="OutFile">
///����-���������
///</param>
///<returns>
///������������� ����
///</returs>
procedure FileCrypt(InFile, OutFile: string; offset: integer);
var
  FileInput, FileOutput: file of byte;
  Buffer: byte;
begin
  if offset > 255 then
    offset := offset mod 256;
  AssignFile(FileInput, InFile);
  AssignFile(FileOutput, OutFile);
  Reset(FileInput);
  Rewrite(FileOutput);
  while not eof(FileInput) do begin
    read(FileInput, Buffer);
    Buffer := (Buffer + offset) mod 256;
    write(FileOutput, Buffer);
  end;
  CloseFile(FileInput);
  CloseFile(FileOutput);
end;
///<summary>
///���������� ���� ������� ������
///</summary>
///<param name="InFile">
///������� ����
///</param>
///<param name="offset">
///����� ��� ����������
///</param>
///<param name="OutFile">
///����-���������
///</param>
///<returns>
///������������� ����
///</returs>
procedure FileDecrypt(InFile, OutFile: string; offset: integer);
var
  FileInput, FileOutput: file of byte;
  Buffer: byte;
begin
  if offset > 255 then
    offset := offset mod 256;
  AssignFile(FileInput, InFile);
  AssignFile(FileOutput, OutFile);
  Reset(FileInput);
  Rewrite(FileOutput);
  while not eof(FileInput) do begin
    read(FileInput, Buffer);
    Buffer := (Buffer + 256 - offset) mod 256;
    write(FileOutput, Buffer);
  end;
  CloseFile(FileInput);
  CloseFile(FileOutput);
end;
end.
