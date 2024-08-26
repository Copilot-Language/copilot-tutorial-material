IMAGE=formal-methods-2024-copilot-tutorial

all: test

build:
	docker build --progress plain --no-cache -t $(IMAGE) .

test: build
	bin/rundocker exercises/test/run.sh

clean:
	docker image rm -f $(IMAGE)
