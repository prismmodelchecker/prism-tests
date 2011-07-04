PRISM_EXEC = prism

MODEL_FILES = $(shell find . -name "*.[psn]m")
LOG_FILES = $(MODEL_FILES:%=%.log)

default: all

all: prism

prism: 
	time $(MAKE) prism_logs

prism_logs: $(LOG_FILES)

%.log: %
	@if [ -e $<.args ]; then \
	  MODEL_ARGS=`cat $<.args`; \
	fi ; \
	PROPS=`ls -1 $<*.props`; \
	if [ "$PROPS" != "" ]; then \
	  for PROP in $<*.props; do \
	  if [ -e $$PROP.args ]; then \
	    PROP_ARGS=`cat $$PROP.args`; \
	  fi ; \
	  echo "$(PRISM_EXEC) -test $$MODEL_ARGS $< $$PROP $$PROP_ARGS >> $@"; \
	  $(PRISM_EXEC) -test $$MODEL_ARGS $< $$PROP $$PROP_ARGS >> $@ || (cat $@ && exit 1); \
	  done; \
	else \
	  echo "$(PRISM_EXEC) -test $$MODEL_ARGS $< > $@"; \
	  $(PRISM_EXEC) -test $$MODEL_ARGS $< > $@ || (cat $@ && exit 1); \
	fi \

clean:
	find . -name '*.log' -exec rm {} \;

celan: clean

#################################################
