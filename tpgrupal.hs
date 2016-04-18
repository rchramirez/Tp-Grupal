import Data.Char
import Data.List

data Archivo = Archivo { nombre :: String, contenido :: String } deriving (Show, Eq)
-- ejemplo
unTpGrupal :: Archivo
unTpGrupal = Archivo "tpGrupal.hs" "listaLarga :: [a] -> Bool \n listaLarga = (>9) . length \n"

--Para ejecutar :l tpgrupal
--tamaño de un archivo en bytes
tamanio :: Archivo -> Int
tamanio (Archivo name content) = (*8) (length content)
--archivo está vacío
esvacio :: Archivo -> Bool
esvacio (Archivo name content) = null content
--cantidad de líneas de un archivo
cantidadlineas :: Archivo -> Int
cantidadlineas (Archivo name content) = length (lines content)
--líneas del archivo es blanca
lineablanca :: Archivo -> Bool
lineablanca (Archivo name content) = any (\x -> all (isSpace) x) (lines content)
--archivo es de extensión .hs
extensionhs :: Archivo -> Bool
extensionhs (Archivo name content) = (intersect  ".hs" name) == ".hs" --en revision
--Renombrar un archivo
renombrararchivo :: Archivo -> String -> Archivo
renombrararchivo (Archivo a b) name = Archivo name b
--Agregar una nueva línea al archivo
