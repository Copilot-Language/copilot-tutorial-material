IMAGE=formal-methods-2024-copilot-tutorial

all: test

build:
	docker build --progress plain -t $(IMAGE) .

test: build
	bin/rundocker runhaskell exercises/Test.hs

clean:
	docker image rm -f $(IMAGE)
