include $(ORACLE_HOME)/precomp/lib/env_precomp.mk

# This Makefile builds the sample programs in 
# $(ORACLE_HOME)/precomp/demo/proc, and can serve as a template for linking
# customer applications.
#
# SAMPLES is a list of the c proc sample programs.
# CPPSAMPLES is a list of the c++ proc sample programs.
# OBJECT_SAMPLES is a list of the proc sample programs using the new
# type features.  You must install ott in addition to proc to run some
# of those samples.
#
#
#
# The target 'build' puts together an executable $(EXE) from the .o files
# in $(OBJS) and the libraries in $(PROLDLIBS).  It is used to build the
# c sample programs.  The rules to make .o files from .c and .pc files are
# later in this file.
# ($(PROLDLIBS) includes the client shared library, and $(STATICPROLDLIBS) does
# not.)
#
build: $(OBJS)
	@$(CC) -o $(EXE) $(OBJS) $(LIBS) -L$(LIBHOME)  $(PROLDLIBS)
build_static: $(OBJS)
	@$(CC) -o $(EXE) $(OBJS) -L$(LIBHOME) $(STATICPROLDLIBS)
