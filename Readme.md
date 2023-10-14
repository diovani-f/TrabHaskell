# Sistema Auxiliar de jogo da forca
[Video de apresentação](https://drive.google.com/file/d/1d7sgh6DUZQEC_5RY6-b3yy30wUjZPDYd/view?usp=sharing)

##### Ambiente de desenvolvimento:

- Replit (extra-web-random....)

##### Como executar?

- Abra os arquivos no replit.
- Clique no botão "Run".
- Assim ele vai executar os arquivos, e abrir uma nova aba chamada "Webview".
- Nessa aba, ira ter um link, copie este link e cole no seu navegador.
- Após o link, digite "/" e a função que deseja chamar.
- Ex: https://extra-web-random-pairs-diovani-f.elc117-2023b.repl.co/sorteiaEsalva
  
- "sorteiaEsalva" - Para sortear uma palavra inicial.
- "retornaPalavraArq" - Para retornar a palavra sorteada.
- "temLetra 'letraQueDesejaVerificar'" - Paraca verificar se tem uma letra na palavra.
- "verificaSePerdeu" - Para verificar quantas vidas você ainda tem.
- "zeraTudo" - Para zerar as vidas.

##### Funcionalidades

- Sorteia uma palavra válida.
- Salva a palavra em um arquivo.
- Verifica se há um letra que o usuário digitou na palavra.
- Gerencia a vida do úsuario em caso de acerto ou erro da letra.
- Mostra a palavra sorteada
- Retorna em servidor web...

##### Processo de desenvolvimento

Primeiro comecei pesquisando fontes de como poderia ler as palavras de um arquivo, achei e até que foi fácil com o "FilePath", pois ele já tem a função pronta para lidar com arquivo, e para separar as palavras também com o "SplitOn", que retorna uma lista. O problema real, foi conseguir importar esses módulos, já que em cada ambiente funciona de um jeito. Outro problema que ocorreu, pois em haskell ao ler um arquivo, não é possível escrever nele de novo, pois ele verifica que o arquivo está aberto em outro processo, mas aí pesquisando bastante, consegui descobrir que usando o "B.write..", funcionava. O resto das funções até são bem básicas. Algumas tive mais dificuldade principalmente em questão de sintaxe, mas testando bastante, as funções foram funcionando. E consegui achar várias respostas para o que precisei nas pesquisas, adaptando um pouco para o meu projeto, funcionou praticamente tudo.Em questão de ias, utilizei para descobrir alguns erros que não entendia o porque ocorriam, e achar a possiveis soluções. A parte do "servidor web" me baseei praticamente tudo no exemplo dado em aula pela professora, apenas adaptei algumas coisas para funcionar com as minhas funções.
##### Referências

[Usos do splitOn](https://hackage.haskell.org/package/split-0.1.2.3/docs/Data-List-Split.html#v:splitOn)

[Como separar uma string com um delimitador](https://stackoverflow.com/questions/4503958/what-is-the-best-way-to-split-a-string-by-a-delimiter-functionally)

[Como utilizar splitOn](https://stackoverflow.com/questions/4978578/how-to-split-a-string-in-haskell)

[Como ler um arquivo em haskell](https://www.educative.io/answers/how-to-read-from-a-file-in-haskell)

[Como utilizar o random](https://www.portugal-a-programar.pt/forums/topic/64174-como-usar-o-random-em-uma-lista-de-caracteres/)

[Como converter tipos em haskell](https://stackoverflow.com/questions/20667478/haskell-string-int-type-conversion)

[Arquivos bloqueados para leitura e escrita](https://www.reddit.com/r/haskellquestions/comments/qtrkf2/resource\_busy\_file\_is\_locked\_when\_trying\_to/)

[Erro ao ler e escrever em um arquivo em haskell](https://stackoverflow.com/questions/13097520/error-reading-and-writing-same-file-simultaneously-in-haskell)



