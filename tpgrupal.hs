import Data.Char
import Data.List

data Archivo = Archivo { nombre :: String, contenido :: String } deriving (Show, Eq)
-- ejemplo
unTpGrupal :: Archivo
unTpGrupal = Archivo "tpGrupal.hs" "listaLarga :: [a] -> Bool \n listaLarga = (>9) . length \n"
testFile :: Archivo
testFile = Archivo "tesths" " palabra inicio ... palabra\n           \n... fin"

--Para ejecutar :l tpgrupal
--tamaño de un archivo en bytes
tamanio :: Archivo -> Int
tamanio file = (*8) (length (contenido file))

-- OK, pero yo usaría composición

--archivo está vacío
esvacio :: Archivo -> Bool
esvacio file = null (contenido file)

-- OK pero usaría composición

--cantidad de líneas de un archivo
cantidadlineas :: Archivo -> Int
cantidadlineas file = length (lines (contenido file))

-- IDEM ANTERIOR

--líneas del archivo es blanca
lineablanca :: Archivo -> Bool
lineablanca file = any (\x -> all (isSpace) x) (lines (contenido file))

-- IDEM ANTERIOR

--archivo es de extensión .hs
extensionhs :: Archivo -> Bool
extensionhs file = (intersect  ".hs" (nombre file)) == ".hs" --en revision

-- IDEM ANTERIOR

--Renombrar un archivo
type Modificacion = Archivo -> Archivo

renombrararchivo :: String -> Archivo -> Archivo
renombrararchivo name (Archivo a b) = Archivo name b

-- OK

--Agregar una nueva línea al archivo
agregarlinea :: Archivo -> Int -> String -> Archivo
agregarlinea file numero linea = Archivo (nombre file) (unlines ((take numero (lines (contenido file))) ++ [linea] ++ (drop numero (lines (contenido file)))))

-- Si lña respuesta es UFFFFF es porque falta delegar con buenos nombres
-- Delegar a funciones auxiliares para que sea mas declarativo (cajita negra que le paso algo y devuelve algo y no me interesa como esta hecho)
-- y para que sea mas expresivo 

--Quitar una línea del archivo
quitarlinea :: Archivo -> Int -> Archivo
quitarlinea file numero = Archivo (nombre file) (hacerMagia (lines (contenido file)) numero)

hacerMagia lineas numero = unlines ((take (numero - 1) lineas)  ++ (drop numero lineas))

-- IDEM ANTERIOR (agregarLinea)

--Reemplazar una línea del archivo por otra
reemplazarlinea :: Archivo -> Int -> String -> Archivo
reemplazarlinea file numero linea = Archivo (nombre file) (unlines ((take ((-) numero 1) (lines (contenido file))) ++ [linea] ++ (drop numero (lines (contenido file)))))

-- IDEM ANTERIOR (agregarLinea)

--Buscar y reemplazar en el archivo
buscarreemplazar :: Archivo -> String -> String -> Archivo
buscarreemplazar file palabra nueva = Archivo (nombre file) (unlines (map (\x -> if (all (isSpace) x) then x else unwords (map (\x -> if x == palabra then nueva else x) (words x))) (lines (contenido file))))

-- IDEM ANTERIOR (agregarLinea)

--Wrappear las líneas del archivo
wrappeararchivo :: Archivo -> Archivo
wrappeararchivo file = Archivo (nombre file) (unlines (wrappear' (lines (contenido file))))

wrappear' :: [String] -> [String]
wrappear' [] = []
wrappear' (linea:restolinea) = cortarlinea linea ++ wrappear' restolinea
cortarlinea :: String -> [String]
cortarlinea "" = [""]
cortarlinea linea = take 4 linea : cortarlinea (drop 4 linea) 

--Saber si una modificación es inútil
esnecesario :: Archivo -> String -> String
esnecesario file content = if (contenido file) == content then "Es una modificacion inutil" else "Modificacion necesaria"

--lines . contenido $ wrappeararchivo unTpGrupal 
