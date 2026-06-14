Name:           golden-rpm
Version:        0.1.0
Release:        %autorelease
Summary:        Basic RPM built in Konflux

License:        Apache-2.0
URL:            https://github.com/conforma/golden-rpm
Source0:        %{name}.tar.gz

BuildArch:      noarch
Requires:       bash

%description
Basic RPM built in Konflux.

%global debug_package %{nil}

%prep
%autosetup -n %{name}

%install
install -d %{buildroot}%{_bindir}
install -m 0755 src/golden-rpm/golden-hello %{buildroot}%{_bindir}/golden-hello

%files
%{_bindir}/golden-hello

%changelog
%autochangelog
