### Load tester for the frontend application ###

The tool here is to apply the load on the front end application and to check
if the Horizontal Pod Autoscaler (HPA) is working fine with the Kubernetes


## Prerequisites

install siege on the the machine
Debin/Ubuntu systems: sudo apt-get install siege
CentOS/RHEL systems: yum install epel-release && yum install siege

## Usage

-checkout the current status of the pods (HPA) for the frontend application in staging

   "make hpa-staging"

-checkout the current status of the pods (HPA) for the frontend application in production

   "make hpa-production"

-Apply load on the staging pods which are part of the fronend application

   "make stag-stress"

-Apply load on the production pods which are part of the fronend application

   "make prod-stress"

