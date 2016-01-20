#!/bin/sh


lbm:
	@$(MAKE) --directory=`pwd`/src

install:
	@$(MAKE) --directory=`pwd`/src install

clean:
	@$(MAKE) --directory=`pwd`/src clean
