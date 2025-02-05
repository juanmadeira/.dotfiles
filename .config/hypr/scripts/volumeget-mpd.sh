#!/bin/bash
# script para obter o volume do mpd e enviar notificação

volumempd=$(mpc volume)

notify-send "mpd $(mpc volume)" -h string:x-canonical-private-synchronous:anythin

