SDK = SDK

CFLAGS = -O2 -fpack-struct=1 -w -DLINUX -DSAMPSRV -DAMX_NODYNALOAD -I$(SDK)/amx
CXXFLAGS = $(CFLAGS)

AMX_SRC = $(SDK)/amx/*.c
RAKNET_SRC = $(SDK)/raknet/*.cpp
CPP_SRC = *.cpp

AMX_OBJ = $(AMX_SRC:.c=.o)
CPP_OBJ = $(CPP_SRC:.cpp=.o)
RAKNET_OBJ = $(RAKNET_SRC:.cpp=.o)

all: mpsvr

debug: CFLAGS = -g -fpack-struct=1 -w -DLINUX -DSAMPSRV -DAMX_NODYNALOAD -I$(SDK)/amx
debug: CXXFLAGS = $(CFLAGS)
debug: mpsvrd

mpsvr: $(AMX_OBJ) $(CPP_OBJ) $(RAKNET_OBJ)
	g++ $(CXXFLAGS) -ldl -lpthread -lm -o mpsvr $^

mpsvrd: $(AMX_OBJ) $(CPP_OBJ) $(RAKNET_OBJ)
	g++ $(CXXFLAGS) -ldl -lpthread -lm -o mpsvrd $^

clean:
	rm -f $(AMX_OBJ) $(CPP_OBJ) $(RAKNET_OBJ) mpsvr mpsvrd
