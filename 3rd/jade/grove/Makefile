
#############################################################################
# Makefile for building libgrove.so.1.3
# Generated by tmake at 14:28, 1999/10/06
#     Project: grove
#    Template: ../pro/jlib
#############################################################################

####### Compiler, tools and options

CC	=	egcs
CXX	=	eg++
CFLAGS	=	-pipe -O2 -fno-strength-reduce -fPIC
CXXFLAGS=	-DSTDC_HEADERS=1 \
-DHAVE_LIMITS_H=1 -DHAVE_ST_BLKSIZE=1 -O2 -fno-strength-reduce -fPIC
INCPATH	=	-I../sp -I../generic
LINK	=	eg++ -pthread
LFLAGS	=	-shared
LIBS	=	
AR	=	ar cqs
RANLIB	=	
MOC	=	moc

TAR	=	tar -cf
GZIP	=	gzip -9f

####### Files

HEADERS =	LocNode.h \
		Node.h
SOURCES =	LocNode.cxx \
		Node.cxx
OBJECTS =	LocNode.o \
		Node.o
SRCMOC	=	
OBJMOC	=	
DIST	=	
TARGET	=	libgrove.so.1.3
TARGETA	=	../libs/libgrove.a
TARGETD	=	libgrove.so.1.3
TARGET0	=	libgrove.so
TARGET1	=	libgrove.so.1

####### Implicit rules

.SUFFIXES: .cpp .cxx .cc .C .c

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o $@ $<

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o $@ $<

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o $@ $<

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o $@ $<

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o $@ $<

####### Build rules

all: ../libs/libgrove.so.1.3

../libs/libgrove.so.1.3: $(OBJECTS) $(OBJMOC) 
	-rm -f $(TARGET) $(TARGET0) $(TARGET1)
	$(LINK) $(LFLAGS) -o $(TARGETD) $(OBJECTS) $(OBJMOC) $(LIBS)
	-ln -s $(TARGET) $(TARGET0)
	-ln -s $(TARGET) $(TARGET1)
	-rm -f ../libs/$(TARGET)
	-rm -f ../libs/$(TARGET0)
	-rm -f ../libs/$(TARGET1)
	-mv $(TARGET) $(TARGET0) $(TARGET1) ../libs/

staticlib: $(TARGETA)

$(TARGETA): $(OBJECTS) $(OBJMOC) 
	-rm -f $(TARGETA)
	$(AR) $(TARGETA) $(OBJECTS) $(OBJMOC)

moc: $(SRCMOC)

tmake:
	tmake grove.pro

dist:
	$(TAR) grove.tar grove.pro $(SOURCES) $(HEADERS) $(DIST)
	$(GZIP) grove.tar

clean:
	-rm -f $(OBJECTS) $(OBJMOC) $(SRCMOC) $(TARGET)
	-rm -f $(TARGET0) $(TARGET1) $(TARGETA)
	-rm -f *~ core

####### Compile

LocNode.o: LocNode.cxx \
		LocNode.h \
		Node.h

Node.o: Node.cxx \
		Node.h

