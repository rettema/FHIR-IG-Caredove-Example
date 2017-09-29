#!/bin/bash
name="Caredove-API"
path1=/home/caredove/Documents/FHIR/Caredove-API/
path2=/home/caredove/Downloads/
path3=/home/caredove/Documents/FHIR/IG-tools/
echo "================================================================="
echo === Publish $name IG!!! $(date -u) ===
echo "================================================================="
sleep 1
git status
sleep 3
python3 ${path3}definitions.py
sleep 3
git status
java -jar ${path2}org.hl7.fhir.igpublisher.jar -ig ${path1}ig.json -watch -tx n/a
