\# Sistema Auxiliar de jogo da forca


\##### Ambiente de desenvolvimento:

- Replit

-(extra-web-random....)

\##### Como executar?

- Abra os arquivos no replit.
- Clique no botão "Run".
- Depois no Shell, digite "ghci Main.hs".
- Agora digite o nome da função de você deseja.
- "sorteiaEsalva" - Para sortear uma palavra inicial.
- "retornaPalavraArq" - Para retornar a palavra sorteada.
- "temLetra 'letraQueDesejaVerificar'" - Paraca verificar se tem uma letra na palavra.
- "verificaSePerdeu" - Para verificar quantas vidas você ainda tem.
- "zeraTudo" - Para zerar as vidas.
- (Basicamente como executado os trabalhos de haskell da professora...)

\##### Funcionalidades

- Sorteia uma palavra válida.
- Salva a palavra em um arquivo.
- Verifica se há um letra que o usuário digitou na palavra.
- Gerencia a vida do úsuario em caso de acerto ou erro da letra.
- Mostra a palavra sorteda

\##### Processo de desenvolvimento

Primeiro comecei pesquisando fontes de como poderia ler as palavras de um arquivo, achei e até que foi facil com o "FilePath", pois ele ja tem a função pronta pra lidar com arquivo, e pra separar as palavras também com o "SplitOn", que retorna uma lista. O problema real, foi conseguir importar esses modulos, já que em cada ambiente funciona de um jeito. Outro problema que ocorreu, foi por que em haskell ao ler um arquivo, não é possivel escrever nele de novo, pois ele verifica que o arquivo está aberto em outro processo, mas aí pesquisando bastante, consegui descobrir que usando o "B.write..", funcionava. O resto das funções até são bem básicas. Algumas tive mais dificuldade príncipalmente em questão de sintaxe, mas testando com o tempo foi indo. E consegui achar várias respostas para o que precisei nas pesquisas, adaptando um pouco pro meu projeto, funcionou praticamente tudo.

\##### Referências

https://stackoverflow.com/questions/4503958/what-is-the-best-way-to-split-a-string-by-a-delimiter-functionally

https://stackoverflow.com/questions/4978578/how-to-split-a-string-in-haskell

https://hackage.haskell.org/package/split-0.1.2.3/docs/Data-List-Split.html#v:splitOn

https://www.educative.io/answers/how-to-read-from-a-file-in-haskell

https://www.portugal-a-programar.pt/forums/topic/64174-como-usar-o-random-em-uma-lista-de-caracteres/

https://stackoverflow.com/questions/20667478/haskell-string-int-type-conversion

https://www.reddit.com/r/haskellquestions/comments/qtrkf2/resource\_busy\_file\_is\_locked\_when\_trying\_to/

https://stackoverflow.com/questions/13097520/error-reading-and-writing-same-file-simultaneously-in-haskell



