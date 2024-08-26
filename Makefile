IMAGE=formal-methods-2024-copilot-tutorial

build:
	docker build --progress plain --no-cache -t $(IMAGE) .

clean:
	docker image rm -f $(IMAGE)
