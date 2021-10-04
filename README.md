# Cordapp DBMigration Postgress DevelopmentMode
Pasos a seguir para la migracion hacia una DB Postgress de un cordapp 4.5 en modo de desarrollo

Sigue lo indicado en: https://docs.r3.com/en/platform/corda/4.5/open-source/node-database.html#h2

1. Prerequisitos

// Tenemos 3 nodos - un notary el cual usara una base de datos H2 y los otros dos nodos usaran/almacenaran una base de datos PostgreSQL database, 
// en esta situacion los nodos ya han sido seteados al usar un pre-bootstrapped network (e.g. ya fueron creados con la task deployNodes atraves de gradlew), es asi que ya
// contamos con una carpeta build generada.

2. Ingreso a: cd buil\nodes\IJC

//confirmo la version de corda al ejecutar::

java -jar corda.jar --version
Version: 4.5
Revision: 461cf0709ca6788ec2247d12be6b2656fe718ea2
Platform Version: 7
Vendor: Corda Open Source

3. Abro el pgAdmin del Postgres
// En Databases -> Create -> Database -> Demo (ex. Demo = NombreDeLaDB)
// En la DB creada Demo ->  Query Tool -> executo los scripts que se encuentran dentro de la carpeta ScriptsSQL.
  // Linea 1/2 se crea party_a usuario y schema party_a_schema
  // Linea 3 permite a los usuarios accesar al schema y crear objetos en el schema
  // Linea 4/5/6/7 adiciona permisos para las tablas actuales en el schema y para las tablas creadas en el futuro 
  // 8) beacuse the user name and the schema namespace are different we make any SQL run by our user to be prefixed  
  by a schema namespace (in general Corda add such prefix to most of the SQL queries but not all)

// Ejecutado los scriptsSQL son creados Schemas -> nombreParty_schema (pero sin tablas, estas seran creados por los nodos) 
// e igualmente son creados Login/Group Roles (Nombre de los Party)

3. Configuracion del nodo
// Ingresamos a  cd buil\nodes\IJC, en el archivo node.conf adicionamos:
    dataSourceProperties = {
    dataSourceClassName = "org.postgresql.ds.PGSimpleDataSource"
    dataSource.url = "jdbc:postgresql://[HOST]:[PORT]/[DATABASE]" (ex.Demo. Ver carpeta build\nodes\xx) 
    dataSource.user = [USER]
    dataSource.password = [PASSWORD]
    }
    database = {
      transactionIsolationLevel = READ_COMMITTED
    }

4. En el path buil\nodes\IJC\drivers debemos colocar el postgresql-42.1.4.jar (https://jdbc.postgresql.org/download/postgresql-42.1.4.jar o encontrado en este repositorio)

5. Los pasos 3 y 4 seran realizados para cada uno de los nodos que deseemos realizar la migracion.

6. Ejecutamos en build\nodes\ java -jar runnodes.jar

7. El proceso de migracion finaliza. Consultamos en el pgAdmin seleccionando una tabla -> click derecho -> Scripts -> SELECT Scripts para visualizar lo que esta dentro de la tabla.

