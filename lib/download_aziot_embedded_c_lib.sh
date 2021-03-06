command -v zip >/dev/null 2>&1 || { echo >&2 "Please install zip."; exit 1; }

git clone https://github.com/Azure/azure-sdk-for-c --branch 1.0.0-preview.4 sdkrepo

rm -rf azure-sdk-for-c
mkdir azure-sdk-for-c

cp sdkrepo/sdk/inc/azure/core/* azure-sdk-for-c
cp sdkrepo/sdk/inc/azure/core/internal/* azure-sdk-for-c
cp sdkrepo/sdk/inc/azure/iot/* azure-sdk-for-c
cp sdkrepo/sdk/inc/azure/iot/internal/* azure-sdk-for-c

cp -r sdkrepo/sdk/src/azure/core/* azure-sdk-for-c/
cp -r sdkrepo/sdk/src/azure/iot/* azure-sdk-for-c/
cp sdkrepo/sdk/src/azure/platform/az_noplatform.c azure-sdk-for-c/

sed -i -e 's/<azure\/core\/internal\//</g' -e 's/<azure\/core\//</g' -e 's/<azure\/iot\/internal\//</g' -e 's/<azure\/iot\//</g' ./azure-sdk-for-c/*

rm -rf sdkrepo/
