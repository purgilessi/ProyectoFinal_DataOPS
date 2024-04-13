CREATE DATABASE Kaggle;
USE Kaggle;
GO

--EN CASO NO EXISTA LA TABLA, SE CREA
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks') AND type = 'U')
	CREATE TABLE dbo.starbucks(
	Beverage_category VARCHAR (200),
	Beverage VARCHAR(200),
	Beverage_prerp VARCHAR(200),
	Calories INT,
	Total_Fat_g VARCHAR(200),
	Trans_Fat_g DECIMAL,
	Saturated_Fat_g DECIMAL,
	Sodium_mg DECIMAL,
	Total_Carbohydrates_g INT,
	Cholesterol_mg INT,
	Dietary_Fibre_g INT,
	Sugars_g INT,
	Protein_g DECIMAL,
	Vitamin_A_DV VARCHAR(10),
	Vitamin_C_DV VARCHAR (10),
	Calcium_DV VARCHAR(10),
	Iron_DV VARCHAR(10),
	Caffeine_mg VARCHAR(10)
	)
GO
-- SI TABLA YA EXISTE, -> LA LIMPIAREMOS
TRUNCATE TABLE dbo.starbucks
GO

--IMPORTAR LA DATA DEL CSV
BULK INSERT dbo.starbucks
FROM 'D:\Certus\Dataops\FINAL\ProyectoFinal_DataOPS\datasets\starbucks.csv'
WITH
(
	FIRSTROW = 2, --IMPORTA DATA DE LA FILA 2 PQ LA PRIMERA FILA ES LA CABECERA
	FIELDTERMINATOR = ',', --DELIMITADOR DE COLUMNAS
	ROWTERMINATOR = '0x0a' --DELIMITADOR DE LAS FILAS, HACE REF A UN SALTO DE LINEA
)