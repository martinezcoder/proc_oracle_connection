#
#   Nombre      ::  Makefile
#
#   Descripcion ::  Makefile for a basic Oracle Connection
#
#   Modificaciones ::
#       28/03/2011  Francisco Javier Martínez
#
#-------------------------------------------------------------------------------

#---------------------------------------------------------------

.SUFFIXES: .c .o

#--- Compiler Variables

CFLAGS=$(OPTIONSC)


#--- Includes

INC_PATH=-I$(RV6_HOME)/include -I$(RV6_HOME)/include/tibrv

#--- Libraries

LIB_PATH=-L$(MYAPP_HOME)/lib

LIB_RV= $(LIBS_MIDDLEWARE)
LIB_Z = -lz

LIBS=$(LIB_PATH) $(LIB_Z) $(LIB_RV) -lm

#--- Pro*C

PROC=proc
PROCFLAGS=parse=full $(OPTIONSPROCMYAPPBD)
.SUFFIXES: .pc
PROC_INC_PATH= include=$(RV6_HOME)/include/ include=$(RV6_HOME)/include/tibrv/

#--- Objects

PROC_EXE = pruebaproc
OBJS =   pruebaproc.o


#---------------------------------------------------------------

todo: $(PROC_EXE)

borrar:
	rm -f *.o
	rm -f *.lis
	rm -f afLeerFeedersDeBD.c
	rm -f afObtenerIdEntorno.c
	rm -f $(PROC_EXE)

$(PROC_EXE): $(OBJS)
	$(MAKE)	-f procbuild.mk	build OBJS='$(OBJS)' LIBS='$(LIBS)'	EXE=$@
	echo COPYING $@ to bin directory
.c.o :
	echo "- Compiling " $<
	$(CC) $(CFLAGS) $(INC_PATH) -c $<

.pc.o:
	echo "- Compilando " $<
	$(PROC) $(PROCFLAGS) $(PROC_INC_PATH) iname=$*
	$(CC) $(CFLAGS) $(INC_PATH) -c $*.c -o $*.o
	rm $*.c
