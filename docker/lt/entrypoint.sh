#!/bin/bash
echo "Starting Location Test Request to public url"
sleep 3s
rm /locationTest/uuid
curl --location crisp-kangaroo-modern.ngrok-free.app/app/LocationTest > /locationTest/uuid
inhalt="$(cat /locationTest/uuid)"
echo "Global uuid is: $inhalt"
