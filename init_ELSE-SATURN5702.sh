#!/bin/bash

export PATH=/root/base-3.15.5/bin/linux-arm:$PATH
export EPICS_BASE="/root/base-3.15.5"
export EPICS_HOST_ARCH="linux-arm"
export EPICS_CA_MAX_ARRAY_BYTES=1048576

export PYEPICS_LIBCA=/root/base-3.15.5/lib/linux-arm/libca.so

EPICS_CAS_SERVER_PORT=5064 /usr/bin/python /root/stream-ioc/interface/ELSE-SATURN5702.py 17003 &

sleep 100

/bin/bash /root/stream-ioc/iocBoot/RAD3.cmd &

EPICS_CAS_SERVER_PORT=5091 /usr/bin/python /root/stream-ioc/interfaces/RAD-Intergral.py RAD:ELSE:TotalDoseRate RAD:ELSE:DoseIntegral &

EPICS_CAS_SERVER_PORT=5092 /usr/bin/python /root/stream-ioc/interfaces/RAD-Intergral.py RAD:ELSE:Gamma RAD:ELSE:IntegralGamma &

EPICS_CAS_SERVER_PORT=5093 /usr/bin/python /root/stream-ioc/interfaces/RAD-Intergral.py RAD:ELSE:Neutron RAD:ELSE:IntegralNeutron &

