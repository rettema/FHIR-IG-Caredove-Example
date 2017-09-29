# FHIR-IG-Caredove-Example
Authors:  Richard Ettema

Caredove-API example FHIR Implemenation Guide(IG) using the IG publisher and profile spreadsheets.  This is based on the [IG-Template](https://github.com/Healthedata1/IG-Template) design from Eric Haas.  See the [FHIR IG publisher documentation](http://wiki.hl7.org/index.php?title=IG_Publisher_Documentation) for how to set up your local environment. 

## Setup instructions

You will need to add/create the following directories in the root folder:

- `temp`
- `output`
- `qa`

You will need to check out the [HL7 FHIR STU3 v3.0.1 specification](https://gforge.hl7.org/svn/fhir/tags/stu3) from the HL7 gForge subversion repository and successfully build the specification on your local environment.  This will generate the IG Publisher and IG Pack artifacts.

or,

You will need to download the Implementation Tools - IG Publisher and IG Pack - from the HL7 FHIR STU3 v3.0.1 specification [Downloads](http://hl7.org/fhir/STU3/downloads.html) page.

Then edit the `igpublisher.bat` file for the Windows platform and/or the `publish.sh` shell script for the Linux platform to modify the directory paths/locations for:

- Location of the igpublisher.jar file
- Location of the Caredove IG root folder

Execute from a command prompt window the appropriate batch or script file based on your build environment operating system.