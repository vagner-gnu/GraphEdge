Program AlgoritmoemGrafos;
uses crt, dos;

var
MAdjacencia : Array [1..100,1..100] of integer; {Matriz de Adjacencia do Grafo}
n,m         : Integer;      {Quantidade de Vertices e de Aresta direcionadas do Grafo}
arquivo     : Text;         {Arquivo texto onde esta o Grafo}
arqok       : Boolean;      {Arquivo encontrado ou nao}
nomearquivo : String;       {Nome do arquivo a ser utilizado}
Auxarq      : Char;         {Auxiliar para colocar os dados do arquivo na Matriz}
Snumero     : String;       {Numero do arquivo em formato String}
Inumero     : Integer;      {Numero do arquivo em formato inteiro}
I, J, i1, j1: Integer;      {Auxiliares para varrer a Matriz}
erro        : Integer;      {Erro na transformacao de String para Inteiro}
Sair        : boolean;      {Sai do programa ou pede outro arquivo} 
opcao       : char;         {Opção de sair ou escrever outro arquivo}

//Label 123, 456;



{============ VARIAVEIS DOS ALUNOS =============}

Matriz : array [1..100, 1..100] of integer;
Aresta : array [1..100, 1..2] of integer;
Auxiliar: Integer; 
Contador: Integer; 
Coluna1: Integer;  
Coluna2: Integer;  
Linha: Integer; 

Label 123, 456;

{======= FIM DAS VARIAVEIS DOS ALUNOS ==========}

function digrafo (nvert:integer): boolean;
begin
digrafo := false;
        for i1 := 1 to nvert do
            for j1 := 1 to nvert do
                if MAdjacencia [i1,j1] <> MAdjacencia [j1,i1] then
                digrafo := true;
end;


begin
sair := false;
while not sair do
begin
     textbackground(1);
     clrscr;
     arqok := false;
     while not arqok do         {Verificando a existencia do arquivo}
     begin
          write('Digite o nome do arquivo ou S para sair: ');
          readln (nomearquivo);
          if ((nomearquivo = 's') or (nomearquivo = 'S')) then goto 456;    
          nomearquivo := Concat (nomearquivo, '.txt');          
          if Fsearch (nomearquivo,'') <> '' then
          begin
               arqok := true;
               writeln('Arquivo localizado com sucesso!');
               readkey;
               clrscr;
          end
          else
          begin
               writeln ('Arquivo inexistente, tente novamente!')
          end;
     end;

     for i := 1 to 100 do
     for j := 1 to 100 do
     MAdjacencia [i,j] := 0;

     writeln('Trabalho do alunos: Vagner Carvalho e Bruna Reis');
     {Substituir o X, Y e Z pelo nome dos componentes da equipe e excluir esse comentario}
     writeln(' ');

     writeln('Matriz de Adjacencia do Grafo no arquivo:');
     writeln(' ');

     assign (arquivo, nomearquivo);
     reset (arquivo);

     snumero := '';
     i := 1;    {Preenchimento inicial na linha  1 }
     j := 1;    {Preenchimento inicial na coluna 1 }
     m := 0;

     While not eof (arquivo) do         {Preenchimento da Matriz de Adjacencia do Grafo}
     begin

          read(arquivo, auxarq);

          if (auxarq <> ' ') and (auxarq <> chr(13)) and (auxarq <> chr(10)) then
          begin
               snumero := concat (snumero,auxarq);
          end
          else
          begin
               val (snumero,inumero,erro);

               if (erro <> 0) and (auxarq <> chr(10)) then
               begin
                    Writeln('Erro: ', erro,'. Arquivo nao possui um grafo');
                    readkey;
                    goto 123;
               end;
                              
               snumero := '';
               MAdjacencia [i,j] := inumero;

               if inumero <> 0 then m := m + 1; {Definindo a quantidade de Aresta Dirigidas em digrafos}


               if auxarq = ' ' then
               begin
                    write (MAdjacencia [i,j], ' ');
                    j := j + 1;
               end
               else
               begin
                    if (auxarq <> chr(10)) then
                    begin
                         writeln (MAdjacencia [i,j], ' ');
                         i := i + 1;
                         j := 1;
                    end;
               end;
          end;          {do if}
     end;               {do while eof}


          val (snumero,inumero,erro);
          if (erro <> 0) and (auxarq <> chr(10)) then
               begin
                    Writeln('Erro: ', erro,'. Arquivo nao possui um grafo');
                    readkey;
                    goto 123;
               end;
     MAdjacencia [i,j] := inumero;
     writeln (MAdjacencia [i,j], ' ');

     m := 0;    
     n := i; 

     if digrafo (n) then
     begin
          for i1 := 1 to i do
               for j1 := 1 to i do
               begin
                       if (MAdjacencia [i1,j1] <> 0) then   
                          m := m + 1;
               end;
     end
     else
     begin
          for i1 := 1 to i do
          for j1 := 1 to i do
          begin
                  if (MAdjacencia [i1,j1] <> 0) and (i1 < j1)then
                  m := m + 1;
           end;
 
           for i1 := 1 to i do                      //Contando as linhas
           if (MAdjacencia [i1,i1] <> 0) then
                m := m + 1;         
     end;          


    
     writeln('');
     writeln('');
     writeln('n= ',n, ' e m= ', m);

     close(arquivo);
     readkey;

