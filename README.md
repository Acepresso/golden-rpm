# Basic RPM in Konflux

This is a basic RPM package in compliance with Conforma policy. 

The RPM uses a self-contained approach (based on [konflux-rpm-demo3](https://gitlab.cee.redhat.com/pkabelka/konflux-rpm-demo3) project) where both the [spec file](golden-rpm.spec) and sources live in the same repository.

The RPM is signed and attested by Tekton Chains. For verification, use the in-cluster public key:
`k8s://openshift-pipelines/public-key`.
