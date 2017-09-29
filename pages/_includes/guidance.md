## {{ page.title }}

<!-- TOC  the css styling for this is \pages\assets\css\project.css under 'markdown-toc'-->

* Do not remove this line (it will not be displayed)
{:toc}

<!-- end TOC -->

source pages/\_include/{{page.md_filename}}.md  file

### Introduction

The Caredove-API utilizes a number of HL7&reg; FHIR&reg; resource types for the request and response message bodies. This page provides a listing of those resource types.

#### Legend

The following conventions are used below in describing the content of the resource types:

- **(required)** - a required element
- **bold elementName** - An element that is used by the Caredove API
- **X** - An element in the FHIR specification, but not processed by Caredove
- **(coming soon!)** - Not used now, but on the Caredove API roadmap
- **(returned with GET)** - This element/resource is not sent with a POST, but may be returned with a GET after the referral has been submitted
<p></p>
<p></p>

### Primary Resource Types and Content

#### **Bundle**

FHIR Documentation: [/Bundle](http://www.hl7.org/fhir/bundle.html)

- The Bundle resource type is used to send a collection of resources used with a /ReferralRequest to the Caredove Server in a single HTTPS request/response \(See [Batch/Transactions](http://www.hl7.org/fhir/http.html#transaction)\)

#### **ReferralRequest**

FHIR Documentation: [/ReferralRequest](http://www.hl7.org/fhir/referralrequest.html)

- Contains the sub-resource **/Patient**

##### Implementation Notes:

- **resourceType** *(required)*: = "ReferralRequest"
- *X identifier: (coming soon for external identifiers!)*
  - *(Caredove referral_ID returned on GET)*
- *X definition:*
- *X basedOn:*
- *X replaces:*
- *X groupIdentifier:*
- **status**: default="active".
  - =draft for referral method 2) to launch the webform which must be completed before submitting the referral
  - =active for referral mehtod 3) & 4)
- **intent**: default="proposal". This element is not processed by Caredove, but is required by the STU3 standard.
- *X type:*
- **priority**: Most common value ="routine".
- *X serviceRequested: (coming soon!) (returned with GET)*
- **subject**: REFERENCE to a single /Patient resource (only REQUIRED for referral methods 3) & 4))
- *X context:*
- *X occurrence[x]:*
- *X authoredOn: (returned with GET)*
- *X requester: (coming soon! Not needed with authenticated submissions)*
- *X specialty:*
- *X recipient: (returned with GET)*
- **reasonCode**: Use reasonCode.text to submit a descriptive string text of the reason for referral
- *X reasonReference:*
- *X description: (coming soon for GET!)*
- **supportingInfo**: Used to connect other resources including
  - /DocumentReference (coming soon!)
  - /Medications (coming soon!)
  - /Allergies (coming soon!)
- *X note: (coming soon!)*
- *X relevantHistory: (coming soon)*

#### **Patient**

