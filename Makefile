OUT ?= dist
RELEASE_VERSION ?= dev

.PHONY: build
build:
	mkdir -p ${OUT}/packs
	jq ". | .version=\"${RELEASE_VERSION}\" | .download=\"https://github.com/keyneston/covalon-deities/releases/download/${RELEASE_VERSION}/covalon-deities.zip\"" module.json > ${OUT}/module.json
	cat packs/covalon-deities.db/*.json | jq -c . > ${OUT}/packs/covalon-deities.db
	cp README.md ${OUT}/README.md

.PHONY: clean
clean:
	rm ${OUT}

.PHONY: version
version:
	@echo ${RELEASE_VERSION}
