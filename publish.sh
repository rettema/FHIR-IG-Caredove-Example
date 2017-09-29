#!/bin/bash
name="IG-starter-template"
path1=/home/caredove/Documents/FHIR/Caredove-API/
path2=/home/caredove/Downloads/
echo "================================================================="
echo === Publish $name IG!!! $(date -u) ===
echo "================================================================="
git status
java -jar ${path2}org.hl7.fhir.igpublisher.jar -ig ${path1}ig.json -watch