FHIR Documentation: [/Patient](http://www.hl7.org/fhir/patient.html)

- Is a sub-resource to ReferralRequest.subject.
- Contains the sub-resource **/Practitioner**

##### Implementation Notes:

- **resourceType** *(required)*: = "Patient"
- **identifier**: Accepts various types of Patient Identifiers. See example for an Ontario Health Card Number, with an extension to accept Version Code
  - **.type**
  - **.system**
  - **.value**
  - **.period**
  - **.extension**: Used for capturing Health Card Version Code (Ontario) - see example
- *X active:*
- **name**: Accepts 1st [HumanName](http://www.hl7.org/fhir/datatypes.html#HumanName). Uses fields .given* (middle name as 2nd .given), .family, .prefix *(coming soon!)*
- **telecom**: Accepts [ContactPoint](http://www.hl7.org/fhir/datatypes.html#ContactPoint) as follows:
  - Primary phone derived from ".system":"phone", "value":"#", "use":"home"
  - Secondary phone derived from ".system":"phone", "value":"#", "use":"work"
  - Primary Email derived from ".system":"email", "value":"#"
- **gender**: male | female | other | unknown
- **birthdate**: Accepts a [Date](http://www.hl7.org/fhir/datatypes.html#date), e.g., 1994-12-31
- *X deceased[x]:*
- **address**: Accepts first [Address](http://www.hl7.org/fhir/datatypes.html#Address) as follows.
  - **.line** - Unit, PO/Postal Box, Street #, Street Name *(accepts only first value - multiple .line comin soon!)*
  - **.city**
  - **.state** - state/province/etc.
  - **.postalCode** - Postal Code/Zip Code/etc.
  - **.country**
- **maritalStatus**: Currently accepts 6 of 11 [codes](http://www.hl7.org/fhir/valueset-marital-status.html) U-Unmarried (Single), M - Married, T - Domestic Partner (Common Law), L - Legally Seperated, D - Divorced, W - Widowed. Uses coding.code and coding.display. Provides .text on GET.
- *X multipleBirth[x]:*
- *X photo:*
- **contact**: Accepts 1st contact as alternate contact.
  - **.relationship**: Currently accepts the following as coding.text (note: does not currently use the FHIR [V2 Contact Roles](http://www.hl7.org/fhir/v2/0131/index.html): Spouse, Son/Daughter, Sibling, Parent, Mother, Father, Friend, Legal Guardian. An other free text value will also be accepted.
  - **.name**: same format as subject.name
  - **.telecom**: same format as subject.address, but does not accept email
  - **.address**: same format as subject.address
- *X animal:*
- *X communication:*
- **generalPractitioner**: REFERENCE to /Practitioner, patient's primary care provider
- *X managingOrganization: (coming Soon!)*
- *X link: Not used (coming soon!)*

#### **Practitioner**

FHIR Documentation: [/Practitioner](http://www.hl7.org/fhir/practitioner.html)

- Is a sub-resource to ReferralRequest.subject.Patient.generalPractitioner

##### Implementation Notes:

- **resourceType** *(required)*: = "Practitioner"
- *X identifier: (coming soon!)*
- *X active:*
- **name**: Accepts 1st HumanName's. Uses fields .given*, .family, .prefix *(coming soon!)*, .suffix *(coming soon!)*
- **telecom**: Accepts 1st ContactPoint. Uses field(s) .system="phone", value="###"
- *X address: (coming soon!)*
- *X gender:*
- *X birthDate:*
- *X photo:*
- *X qualification:*
- *X communication:*
<p></p>
<p></p>

### Supporting Info Resource Types and Content

#### **Consent**

FHIR Documentation: [/Consent](http://www.hl7.org/fhir/consent.html)

- Is a sub-resource to **ReferralRequest.supportinInfo**
- Is only needed for direct targeted referral, otherwise it is collected within the Caredove interface.
- ReferralRequests always use the "Privacy Consent Directive: Agreement to collect, access, use or disclose (share) information"

##### Implementation Notes:

- **resourceType** *(required)*: = "Consent"
- **identifier**: Same # as the referral_ID
- **status**: "=active" on submission
- *X category:*
- **patient**:
- **dateTime**:
- *X consentingParty:*
- *X actor*
- *X action*
- *X organization*
- *X source[x]*
- *X policy*
- *X policyRule*
- *X purpose: (coming soon!)*
- *X dataPeriod:*
- *X data:*
- *X except:*

#### **DocumentReference**

FHIR Documentation: [/DocumentReference](http://www.hl7.org/fhir/documentreference.html), [Attachment Data Type](http://www.hl7.org/fhir/datatypes.html#Attachment)

- Is a sub-resource to **ReferralRequest.supportinInfo**

##### Implementation Notes:

- **resourceType** *(required)*: = "DocumentReference"
- *X masterIdentifier:*
- **status**: = "current" *(required by FHIR, always use current)
- *X docStatus:*
- **type**:
- *X class:*
- *X subject: &lt; Consider connecting to /patient resource*
- *X created:*
- *X indexed:*
- *X author:*
- *X authenticator:*
- *X custodian:*
- *X relatesTo:*
- *X description:*
- *X securityLabel:*
- **content**:
  - **attachment**: 
    - **contentType**:
    - *X language:*
    - *X data:*
    - **url**: Link to a binary resource
    - *X hash:*
    - *X title:*
    - *X creation:*
  - **format**:
- *X context :*
- *EXTENSION FOR FILENAME (Comin Soon!)*

#### **Binary**

FHIR Documentation: [/Binary](http://www.hl7.org/fhir/binary.html)

- Is a sub-resource to **ReferralRequest.supportinInfo.documentReference**

##### Implementation Notes:

- **contentType**
- *X securityContent*
- **content**

#### **Medication**

FHIR Documentation: [/Medication](http://www.hl7.org/fhir/medication.html)

- Is a sub-resource to **ReferralRequest.supportinInfo**
- *(Comin Soon!)*

#### **AllergyIntolerence**

FHIR Documentation: [/AllergyIntolerence](http://www.hl7.org/fhir/allergyintolerence.html)

- Is a sub-resource to **ReferralRequest.supportinInfo**
- *(Comin Soon!)*
