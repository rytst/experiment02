TARGET := CSE2-J2200071齊藤隆斗A1.pdf

all: $(TARGET)

$(TARGET): main.typ
	typst compile $< $@

.PHONY: clean

clean:
	rm *.pdf
