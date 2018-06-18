#!/bin/bash

export PATH=/root/base-3.15.5/bin/linux-arm:$PATH
export EPICS_BASE="/root/base-3.15.5"
export EPICS_HOST_ARCH="linux-arm"
export EPICS_CA_MAX_ARRAY_BYTES=1048576

export PYEPICS_LIBCA=/root/base-3.15.5/lib/linux-arm/libca.so

EPICS_CAS_SERVER_PORT=5064 /usr/bin/python /root/stream-ioc/interfaces/Berthold-LB6420.py 17001 &

sleep 200

/usr/bin/bash /root/stream-ioc/iocBoot/RAD1.cmd &

EPICS_CAS_SERVER_PORT=5091 /usr/bin/python /root/stream-ioc/interface/RAD-Intergral.py RAD:Berthold:TotalDoseRate RAD:Berthold:DoseIntegral &

EPICS_CAS_SERVER_PORT=5092 /usr/bin/python /root/stream-ioc/interface/RAD-Intergral.py RAD:Berthold:Gamma RAD:Berthold:IntegralGamma &

EPICS_CAS_SERVER_PORT=5093 /usr/bin/python /root/stream-ioc/interface/RAD-Intergral.py RAD:Berthold:TotalNeutronRate RAD:Berthold:IntegralNeutron &




