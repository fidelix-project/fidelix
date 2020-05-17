--- sysdef.h.orig
+++ sysdef.h
@@ -32,6 +32,7 @@
 #include <errno.h>
 #include <signal.h>
 #include <time.h>
+#include <sys/types.h>
 
 
 #define	KBLOCK		8192	/* Kill grow.			 */
