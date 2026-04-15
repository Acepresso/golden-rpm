Name:           golden-rpm
Version:        1.0
Release:        1%{?dist}
Summary:        Trivial noarch RPM build in compliance with Conforma

License:        GPL
URL:            https://github.com/conforma/golden-rpm
Source0:        hello.sh

BuildArch:      noarch

%description
Trivial noarch RPM build in compliance with Conforma.
This package contains a simple hello world script for testing purposes.

%prep
# No prep needed for a simple script

%build
# No build needed for a simple script

%install
mkdir -p %{buildroot}%{_bindir}
install -m 0755 %{SOURCE0} %{buildroot}%{_bindir}/hello

%files
%{_bindir}/hello

%changelog
* Mon Apr 14 2025 Conforma Team <conforma@redhat.com> - 1.0-1
- Initial release of golden-rpm
