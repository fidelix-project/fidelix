# This Makefile does not actually do anything. It exists so that package
# Makefiles that need to use a non-standard build process can specify
# PKG_BUILDSYSTEM=custom and then implement their build process by defining the
# .stamp_build target in their package Makefile.

%:
	$(info Target $@ is not implemented for $(PKG_NAME))

