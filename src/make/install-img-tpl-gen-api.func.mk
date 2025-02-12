# src/make/clean-install-dockers.func.mk
# Keep all (clean and regular) docker install functions in here.

.PHONY: do-setup-tpl-gen-api  ## @-> setup the whole local tpl-gen-api environment for python no cache
do-setup-tpl-gen-api:
	$(call build-img,$(PROJ),--no-cache,${TPL_GEN_PORT})
	make do-start-tpl-gen-api

.PHONY: do-setup-tpl-gen-api-cached  ## @-> setup the whole local tpl-gen-api environment for python
do-setup-tpl-gen-api-cached:
	$(call build-img,$(PROJ),,${TPL_GEN_PORT})
	make do-start-tpl-gen-api

.PHONY: do-build-tpl-gen-api  ## @-> setup the whole local tpl-gen-api environment for python no cache
do-build-tpl-gen-api:
	$(call build-img,$(PROJ),--no-cache,${TPL_GEN_PORT})

.PHONY: do-start-tpl-gen-api  ## @-> only start the containers
do-start-tpl-gen-api:
	$(call start-img,$(PROJ),--no-cache,${TPL_GEN_PORT})

.PHONY: do-stop-tpl-gen-api
do-stop-tpl-gen-api:
	CONTAINER_NAME=$(PROJ)
	$(call stop-and-remove-docker-container)
