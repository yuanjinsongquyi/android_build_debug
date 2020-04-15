#!/bin/bash

hub checkout test
VERSION_NAME=`grep -oP 'versionName "\K(.*?)(?=")' ./app/build.gradle`
VERSION_CODE=`grep -oP '(?<=versionCode\s)\d+' ./app/build.gradle`
FILENAME="${APP_NAME}-v${VERSION_NAME}-${VERSION_CODE}"
TYPEPAC=${TYPEPACKAGE}
curl -F "file=@app/build/outputs/apk/google/debug/${FILENAME}.apk" -F "_api_key=${CI_TOKEN}" https://www.pgyer.com/apiv2/app/upload





