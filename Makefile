server:
	hugo server -D --config config.yaml,config.toml

build:
	hugo --config config.yaml,config.toml

deploy: build
	aws-vault exec dones -- aws s3 cp ./public s3://dones.io --recursive
