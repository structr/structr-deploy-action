ACTION_PATH=$1
cd $ACTION_PATH

echo "Replacing variables for Structr and Neo4j docker configuration"

sed -i "s|NEO4j_VERSION|$NEO4j_VERSION|g" docker-compose.yml &&
sed -i "s|STRUCTR_LICENSE|$STRUCTR_LICENSE|g" docker-compose.yml &&
sed -i "s|STRUCTR_VERSION|$STRUCTR_VERSION|g" docker-compose.yml &&
sed -i "s|STRUCTR_WEBAPP_PATH|$STRUCTR_WEBAPP_PATH|g" docker-compose.yml &&

if [ -z "$STRUCTR_CONF_FILE" ]; then
    STRUCTR_CONF_FILE="./structr.conf"
    touch ./structr.conf
fi

sed -i "s|STRUCTR_CONF_FILE|$STRUCTR_CONF_FILE|g" docker-compose.yml
