sed -i "s|NEO4j_VERSION|$NEO4j_VERSION|g" docker-compose.yml &&
sed -i "s|STRUCTR_LICENSE|$STRUCTR_LICENSE|g" docker-compose.yml &&
sed -i "s|STRUCTR_VERSION|$STRUCTR_VERSION|g" docker-compose.yml &&
sed -i "s|STRUCTR_WEBAPP_PATH|$STRUCTR_WEBAPP_PATH|g" docker-compose.yml &&

if [ -z ${STRUCTR_CONF_FILE:-"./structr.conf"} ]; then
    touch ./structr.conf
fi