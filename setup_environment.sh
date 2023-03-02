echo "Replacing variables for Structr and Neo4j docker configuration"
echo Neo4j version: $NEO4j_VERSION
echo Structr version: $STRUCTR_VERSION
echo Structr license: $STRUCTR_LICENSE
echo Structr webapp path: $STRUCTR_WEBAPP_PATH

sed -i "s|NEO4j_VERSION|$NEO4j_VERSION|g" docker-compose.yml &&
sed -i "s|STRUCTR_LICENSE|$STRUCTR_LICENSE|g" docker-compose.yml &&
sed -i "s|STRUCTR_VERSION|$STRUCTR_VERSION|g" docker-compose.yml &&
sed -i "s|STRUCTR_WEBAPP_PATH|$STRUCTR_WEBAPP_PATH|g" docker-compose.yml &&

if [ -z ${STRUCTR_CONF_FILE:-"./structr.conf"} ]; then
    touch ./structr.conf
fi

echo Structr conf file path: $STRUCTR_CONF_FILE
sed -i "s|STRUCTR_CONF_FILE|$STRUCTR_CONF_FILE|g" docker-compose.yml