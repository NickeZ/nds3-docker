# This makefile calls itself recursively in each sub directory prefixed with
# nds3-devel-. The first time it is called, IMAGE is not set. Then IMAGE is
# set differently in each subsequent call.

ifeq (${IMAGE},)
DIRS = $(wildcard nds3-devel*)

all: $(DIRS)

define DIR_template
$1:
	make -f ../Makefile -C $1 IMAGE=$1
endef

$(foreach dir,$(DIRS),$(eval $(call DIR_template,$(dir))))

.PHONY: $(DIRS)
else
# IMAGE is defined, called from image directory
all:
	sudo docker build -t ${IMAGE} .
endif
