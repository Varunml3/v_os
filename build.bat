@ECHO OFF
del /q out\*
cd asm
nasm boot.asm -f elf64 -o boot.o
cd ..
cargo rustc --release -- --emit obj
copy /y .\target\target\release\deps\*o .\out
rename .\out\*.o v_os.o
move /y asm\boot.o .\out