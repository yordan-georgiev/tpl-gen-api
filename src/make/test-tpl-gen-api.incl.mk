.PHONY: do-test-tpl-gen-api ## @-> starts container, renders tpl-gen-api and destroyes container
do-test-tpl-gen-api: demand_var-ORG
	docker exec $(ORG)-tpl-gen-api-tpl-gen-api-con /bin/bash -c "cd $(TPG_PROJ_PATH)/src/python/tpl-gen-api && poetry run pytest -v"
