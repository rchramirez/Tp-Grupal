import Data.Char
import Data.List

data Archivo = Archivo { nombre :: String, contenido :: String } deriving (Show, Eq)
-- ejemplo
unTpGrupal :: Archivo
unTpGrupal = Archivo "tpGrupal.hs" "listaLarga :: [a] -> Bool \n listaLarga = (>9) . length \n"
testFile :: Archivo
testFile = Archivo "tesths" "inicio... \n           \n...fin"

--Para ejecutar :l tpgrupal
--tamaño de un archivo en bytes
tamanio :: Archivo -> Int
tamanio file = (*8) (length (contenido file))
--archivo está vacío
esvacio :: Archivo -> Bool
esvacio file = null (contenido file)
--cantidad de líneas de un archivo
cantidadlineas :: Archivo -> Int
cantidadlineas file = length (lines (contenido file))
--líneas del archivo es blanca
lineablanca :: Archivo -> Bool
lineablanca file = any (\x -> all (isSpace) x) (lines (contenido file))
--archivo es de extensión .hs
extensionhs :: Archivo -> Bool
extensionhs file = (intersect  ".hs" (nombre file)) == ".hs" --en revision
--Renombrar un archivo
renombrararchivo :: Archivo -> String -> Archivo
renombrararchivo (Archivo a b) name = Archivo name b
--Agregar una nueva línea al archivo
