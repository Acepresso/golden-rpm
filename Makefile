# The rpmbuild pipeline normally downloads the sources from dist-git.
# Since golden RPM is intended for internal testing, dist-git adds an unnecessary complexity.
# Instead, we commit the source tarball directly rather than uploading it to dist-git.
# This is a workaround until it's possible to run RPM Build pipeline without
# dist-git dependency (see: https://redhat.atlassian.net/browse/RHELBLD-17960).

NAME = golden-rpm
ARCHIVE_NAME = $(NAME).tar.gz

.PHONY: tarball
tarball: $(ARCHIVE_NAME)

.PHONY: $(ARCHIVE_NAME)
$(ARCHIVE_NAME): clean
	# Do 'git ls-files' so that only tracked files are included.
	git ls-files -z | tar --exclude-vcs --exclude="*.tar.gz" --transform "s,^,$(NAME)/," -czf $(ARCHIVE_NAME) --null -T -

.PHONY: clean
clean:
	rm -f $(ARCHIVE_NAME)
