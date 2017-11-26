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
         write(Aresta[i,1],' '); {Exibir o Linha do Vetor de Aresta}
     end; writeln();
     write ('     ');  
     for i := 1 to Contador do begin
         write(Aresta[i,2],' '); {Exibir o Linha do Vetor de Aresta}
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
