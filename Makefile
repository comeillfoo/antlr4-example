JV=java
ANTLR4=lib/antlr-4.11.1-complete.jar

all:
	$(JV) -jar $(ANTLR4)

help:
	@echo 'Targets:'
	@echo '  help  - prints help message'
	@echo '  all   - prints ANTLR4 help message'

.PHONY: help
