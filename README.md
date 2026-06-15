# Basic RPM in Konflux

This is a basic RPM package in compliance with Conforma policy. 

The RPM uses a self-contained approach (based on [konflux-rpm-demo3](https://gitlab.cee.redhat.com/pkabelka/konflux-rpm-demo3) project) where both the [spec file](golden-rpm.spec) and sources live in the same repository.

The RPM is signed and attested by Tekton Chains. For verification, use the in-cluster public key:
`k8s://openshift-pipelines/public-key`.

## Source Tarball

The `golden-rpm.tar.gz` is committed to simplify the workflow.

Why?

The rpmbuild pipeline normally downloads sources from dist-git. Since golden RPM is intended for internal testing, dist-git adds unnecessary complexity. We commit the tarball directly instead, as a workaround until it's possible to run the RPM build pipeline without dist-git dependency (see [RHELBLD-17960](https://redhat.atlassian.net/browse/RHELBLD-17960)).

**Update the tarball when changing sources:**
```bash
make tarball
git add golden-rpm.tar.gz
git commit -m 'Update source tarball'
```

