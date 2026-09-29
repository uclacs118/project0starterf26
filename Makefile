# NOTE: Make sure you have your project files in the ./project directory
# Will run the autograder and place the results in ./results/results.json

IMAGE=ghcr.io/mrelnekave/project0f26-autograder
CONTAINER_NAME=project0f26-autograder

run:
	docker pull $(IMAGE)
	docker run --rm \
		-v ./project:/autograder/submission \
		-v ./results:/autograder/results \
		$(IMAGE) \
		/autograder/run_autograder && cat results/results.json

# In case you want to run the autograder manually, use interactive
interactive:
	docker pull $(IMAGE)
	(docker ps | grep $(IMAGE) && \
		docker exec -it $(CONTAINER_NAME) bash) || \
	docker run --rm --name $(CONTAINER_NAME) -it \
		-v ./project:/autograder/submission \
		-v ./results:/autograder/results \
		$(IMAGE) bash


