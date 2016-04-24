 Private registry

Registry blue.sky is configured as a local private registry(TLS).
TLS: self-signed certificates

https://github.com/docker/distribution/blob/v2.2.1/docs/deploying.md

-) $ ./deployBlueskyCertificates.sh                   # deploy certiifcates
-) $ docker-compose -f bluesky-registry.yml up -d     # Start private registry

-) Browse registry:
  .) https://blue.sky/v2/_catalog               # show images
  .) https://blue.sky/v2/bookstore/tags/list    # show tags for a given image

-) How to create new self-signed certificates
     $ mkdir -p certs && openssl req \
       -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
       -x509 -days 365 -out certs/domain.crt

  FQDN: blue.sky
