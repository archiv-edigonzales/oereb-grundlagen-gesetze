#!/usr/bin/env bash

java -jar $ILI2PG_PATH/ili2pg-4.1.0.jar \
--dbhost localhost --dbport 54321 --dbdatabase edit --dbusr admin --dbpwd admin \
--dbschema agi_oereb_gesetze --models OeREBKRMvs_V1_1 \
--defaultSrsCode 2056 --strokeArcs --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createUnique --createNumChecks --nameByTopic \
--createImportTabs --export neu-ch.so.sk.gesetze.oereb.xml
