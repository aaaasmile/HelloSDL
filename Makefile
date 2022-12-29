build:
	g++ -o hello hello.cpp -g -Wall  -IC:/msys64/ucrt64/include/SDL2 -Dmain=SDL_main -LC:/msys64/ucrt64/lib -lmingw32 -mwindows -lSDL2main -lSDL2

clean:
	rm *.exe