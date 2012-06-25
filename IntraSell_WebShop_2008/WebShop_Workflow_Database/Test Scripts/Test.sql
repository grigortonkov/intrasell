-- Beispiele für Abfragen, die verschiedene von dieser Assembly implementierte SQL-Objekte ausführen

-----------------------------------------------------------------------------------------
-- Gespeicherte Prozedur
-----------------------------------------------------------------------------------------
-- exec StoredProcedureName


-----------------------------------------------------------------------------------------
-- Benutzerdefinierte Funktion
-----------------------------------------------------------------------------------------
-- select dbo.FunctionName()


-----------------------------------------------------------------------------------------
-- Benutzerdefinierter Typ
-----------------------------------------------------------------------------------------
-- CREATE TABLE test_table (col1 UserType)
-- go
--
-- INSERT INTO test_table VALUES (convert(uri, 'Instantiation String 1'))
-- INSERT INTO test_table VALUES (convert(uri, 'Instantiation String 2'))
-- INSERT INTO test_table VALUES (convert(uri, 'Instantiation String 3'))
--
-- select col1::method1() from test_table



-----------------------------------------------------------------------------------------
-- Benutzerdefinierter Typ
-----------------------------------------------------------------------------------------
-- select dbo.AggregateName(Column1) from Table1


select 'Führen Sie das Projekt aus, indem Sie die Datei "Test.sql" in Ihrem Projekt bearbeiten. Diese Datei befindet sich im Testskriptsordner im Projektmappen-Explorer.'