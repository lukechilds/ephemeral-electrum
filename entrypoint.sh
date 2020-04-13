#!/bin/sh

electrum="/electrum/run_electrum --portable"

$electrum create
$electrum --gui text
