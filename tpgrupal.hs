import Data.Char
import Data.List

data Archivo = Archivo { nombre :: String, contenido :: String } deriving (Show, Eq)
-- ejemplo
unTpGrupal :: Archivo
unTpGrupal = Archivo "tpGrupal.hs" "listaLarga :: [a] -> Bool \n listaLarga = (>9) . length \n                  \n aaa    "

cadena = contenido unTpGrupal
lista1 = words cadena

extension = nombre unTpGrupal
--Para ejecutar :l nombrearchivo
--tamaño de un archivo en bytes
tamanio n = (*) (length n) 8
--archivo está vacío
esvacio e = null e
--cantidad de líneas de un archivo
cantlineas c = length (lines c)
--líneas del archivo es blanca
lineablanca l1 = any (\x -> null x) l1 --en revision
--archivo es de extensión .hs
extensionhs e = (intersect  ".hs" e) == ".hs"
