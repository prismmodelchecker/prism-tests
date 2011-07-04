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
	NO_PROPS_EXIST=1 ; for PROP in $<*.props ; do test -e $$PROP ; NO_PROPS_EXIST=$$? ; break ; done ; \
	if [ $$NO_PROPS_EXIST -eq 0 ] ; then \
	  for PROP in $<*.props; do \
	  if [ -e $$PROP.args ]; then \
	    PROP_ARGS=`cat $$PROP.args`; \
	  fi ; \
	  echo "$(PRISM_EXEC) -test $$MODEL_ARGS $< $$PROP $$PROP_ARGS >> $@"; \
	  $(PRISM_EXEC) -test $$MODEL_ARGS $< $$PROP $$PROP_ARGS >> $@ 2>&1 || (cat $@ && exit 1); \
	  done; \
	else \
	  echo "$(PRISM_EXEC) -test $$MODEL_ARGS $< > $@"; \
	  $(PRISM_EXEC) -test $$MODEL_ARGS $< > $@ 2>&1 || (cat $@ && exit 1); \
	fi \

clean:
	find . -name '*.log' -exec rm {} \;

celan: clean

#################################################
