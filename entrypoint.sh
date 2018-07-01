#!/bin/sh

echo ""
echo ">>> VERSION"
uname -a

echo ""
echo ">>> USER GROUPS"
groups

echo "" > /config/hq_machines_taker.cfg && \
	echo "{" >> /config/hq_machines_taker.cfg && \
	echo "    \"taker_name\": \"$TAKER\"," >> /config/hq_machines_taker.cfg && \
	echo "    \"api_key\": \"$KEY\"," >> /config/hq_machines_taker.cfg && \
	echo "    \"url_hq\": \"https://house-hq.com\"," >> /config/hq_machines_taker.cfg && \
	echo "    \"root_path\": \"/pics/\"" >> /config/hq_machines_taker.cfg && \
	echo "}" >> /config/hq_machines_taker.cfg

echo ""
echo ">>> CONFIG"
cat /config/hq_machines_taker.cfg

echo ""
echo ">>> LET'S RUN"
python /exec/hq_taker.py