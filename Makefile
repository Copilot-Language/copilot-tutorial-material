IMAGE=formal-methods-2024-copilot-tutorial

build:
	docker build --progress plain -t $(IMAGE) .

clean:
	docker image rm -f $(IMAGE)
