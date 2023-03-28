server:
	hugo server -D --config config.yaml,config.toml

build:
	hugo --config config.yaml,config.toml --minify

deploy: build
	aws-vault exec dones -- aws s3 cp ./public s3://dones.io --recursive
	aws-vault exec dones -- aws cloudfront create-invalidation --distribution-id E22N7QCFDJC6WV --paths "/public/index.html"
