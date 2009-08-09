#!/bin/sh -x

MODULES="QtAssistant QtCore QtGui QtNetwork QtSql QtSvg QtXml"
PROGRAMS="pylupdate pyrcc pyuic"

for p in ${PROGRAMS}; do
    rm -f ${THIRD_DIR}/bin/${p}4
done

rm -fr ${THIRD_DIR}/sip/PyQt4

make -C ${INST_SRCDIR} install || exit $?

for d in ${MODULES}; do
    DLL=${INST_SRCDIR}/$d/$d.so
    ln -sf ${DLL} ${THIRD_DIR}/lib/
done

for p in ${PROGRAMS}; do
    PB=${p}4
    PROG=${INST_SRCDIR}/$p/${PB}
    strip ${STRIP_FLAGS} ${PROG}
    perl ${THIRD_DIR}/instwrapper.pl ${INST_SRCDIR}/$p ${PB} ${THIRD_DIR}/bin ${PB} <<EOF
        THIRD_DIR=${THIRD_DIR}
        PYTHONHOME=\${THIRD_DIR}/python/install
        PYTHONPATH=\${THIRD_DIR}/sip`test -z "$PYTHONPATH" || ":$PYTHONPATH"`
        PATH=\$PATH:\${THIRD_DIR}/lib
        LD_LIBRARY_PATH=\${THIRD_DIR}/lib:\$LD_LIBRARY_PATH
EOF
done

touch ${THIRD_DIR}/lib/pyqt-init.py.stub

cat <<EOF > ${THIRD_DIR}/lib/libxml2.pkg
NAME      = pyqt
PYUIC     = ${THIRD_DIR}/bin/pyuic4
PYRCC     = ${THIRD_DIR}/bin/pyrcc4
PYLUPDATE = ${THIRD_DIR}/bin/pylupdate4
EOF
