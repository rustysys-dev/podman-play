podman pod create --name tikv \
--hostname tikv \
-p 2379:2379 \
-p 2380:2380 \
-p 20160:20160 \
-p 20161:20161 \
-p 20162:20162

podman run -d --name pd1 \
--pod tikv \
-v /etc/localtime:/etc/localtime:ro \
-v ~/.tikv/data:/data:z \
pingcap/pd:latest \
--name="pd1" \
--data-dir="/data/pd1" \
--client-urls="http://0.0.0.0:2379" \
--advertise-client-urls="http://localhost:2379" \
--peer-urls="http://0.0.0.0:2380" \
--advertise-peer-urls="http://localhost:2380" \
--initial-cluster="pd1=http://localhost:2380"

podman run -d --name tikv1 \
--pod tikv \
-v /etc/localtime:/etc/localtime:ro \
-v ~/.tikv/data:/data:z \
pingcap/tikv:latest \
--addr="0.0.0.0:20160" \
--advertise-addr="localhost:20160" \
--data-dir="/data/tikv1" \
--pd="localhost:2379"

podman run -d --name tikv2 \
--pod tikv \
-v /etc/localtime:/etc/localtime:ro \
-v ~/.tikv/data:/data:z \
pingcap/tikv:latest \
--addr="0.0.0.0:20161" \
--advertise-addr="localhost:20161" \
--data-dir="/data/tikv2" \
--pd="localhost:2379"

podman run -d --name tikv3 \
--pod tikv \
-v /etc/localtime:/etc/localtime:ro \
-v ~/.tikv/data:/data:z \
pingcap/tikv:latest \
--addr="0.0.0.0:20162" \
--advertise-addr="localhost:20162" \
--data-dir="/data/tikv3" \
--pd="localhost:2379"