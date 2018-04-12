#!/bin/bash

sudo docker stack deploy -c docker-compose.yaml ltc

# sudo docker exec -it ltc_litecoin-core.1.bvzrsbphcdlqv8ayoruir4blb litecoin-cli -rpcpassword=bar -rpcuser=foo help
# sudo docker exec -it ltc_litecoin-core.1.bvzrsbphcdlqv8ayoruir4blb bash
# docker stack ps ltc
# sudo docker stack services ltc
# sudo docker stack rm ltc
