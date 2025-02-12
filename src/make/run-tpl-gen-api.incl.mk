# usage: include it in your Makefile by:
# include lib/make/tpl-gen-api.mk

.PHONY: tpl-gen-api ## @-> apply the environment cnf file into the templates
tpl-gen-api:
	cd ${TPG_PROJ_PATH} && source .venv/bin/activate && poetry run python3 tpl_gen_api/tpl_gen_api.py

.PHONY: convert-yaml-to-json ## @-> apply the environment cnf file into the templates
convert-yaml-to-json:
	cd ${TPG_PROJ_PATH} && source .venv/bin/activate && poetry run python3 tpl_gen_api/convert_yaml_to_json.py

# .PHONY: do-tpl-gen-api ## @-> apply the environment cnf file into the templates on the tpl-gen-api container
# do-tpl-gen-api:
# 	docker exec -e ORG=$(ORG) -e CNF_SRC=$(CNF_SRC) -e TPL_SRC=$(TPL_SRC) -e TGT=$(TGT) -e DATA_PATH=$(DATA_KEY_PATH) $(ORG)-${PROJ}-tpl-gen-api-con make ${PROJ}
# broken !!!

.PHONY: do-convert-yaml-to-json ## @-> apply the environment cnf file into the templates
do-convert-yaml-to-json:
	docker exec -e ORG=$(ORG) -e CNF_SRC=$(CNF_SRC) -e TPL_SRC=$(TPL_SRC) -e TGT=$(TGT) -e DATA_PATH=$(DATA_KEY_PATH) $(ORG)-${PROJ}-tpl-gen-api-con make convert-yaml-to-json


.PHONY: run-tpl-gen-api ## @-> starts container, renders tpl-gen-api and destroyes container
run-tpl-gen-api:
	$(call run-img,$(PROJ),,${TPL_GEN_PORT}, make $(PROJ))



# eof file: src/make/local-setup-tasks.incl.mk
