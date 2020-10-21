#!/bin/bash

# create csr and private key
openssl req -new -newkey rsa:2048  -keyout mykey.key -out csr.csr -nodes

