``` R
> library(RODBC)
> con <- odbcConnectAccess2007("../descargas/unidad03/Mascotas_2a/Mascotas2.accdb")
> con
RODBC Connection 6
Details:
  case=nochange
  DBQ=..\descargas\unidad03\Mascotas_2a\Mascotas2.accdb
  Driver={Microsoft Access Driver (*.mdb, *.accdb)}
  DriverId=25
  FIL=MS Access
  MaxBufferSize=2048
  PageTimeout=5
  UID=admin

> odbcGetInfo(con)
                         DBMS_Name                           DBMS_Ver 
                          "ACCESS"                       "12.00.0000" 
                   Driver_ODBC_Ver                   Data_Source_Name 
                           "03.51"                                 "" 
                       Driver_Name                         Driver_Ver 
                     "ACEODBC.DLL" "Microsoft Access database engine" 
                          ODBC_Ver                        Server_Name 
                      "03.80.0000"                           "ACCESS" 

> sqlTables(con)
                                               TABLE_CAT TABLE_SCHEM
1  ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
2  ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
3  ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
4  ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
5  ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
6  ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
7  ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
8  ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
9  ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
10 ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
11 ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
12 ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
13 ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
14 ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
15 ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
16 ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
17 ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
18 ..\\descargas\\unidad03\\Mascotas_2a\\Mascotas2.accdb        <NA>
                   TABLE_NAME   TABLE_TYPE REMARKS
1           MSysAccessStorage SYSTEM TABLE    <NA>
2                    MSysACEs SYSTEM TABLE    <NA>
3          MSysComplexColumns SYSTEM TABLE    <NA>
4             MSysIMEXColumns SYSTEM TABLE    <NA>
5               MSysIMEXSpecs SYSTEM TABLE    <NA>
6  MSysNavPaneGroupCategories SYSTEM TABLE    <NA>
7           MSysNavPaneGroups SYSTEM TABLE    <NA>
8   MSysNavPaneGroupToObjects SYSTEM TABLE    <NA>
9        MSysNavPaneObjectIDs SYSTEM TABLE    <NA>
10                MSysObjects SYSTEM TABLE    <NA>
11                MSysQueries SYSTEM TABLE    <NA>
12          MSysRelationships SYSTEM TABLE    <NA>
13              MSysResources SYSTEM TABLE    <NA>
14     ClasificaciónProductos        TABLE    <NA>
15                     Dueños        TABLE    <NA>
16                   Mascotas        TABLE    <NA>
17                 Navegación        TABLE    <NA>
18           ProductosxPágina        TABLE    <NA>
> odbcCloseAll()
> 
```
