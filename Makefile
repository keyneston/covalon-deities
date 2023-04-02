OUT ?= dist
RELEASE_VERSION ?= dev

.PHONY: build
build:
	mkdir -p ${OUT}/packs
	jq ". | .version=\"${RELEASE_VERSION}\" | .download=\"https://github.com/keyneston/covalon-deities/releases/download/${RELEASE_VERSION}/covalon-deities.zip\"" module.json > ${OUT}/module.json
	cat packs/covalon-deities.db/*.json | jq -c . > ${OUT}/packs/covalon-deities.db
	cp README.md ${OUT}/README.md
	cd dist && zip -r ../covalon-deities.zip ./

.PHONY: clean
clean:
	rm -rf ./${OUT}/* || true
	rm covalon-deities.zip || true


.PHONY: version
version:
	@echo ${RELEASE_VERSION}
