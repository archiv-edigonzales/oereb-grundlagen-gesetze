#!/usr/bin/env bash

java -jar $ILI2PG_PATH/ili2pg-4.1.0.jar \
--dbschema agi_oereb_gesetze --models "OeREBKRM_V1_1;OeREBKRMvs_V1_1" \
--defaultSrsCode 2056 --strokeArcs --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createUnique --createNumChecks --nameByTopic \
--createImportTabs --createscript sql/agi_oereb_gesetze.sql
