#!/bin/sh -x

exec xsltproc --xinclude -o \
    "$SERNA_OUTPUT_FILE" "$SERNA_XSL_STYLESHEET" "$SERNA_XML_SRCFULLPATH"
