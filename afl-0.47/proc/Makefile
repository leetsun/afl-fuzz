#CC = afl-gcc
CFALGS = -g -m32

TARGET = IsTree_AFL

$(TARGET): IsTree.c
	$(CC) $(CFALGS) $< -o $@

.PHONY: clean
clean:
	-rm $(TARGET)
