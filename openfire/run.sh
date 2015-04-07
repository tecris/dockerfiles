#!/bin/bash
docker run -d -p 24:22 -p 5224:5222 -p 5225:5223 -p 9096:9090 -t jdk7/openfire

