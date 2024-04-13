import os

location = "D:/Certus/Dataops/FINAL/ProyectoFinal_DataOPS/datasets"

###Validar que la carpeta exista###
if not os.path.exists(location):
    ##En caso mi carpeta no exista, voy a crear una nueva##
    os.mkdir(location) ##mkdir -> make directory
else:
    ##Si la carpeta ya existe, entonces borramos el contenido##
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) ##elimino todos los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name)) ##rmdir -> remove directory / elimino todas mis carpetas
            
from kaggle.api.kaggle_api_extended import KaggleApi
api = KaggleApi()
api.authenticate()
print(api.dataset_list(search='henryshan'))

api.dataset_download_file('henryshan/starbucks','starbucks.csv',path=location,quiet=False)

print(f"Se ha descargado el archivo exitosamente en {location}")
