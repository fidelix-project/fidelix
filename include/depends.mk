# Adds the ability to mark a target as dependent on a package by adding the
# package-name target as a dependency.

include sysconfig.mk

ifndef _INC_DEPENDS
_INC_DEPENDS=y

.PHONY: package-%.mk
package-%.mk:

package-%:
	make -C $(OS_SRC_DIR) install-$*

hostpackage-%:
	make -C $(OS_SRC_DIR) OS_ARCH=$(HOST_ARCH) SYSROOT=/ install-$*

endif

