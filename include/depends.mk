# Adds the ability to mark a target as dependent on a package by adding the
# package-name target as a dependency.

include sysconfig.mk

ifndef _INC_DEPENDS
_INC_DEPENDS=y

package-%:
	make -C $(OS_SRC_DIR) install-$*

endif