{=== CODIGOS DEVEM SER IMPLEMENTADOS A PARTIR DESTA LINHA ====}
	 writeln();
	 writeln('/// Grafo de Aresta \\\');
     Linha := 1;
     Coluna1 := 1;
     Contador:= 0;	

     for i := 1 to 100 do begin
     for j := 1 to 100 do begin {Verificar as Arestas e Contar}
         if((i >= j) and (MAdjacencia[i,j] = 1)) then begin
            Aresta[Linha, 1]:= j;
            Aresta[Linha, 2]:= i;
            Linha:= Linha + 1;
            Contador:= Contador + 1;
            if(n = 1) and (Contador = 1)then begin
		          write('Grafo Trivial...'); writeln();end;
     end; end; end;
	

     write ('     ');
     for i := 1 to Contador do begin 
         write(Aresta[i,1],' '); {Exibir a Linha do Vetor de Aresta}
     end; writeln();
     write ('     ');  
     for i := 1 to Contador do begin
         write(Aresta[i,2],' '); {Exibir a Linha do Vetor de Aresta}
     end; writeln();writeln();

     for Coluna1 := 1 to 2 do begin
     for Linha := 1 to 100 do begin
		Auxiliar := Aresta[Linha,Coluna1]; {Fazer a Comparação entre as Adjacentes das Arestas}
		for i := 1 to 100 do begin
			Coluna2 := i; {Criar Aresta}
			if((Aresta[i,2] = Auxiliar) or (Aresta[i,1] = Auxiliar))then begin
				if(i <> Linha)then begin
					Matriz[Linha,Coluna2]:= 1;
     end; end; end; end; end; 


	 for i := 1 to Contador do begin 
     write(Aresta[i,1],' ',Aresta[i,2], '  '); {Exibir o Colunas do Vetor de Aresta}
     
     for j := 1 to Contador do begin 
         write(Matriz[i,j],' '); {Exibir a Matriz de Arestas}
     end; writeln(); end; 

     for j := 1 to 100 do begin
     for i := 1 to 100 do begin
        Aresta[i, 1] := 0; {Contador, Matriz e a Aresta deve ser zerado para o proximo uso}   
        Aresta[i, 2] := 0;
        Matriz[i,j] := 0;
        Contador := 0; 
     end; end; writeln();   

{=== FIM DOS CODIGOS DOS ALUNOS ====}

123:
     write ('Digite S para sair ou Enter para um novo arquivo: ');
     opcao:=ReadKey;
     opcao:=UpCase(opcao); 
     if opcao = 'S' then 
          sair := true;
end;
456:
end.
