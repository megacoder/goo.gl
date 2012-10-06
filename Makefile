TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

INSTALL=install

.PHONY: ${TARGETS} ${SUBDIRS}

all::	goo.gl

${TARGETS}::

clobber distclean:: clean

check::	goo.gl
	./goo.gl ${ARGS}

install:: goo.gl
	${INSTALL} -D goo.gl ${BINDIR}/goo.gl

uninstall::
	${RM} ${BINDIR}/goo.gl

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
