#!/bin/bash
# Sync

sudo ./ErfanGSIs/url2GSI.sh $ROM_URL $ROM_NAME
    mkdir final

    export date2=`date +%Y%m%d%H%M`
    export sourcever2=`cat ./ErfanGSIs/ver`
    sudo chmod -R 777 ErfanGSIs/output
               
    cd ErfanGSIs/output/
               
    curl -sL https://git.io/file-transfer | sh

    zip -r "$ZIP_NAME"-Aonly-"$sourcever2"-"$date2"-ErfanGSI.7z *-Aonly-*.img
    zip -r "$ZIP_NAME"-AB-"$sourcever2"-"$date2"-ErfanGSI.7z *-AB-*.img

    echo "::set-env name=DOWNLOAD_A::$(./transfer $MIR "$ZIP_NAME-Aonly-$sourcever2-$date2-ErfanGSI.7z" | grep -o -P '(?<=Download Link: )\S+')"
    echo "::set-env name=DOWNLOAD_AB::$(./transfer $MIR "$ZIP_NAME-AB-$sourcever2-$date2-ErfanGSI.7z" | grep -o -P '(?<=Download Link: )\S+')"
    echo "::set-env name=DOWNLOAD_A2::$(./transfer $MIR2 "$ZIP_NAME-Aonly-$sourcever2-$date2-ErfanGSI.7z" | grep -o -P '(?<=Download Link: )\S+')"
    echo "::set-env name=DOWNLOAD_AB2::$(./transfer $MIR2 "$ZIP_NAME-AB-$sourcever2-$date2-ErfanGSI.7z" | grep -o -P '(?<=Download Link: )\S+')"
