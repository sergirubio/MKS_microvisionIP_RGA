#=============================================================================
#
# file :        Makefile
#
# description : Makefile to generate a TANGO device server.
#
# project :     MKS_MicrovisionIP_RGA
#
#=============================================================================
#                This file is generated by POGO
#        (Program Obviously used to Generate tango Object)
#=============================================================================
#
#
# MAKE_ENV is the path to find common environment to build project
#
MAKE_ENV = /segfs/tango/cppserver/env

#=============================================================================
# PACKAGE_NAME is the name of the library/device/exe you want to build
#
PACKAGE_NAME = MKS_MicrovisionIP_RGA
MAJOR_VERS   = 1
MINOR_VERS   = 0
RELEASE      = Release_$(MAJOR_VERS)_$(MINOR_VERS)

# #=============================================================================
# # RELEASE_TYPE
# # - DEBUG     : debug symbols - no optimization
# # - OPTIMIZED : no debug symbols - optimization level set to O2
# #-----------------------------------------------------------------------------
RELEASE_TYPE = DEBUG

#=============================================================================
# OUTPUT_TYPE can be one of the following :
#   - 'STATIC_LIB' for a static library (.a)
#   - 'SHARED_LIB' for a dynamic library (.so)
#   - 'DEVICE' for a device server (will automatically include and link
#            with Tango dependencies)
#   - 'SIMPLE_EXE' for an executable with no dependency (for exemple the test tool
#                of a library with no Tango dependencies)
#
OUTPUT_TYPE = DEVICE

#=============================================================================
# OUTPUT_DIR  is the directory which contains the build result.
# if not set, the standard location is :
#	- ./lib   if OUTPUT_TYPE is SHARED_LIB or STATIC_LIB
#	- ./bin for others
#
#OUTPUT_DIR =

#=============================================================================
# Tango Class list used by project
#
SOCKET_CLASS = Socket
SOCKET_HOME  = ../../../protocols/Socket/src

MKS_MICROVISIONIP_RGA_CLASS = MKS_MicrovisionIP_RGA
MKS_MICROVISIONIP_RGA_HOME  = ./


#=============================================================================
# INC_DIR_USER is the list of all include path needed by your sources
#   - for a device server, tango dependencies are automatically appended
#   - '-I ../include' and '-I .' are automatically appended in all cases
#
INC_DIR_USER= -I . \
              -I $(SOCKET_HOME)\
              -I $(MKS_MICROVISIONIP_RGA_HOME)

#=============================================================================
# LIB_DIR_USER is the list of user library directories
#   - for a device server, tango libraries directories are automatically appended
#   - '-L ../lib' is automatically appended in all cases
#
LIB_DIR_USER=

#=============================================================================
# LFLAGS_USR is the list of user link flags
#   - for a device server, tango libraries directories are automatically appended
#   - '-ldl -lpthread' is automatically appended in all cases
#
# !!! ATTENTION !!!
# Be aware that the order matters. 
# For example if you must link with libA, and if libA depends itself on libB
# you must use '-lA -lB' in this order as link flags, otherwise you will get
# 'undefined reference' errors
#
#LFLAGS_USR+=


#=============================================================================
# CXXFLAGS_USR lists the compilation flags specific for your library/device/exe
# This is the place where to put your compile-time macros using '-Dmy_macro'
#
# -DACE_HAS_EXCEPTIONS -D__ACE_INLINE__ for ACE
#
#CXXFLAGS_USR+= -Wall


#=============================================================================
# TANGO_REQUIRED 
# - TRUE  : your project depends on TANGO
# - FALSE : your project does not depend on TANGO
#-----------------------------------------------------------------------------
# - NOTE : if PROJECT_TYPE is set to DEVICE, TANGO will be auto. added
#-----------------------------------------------------------------------------  
TANGO_REQUIRED = TRUE



#=============================================================================
#	include Standard TANGO compilation options
#
include $(MAKE_ENV)/tango.opt

#=============================================================================
#	POST_PROCESSING: action to be done after normal make.
#	e.g.:  change executable file name, .....
#POST_PROCESSING = \
#	mv bin/$(BIN_DIR)/$(PACKAGE_NAME) bin/$(BIN_DIR)/$(PACKAGE_NAME)_DS

