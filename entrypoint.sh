#!/bin/bash

setup.sh
set -ex

if [ -n "$TESTNET" ]
then 
echo "TESTNET mode"

exec nodeos -e -p eosio \
--plugin eosio::producer_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::http_plugin \
--plugin eosio::state_history_plugin \
--data-dir /opt/eosio/data \
--config-dir /opt/eosio/config \
--access-control-allow-origin='*' \
--contracts-console \
--http-validate-host=false \
--state-history-dir /shpdata \
--trace-history \
--chain-state-history \
--verbose-http-errors \
--filter-on='*' \
--disable-replay-opts \
--http-server-address 0.0.0.0:8888

else
echo "MAINNET mode"
exec nodeos -e -p eosio \
--plugin eosio::producer_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::http_plugin \
--plugin eosio::state_history_plugin \
--data-dir /opt/eosio/data \
--config-dir /opt/eosio/config \
--access-control-allow-origin='*' \
--contracts-console \
--http-validate-host=false \
--state-history-dir /shpdata \
--trace-history \
--chain-state-history \
--verbose-http-errors \
--filter-on='*' \
--disable-replay-opts \
--http-server-address 0.0.0.0:8888 \
--plugin eosio::net_api_plugin
fi

