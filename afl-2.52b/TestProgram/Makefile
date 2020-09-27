#CC = afl-gcc
CFALGS = -g 

TARGET = IsTree

$(TARGET): IsTree.c
	$(CC) $(CFALGS) $< -o $@

.PHONY: clean
clean:
	-rm $(TARGET)
