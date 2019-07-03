#!/bin/bash

if [ ! -d "/opt/eosio/data" ]; then
    mkdir -p /opt/eosio/data
fi

if [ -d '/opt/eosio/data/contracts' ]; then
    echo
  else
    mkdir -p /opt/eosio/data/contracts
fi
