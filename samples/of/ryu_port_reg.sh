#!/bin/bash
# Register PXE network ports
curl -X PUT http://10.10.31.10:8090/v1.0/networks/__NW_ID_PXE__
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_PXE__/010010010073_4
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_PXE__/010010010073_6
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_PXE__/010010010073_8
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_PXE__/010010010073_10

curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_PXE__/010010010073_30 # eth0 cluster blades

# Register Nova management network ports
curl -X PUT http://10.10.31.10:8090/v1.0/networks/__NW_ID_MGMT__
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_MGMT__/010010010073_7
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_MGMT__/010010010073_3
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_MGMT__/010010010073_24
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_MGMT__/010010010073_26

# Register "external" ports (can be used by multiple other networks)
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_EXTERNAL__/010010010073_5
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_EXTERNAL__/010010010073_9
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_EXTERNAL__/010010010073_12

curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_EXTERNAL__/010010010073_35 # eth1 cluster blades (for data)

# Register core internal management ports
curl -X PUT http://10.10.31.10:8090/v1.0/networks/__NW_ID_CORE_MGMT__
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_CORE_MGMT__/010010010073_42
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_CORE_MGMT__/010010010073_43
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_CORE_MGMT__/010010010073_44
curl -X POST http://10.10.31.10:8090/v1.0/networks/__NW_ID_CORE_MGMT__/010010010073_45
