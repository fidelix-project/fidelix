include sysconfig.mk

QUIET_MAKE=$(MAKE) --no-print-directory
REPO_CONTENTS=$(OS_RELEASE_PKG_DIR)/contents
REPO_DEPENDS=$(OS_RELEASE_PKG_DIR)/depends

.PHONY: update-repo-metadata $(REPO_CONTENTS) $(REPO_DEPENDS)
update-repo-metadata: $(REPO_CONTENTS) $(REPO_DEPENDS)

$(REPO_CONTENTS):
	$(QUIET_MAKE) -C $(OS_SRC_DIR) print-pkgs | sort > $@

$(REPO_DEPENDS):
	$(QUIET_MAKE) -C $(OS_SRC_DIR) print-depends | sort > $@