#=============================================================================
# SVC_OBJS is the list of all objects needed to make the output
#
SVC_OBJS =  $(SVC_SOCKET_OBJS) \
            $(SVC_MKS_MICROVISIONIP_RGA_OBJS) \
            $(OBJDIR)/MultiClassesFactory.o \
            $(OBJDIR)/main.o

#------------  Object files for Socket class  ------------
SVC_SOCKET_OBJS = \
		$(OBJDIR)/Socket.o \
		$(OBJDIR)/SocketClass.o \
		$(OBJDIR)/SocketStateMachine.o \
		$(OBJDIR)/ClientSocket.o \
		$(OBJDIR)/SocketAccess.o

#------------  Object files for MKS_MicrovisionIP_RGA class  ------------
SVC_MKS_MICROVISIONIP_RGA_OBJS = \
		$(OBJDIR)/MKS_MicrovisionIP_RGA.o \
		$(OBJDIR)/MKS_MicrovisionIP_RGAClass.o \
		$(OBJDIR)/MKS_MicrovisionIP_RGAStateMachine.o \
		$(OBJDIR)/MKS_MicrovisionIP_RGADynAttrUtils.o \
		$(OBJDIR)/RGAThread.o


#=============================================================================
#	include common targets
#
include $(MAKE_ENV)/common_target.opt


#=============================================================================
# Following are dependancies of the classes used by project
#
#------------  Object files dependancies for Socket class  ------------
SOCKET_INCLUDES = \
		$(SOCKET_HOME)/Socket.h \
		$(SOCKET_HOME)/SocketClass.h

$(OBJDIR)/Socket.o:  $(SOCKET_HOME)/Socket.cpp $(SOCKET_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/Socket.o
$(OBJDIR)/SocketClass.o:  $(SOCKET_HOME)/SocketClass.cpp $(SOCKET_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/SocketClass.o
$(OBJDIR)/SocketStateMachine.o:  $(SOCKET_HOME)/SocketStateMachine.cpp $(SOCKET_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/SocketStateMachine.o
$(OBJDIR)/ClientSocket.o:  $(SOCKET_HOME)/ClientSocket.cpp $(SOCKET_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/ClientSocket.o
$(OBJDIR)/SocketAccess.o:  $(SOCKET_HOME)/SocketAccess.cpp $(SOCKET_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/SocketAccess.o

#------------  Object files dependancies for MKS_MicrovisionIP_RGA class  ------------
MKS_MICROVISIONIP_RGA_INCLUDES = \
		$(MKS_MICROVISIONIP_RGA_HOME)/MKS_MicrovisionIP_RGA.h \
		$(MKS_MICROVISIONIP_RGA_HOME)/MKS_MicrovisionIP_RGAClass.h

$(OBJDIR)/MKS_MicrovisionIP_RGA.o:  $(MKS_MICROVISIONIP_RGA_HOME)/MKS_MicrovisionIP_RGA.cpp $(MKS_MICROVISIONIP_RGA_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/MKS_MicrovisionIP_RGA.o
$(OBJDIR)/MKS_MicrovisionIP_RGAClass.o:  $(MKS_MICROVISIONIP_RGA_HOME)/MKS_MicrovisionIP_RGAClass.cpp $(MKS_MICROVISIONIP_RGA_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/MKS_MicrovisionIP_RGAClass.o
$(OBJDIR)/MKS_MicrovisionIP_RGAStateMachine.o:  $(MKS_MICROVISIONIP_RGA_HOME)/MKS_MicrovisionIP_RGAStateMachine.cpp $(MKS_MICROVISIONIP_RGA_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/MKS_MicrovisionIP_RGAStateMachine.o
$(OBJDIR)/MKS_MicrovisionIP_RGADynAttrUtils.o:  $(MKS_MICROVISIONIP_RGA_HOME)/MKS_MicrovisionIP_RGADynAttrUtils.cpp $(MKS_MICROVISIONIP_RGA_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/MKS_MicrovisionIP_RGADynAttrUtils.o
$(OBJDIR)/RGAThread.o:  $(MKS_MICROVISIONIP_RGA_HOME)/RGAThread.cpp $(MKS_MICROVISIONIP_RGA_INCLUDES)
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJDIR)/RGAThread.o

