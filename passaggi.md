# Hello SDL2 con MSys2
Lo scopo è quello di compilare un Hello World per SDL2 con target
Windows senza usare Visual Studio ma la Shell MSys2.

## Settare MSys2
Personalmente uso il sistema MSys2 UCRT64 e solo quello. Per settarlo
per compilare programmi con target Windows vedi il link 
https://github.com/aaaasmile/HelloContext/blob/main/Readme-Context.pdf
nella sezione dove parlo della compilazione di SciTe.
A questo punto con un MSys2 funzionante, si installano le librerie
SDL. Questi i comandi:

    pacman -Syu
    pacman -S mingw-w64-ucrt-x86_64-SDL2
    pacman -S mingw-w64-ucrt-x86_64-SDL2_net
    pacman -S mingw-w64-ucrt-x86_64-SDL2_mixer
    pacman -S mingw-w64-ucrt-x86_64-SDL2_image
    pacman -S mingw-w64-ucrt-x86_64-SDL2_ttf
    pacman -S mingw-w64-ucrt-x86_64-SDL2_gfx

## Compilare HelloSDL
Per compilare il programma basta aprire la bash di Msys2 nel
root di questo progetto. Poi basta lanciare:

    g++ -o helloSDL -Wall -g hello.cpp `sdl2-config --cflags --libs`
E in questo modo viene creato il file helloSDL.exe. Nella bash di Msys2 si può lanciare subito e compare una finestra in rosso con hello world. Da File Explorer o PowerShell non parte in quanto la libreria SDL2.dll non viene trovata. Essa però si trova nella directory 

    C:\msys64\ucrt64\bin
e da qui può essere compiata dove si trova il file helloSDL.exe.

## Visual Code
Bene ora si tratta di creare lo stesso eseguibile usando Visual Code.
Come? Prima di lanciare Code da PowerShell in questa directory, si lancia in PowerShell:

     $env:path="C:\msys64\ucrt64\bin;" + $env:path
     code .
Così ho il path settato del compilatore. Poi copio il contenuto di .vscode
dal progetto _C_ erf (https://github.com/aaaasmile/erf).

Nel file c_cpp_properties.json metto il path della libreria SDL che si vede
lanciando il comando nella bash:

    sdl2-config --cflags

Poi ho anche creato un semplice Makefile con il target build e clean.
Ora con CTRL + SHIFT + B è possibile compilare il progetto direttamente in Visual Code senza
usare la bash.

Per usare il Debugger premere F5. 