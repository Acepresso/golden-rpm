RPMBUILD_DIR := $(CURDIR)/rpmbuild
SPEC_FILE := golden-rpm.spec
SOURCE_SCRIPT := hello.sh

.PHONY: all build clean generate-dirs

all: build

generate-dirs:
	mkdir -p $(RPMBUILD_DIR)/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

build: generate-dirs
	cp $(SPEC_FILE) $(RPMBUILD_DIR)/SPECS/
	cp $(SOURCE_SCRIPT) $(RPMBUILD_DIR)/SOURCES/
	cp LICENSE $(RPMBUILD_DIR)/SOURCES/
	rpmbuild -ba --define "_topdir $(RPMBUILD_DIR)" $(RPMBUILD_DIR)/SPECS/$(SPEC_FILE)
	@echo "RPM built successfully:"
	@find $(RPMBUILD_DIR)/RPMS -name "*.rpm" -type f

clean:
	rm -rf $(RPMBUILD_DIR)
