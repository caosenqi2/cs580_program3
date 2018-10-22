All: program3 clean submit

program3: program3.o bomb.o hidden.o
	gcc -g program3.o bomb.o hidden.o -o program3

program3.o: program3.c
	gcc -c -g program3.c -o program3.o

bomb.o: bomb.c
	gcc -c -g bomb.c -o bomb.o
	
bscript: program3
	gdb ./program3
	chmod +x bscript.sh
	./bscript.sh phase1.key phase2.key phase3.key phase4.key phase5.key phase6.key bomb_defused.log

memcheck: program3
	valgrind ./program3
	
clean: program3.o bomb.o program3
	rm program3.o bomb.o program3
	mv ./keys/* ./
	rm -r ./keys

submit:
	git add makefile
	git add bscript.sh
	git add bomb_defused.log
	git add keys/
	git commit -a -m "2nd commit"
	git push
	git rev-parse HEAD
	
