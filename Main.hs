{-# LANGUAGE OverloadedStrings #-}


import Web.Scotty
import qualified Data.ByteString.Char8 as B
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import Data.Text.Lazy (Text, pack)
import Control.Monad.IO.Class (liftIO)
import Data.List.Split (splitOn)
import System.Random
import System.IO

-- Sorteia, salva
sorteiaEsalva :: IO ()
sorteiaEsalva = do
  conteudo <- lerArquivo "texto.txt"
  let listaPalavras = separaPalavra conteudo
  palavraSorteada <- sorteia listaPalavras
  salvaPalavra palavraSorteada

-- le o arquivo, e coloca tudo em uma string
lerArquivo :: FilePath -> IO String
lerArquivo arquivo = readFile arquivo

-- Separa a palavra a cada vigula do arquivo
separaPalavra :: String -> [String]
separaPalavra = splitOn ","

-- sorteia uma palavra
sorteia :: [a] -> IO a
sorteia xs = do
  n <- randomRIO (0, (length xs) - 1)
  return $ xs !! n

-- Salva palavra no arquivo
salvaPalavra :: String -> IO ()
salvaPalavra a =  B.writeFile "palavraSorteada.txt" (B.pack (show a))

-- Retorna Palavra sorteada
retornaPalavraArq :: IO String
retornaPalavraArq = lerArquivo "palavraSorteada.txt"

-- chama a função que verifica se te ma letra
temLetra :: Char -> IO String
temLetra letra = do
    palavra <- retornaPalavraArq
    if verificaLetra palavra letra
        then return "Letra Certa"
        else perdeVida >> return "Letra Errada"

-- Verifica se a letra que a pessoa digitou tem na palavra
verificaLetra :: String -> Char -> Bool
verificaLetra palavra letra = elem letra palavra

-- Le o arquivo de vidas e adiciona 1, caso a pessoa errou
perdeVida :: IO Int
perdeVida = do
    numero <- leArqVida
    let novoNumero = numero + 1
    B.writeFile "vidas.txt" (B.pack (show novoNumero))
    return novoNumero

verificaSePerdeu :: IO String
verificaSePerdeu = do
    vidas <- leArqVida
    let texto = if vidas >= 6 then "Voce se matou" else "Voce tem " ++ show (6 - vidas) ++ " vidas"
    return texto
    
-- Tive que fazer assim, por causa do Lazy IO que nao deixava escrever pois é como se o arquivo estivesse aberto em outro lugar, quando lia o valor dele
-- Função le arquivo
leArqVida :: IO Int
leArqVida = do
    conteudo <- B.readFile "vidas.txt"
    let numero = read (B.unpack conteudo) :: Int
    return numero
    
-- Zera as vidas
zeraTudo :: IO ()
zeraTudo = B.writeFile "vidas.txt" (B.pack (show 0))

main :: IO ()
main = scotty 3000 $ do
    middleware logStdoutDev

    get "/sorteiaEsalva" $ do
        liftIO sorteiaEsalva
        text "Palavra sorteada e salva com sucesso."

    get "/retornaPalavraArq" $ do
        palavra <- liftIO retornaPalavraArq
        text $ pack palavra

    get "/temLetra/:letra" $ do
        letra <- param "letra"
        resultado <- liftIO $ temLetra (head letra)
        text $ pack resultado

    get "/verificaSePerdeu" $ do
        resultado <- liftIO verificaSePerdeu
        text $ pack resultado

    get "/zeraTudo" $ do
      liftIO zeraTudo
      text "Arquivo de vidas zerado"




 

-- nao funciona
-- leArqVida :: IO Int
-- leArqVida = do
--     conteudo <- readFile "vidas.txt"
--     let numero = read conteudo :: Int
--     return numero

-- perdeVida :: Int -> IO ()
-- perdeVida a = do
--     vidasAtuais <- leArqVida
--     let novasVidas = vidasAtuais + 1
--     writeFile "vidas.txt" (show novasVidas)
