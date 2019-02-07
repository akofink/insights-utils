#!/bin/bash

docker run -it --rm --name rhel -v `pwd`:/tmp:z -w /tmp rhel bash -c "
yum install -y openscap-scanner scap-security-guide;
ls -1 /usr/share/xml/scap/ssg/content/ssg-*-ds.xml | grep ssg-rhel7-ds;
oscap info /usr/share/xml/scap/ssg/content/ssg-rhel7-ds.xml;
oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_standard --results rhel7-content_profile_common.xml /usr/share/xml/scap/ssg/content/ssg-rhel7-ds.xml
"
