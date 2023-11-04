JV=java
JVC=javac
JAR=jar

SRC_D=src
BUILD_D=build
ANTLR4=lib/antlr-4.11.1-complete.jar

JVC_FLAGS=-cp $(ANTLR4)
ANTLR4_FLAGS=-Werror -visitor

LANG_GRAMMAR=$(SRC_D)/lang.g4
CLASSES=langBaseListener langBaseVisitor langLexer langListener langParser langVisitor MyListener

MANIFEST=include/MANIFEST.inc
ENTRY_POINT=MyListener
TARGET=lang.jar

TESTS=$(SRC_D)/test.lang


all: jar

help:
	@echo 'Targets:'
	@echo '  help         - prints help message'
	@echo '  all          - builds jar from sources'
	@echo '  jar          - builds jar from sources'
	@echo '  compile      - compile sources'
	@echo '  grammar      - creates sources from language grammar'
	@echo '  test         - run jar against test files'
	@echo '  build        - creates build directory'
	@echo '  clean_build  - cleans built files'
	@echo '  clean_source - cleans ANTLR4 generated files'
	@echo '  clean        - cleans all'

$(BUILD_D):
	mkdir -p $@

test: jar
	$(JV) -jar $(TARGET) $(TESTS)

jar: compile
	$(JAR) cefmv $(ENTRY_POINT) $(TARGET) $(MANIFEST) -C $(BUILD_D) .

compile: $(BUILD_D) grammar
	$(JVC) $(JVC_FLAGS) $(addprefix $(SRC_D)/,$(addsuffix .java,$(CLASSES))) -d $(BUILD_D)

grammar:
	$(JV) -jar $(ANTLR4) $(ANTLR4_FLAGS) $(LANG_GRAMMAR)

clean_build:
	rm -rf $(BUILD_D)

clean_source:
	rm -f $(SRC_D)/*.interp $(SRC_D)/*.tokens $(addsuffix *.java,$(basename $(LANG_GRAMMAR)))

clean: clean_source clean_build

.PHONY: help clean clean_build clean_source
