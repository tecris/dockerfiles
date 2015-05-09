#!/bin/bash


curl -X POST "http://192.168.1.66:8080/createItem/createItem?name=Continuous_Delivery" --data-binary "@config.xml" -H "Content-Type: text/xml"
