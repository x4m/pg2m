# contrib/pg2m/Makefile

MODULE_big = pg2m
OBJS = \
	$(WIN32RES) \
	nbtcompare.o \
	nbtdedup.o \
	nbtinsert.o \
	nbtpage.o \
	nbtree.o \
	nbtsearch.o \
	nbtsort.o \
	nbtsplitloc.o \
	nbtutils.o \
	nbtvalidate.o \
	nbtxlog.o

EXTENSION = pg2m
DATA = pg2m--1.0.sql
PGFILEDESC = "pgm access method - Piecewise Geometric Model based index"

#REGRESS = TODO

SHLIB_LINK += $(filter -lm, $(LIBS))

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/pg2m
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
