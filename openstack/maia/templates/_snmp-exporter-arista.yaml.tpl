# WARNING: This file was HANDCRAFTED and was not using snmp_exporter generator.
arista:
  walk:
  - 1.3.6.1.2.1.10.7.2.1.19
  - 1.3.6.1.2.1.17.7.1.4.2.1.3
  - 1.3.6.1.2.1.2.2.1.13
  - 1.3.6.1.2.1.2.2.1.14
  - 1.3.6.1.2.1.2.2.1.19
  - 1.3.6.1.2.1.2.2.1.20
  - 1.3.6.1.2.1.25.2.3.1
  - 1.3.6.1.2.1.31.1
  - 1.2.3.6.1.2.1.31.1.1.1
  - 1.3.6.1.2.1.2.2.1.2
  - 1.3.6.1.2.1.25.3
  - 1.3.6.1.4.1.30065.3.22.1.1.1.4.4.84.67.65.77.3.65.67.76.8.74.101.114.105.99.104.111
  - 1.3.6.1.4.1.30065.3.22.1.1.1.5.4.84.67.65.77.3.65.67.76.8.74.101.114.105.99.104.111
  - 1.3.6.1.4.1.30065.3.22.1.1.1.7.4.84.67.65.77.3.65.67.76.8.74.101.114.105.99.104.111
  - 1.3.6.1.4.1.30065.3.22.1.1.1.4.10.77.97.115.107.71.114.111.117.112
  - 1.3.6.1.4.1.30065.3.22.1.1.1.5.10.77.97.115.107.71.114.111.117.112
  - 1.3.6.1.4.1.30065.3.22.1.1.1.7.10.77.97.115.107.71.114.111.117.112
  - 1.3.6.1.4.1.30065.3.22.1.1.1.4.3.86.105.102.3.76.97.103
  - 1.3.6.1.4.1.30065.3.22.1.1.1.4.3.86.105.102.4.80.111.114.116
  - 1.3.6.1.4.1.30065.3.22.1.1.1.4.4.84.67.65.77.3.65.67.76.5.65.114.97.100
  - 1.3.6.1.4.1.30065.3.22.1.1.1.5.3.86.105.102.3.76.97.103
  - 1.3.6.1.4.1.30065.3.22.1.1.1.5.3.86.105.102.4.80.111.114.116
  - 1.3.6.1.4.1.30065.3.22.1.1.1.5.4.84.67.65.77.3.65.67.76.5.65.114.97.100
  - 1.3.6.1.4.1.30065.3.22.1.1.1.7.3.86.105.102.3.76.97.103
  - 1.3.6.1.4.1.30065.3.22.1.1.1.7.3.86.105.102.4.80.111.114.116
  - 1.3.6.1.4.1.30065.3.22.1.1.1.7.4.84.67.65.77.3.65.67.76.5.65.114.97.100
  - 1.3.6.1.4.1.30065.3.22.1.1.1.4.3.69.70.80.7.83.108.105.99.101.45
  - 1.3.6.1.4.1.30065.3.22.1.1.1.4.3.73.70.80.7.83.108.105.99.101.45
  - 1.3.6.1.4.1.30065.3.22.1.1.1.5.3.69.70.80.7.83.108.105.99.101.45
  - 1.3.6.1.4.1.30065.3.22.1.1.1.5.3.73.70.80.7.83.108.105.99.101.45
  - 1.3.6.1.4.1.30065.3.22.1.1.1.7.3.69.70.80.7.83.108.105.99.101.45
  - 1.3.6.1.4.1.30065.3.22.1.1.1.7.3.73.70.80.7.83.108.105.99.101.45
  metrics:
  - name: snmp_arista_dot1qVlanFdbId
    oid: 1.3.6.1.2.1.17.7.1.4.2.1.3
    type: gauge
    help: The Filtering Database used by this VLAN - 1.3.6.1.2.1.17.7.1.4.2.1.3
    indexes:
    - labelname: dot1qVlanTimeMark
      type: gauge
    - labelname: dot1qVlanIndex
      type: gauge
  - name: snmp_arista_ifInDiscards
    oid: 1.3.6.1.2.1.2.2.1.13
    type: counter
    help: The number of inbound packets which were chosen to be discarded even though
      no errors had been detected to prevent their being deliverable to a higher-layer
      protocol - 1.3.6.1.2.1.2.2.1.13
    indexes:
    - labelname: ifIndex
      type: counter
    lookups:
      - labels: [ifIndex]
        oid: 1.3.6.1.2.1.2.2.1.2
        labelname: interface
        type: DisplayString
      - labels: [ifIndex]
        oid: 1.3.6.1.2.1.31.1.1.1.18
        labelname: alias
        type: DisplayString
  - name: snmp_arista_ifInErrors
    oid: 1.3.6.1.2.1.2.2.1.14
    type: counter
    help: For packet-oriented interfaces, the number of inbound packets that contained
      errors preventing them from being deliverable to a higher-layer protocol - 1.3.6.1.2.1.2.2.1.14
    indexes:
    - labelname: ifIndex
      type: gauge
    lookups:
      - labels: [ifIndex]
        oid: 1.3.6.1.2.1.2.2.1.2
        labelname: interface
        type: DisplayString
      - labels: [ifIndex]
        oid: 1.3.6.1.2.1.31.1.1.1.18
        labelname: alias
        type: DisplayString
  - name: snmp_arista_ifOutDiscards
    oid: 1.3.6.1.2.1.2.2.1.19
    type: counter
    help: The number of outbound packets which were chosen to be discarded even though
      no errors had been detected to prevent their being transmitted - 1.3.6.1.2.1.2.2.1.19
    indexes:
    - labelname: ifIndex
      type: gauge
    lookups:
      - labels: [ifIndex]
        oid: 1.3.6.1.2.1.2.2.1.2
        labelname: interface
        type: DisplayString
      - labels: [ifIndex]
        oid: 1.3.6.1.2.1.31.1.1.1.18
        labelname: alias
        type: DisplayString
  - name: snmp_arista_ifOutErrors
    oid: 1.3.6.1.2.1.2.2.1.20
    type: counter
    help: For packet-oriented interfaces, the number of outbound packets that could
      not be transmitted because of errors - 1.3.6.1.2.1.2.2.1.20
    indexes:
    - labelname: ifIndex
      type: gauge
    lookups:
      - labels: [ifIndex]
        oid: 1.3.6.1.2.1.2.2.1.2
        labelname: interface
        type: DisplayString
      - labels: [ifIndex]
        oid: 1.3.6.1.2.1.31.1.1.1.18
        labelname: alias
        type: DisplayString
  - name: snmp_arista_dot3StatsDuplexStatus
    oid: 1.3.6.1.2.1.10.7.2.1.19
    type: gauge
    help: The current mode of operation of the MAC entity - 1.3.6.1.2.1.10.7.2.1.19
    indexes:
    - labelname: dot3StatsIndex
      type: gauge
    lookups:
      - labels: [dot3StatsIndex]
        oid: 1.3.6.1.2.1.2.2.1.2
        labelname: interface
        type: DisplayString      
  - name: snmp_arista_hrStorageAllocationUnits
    oid: 1.3.6.1.2.1.25.2.3.1.4
    type: gauge
    help: The size, in bytes, of the data objects allocated from this pool - 1.3.6.1.2.1.25.2.3.1.4
    indexes:
    - labelname: hrStorageIndex
      type: gauge
    lookups:
      - labels: [hrStorageIndex]
        oid: 1.3.6.1.2.1.25.2.3.1.3
        labelname: hrStorageDescr
        type: DisplayString
  - name: snmp_arista_hrStorageSize
    oid: 1.3.6.1.2.1.25.2.3.1.5
    type: gauge
    help: The size of the storage represented by this entry, in units of hrStorageAllocationUnits
      - 1.3.6.1.2.1.25.2.3.1.5
    indexes:
    - labelname: hrStorageIndex
      type: gauge
    lookups:
      - labels: [hrStorageIndex]
        oid: 1.3.6.1.2.1.25.2.3.1.3
        labelname: hrStorageDescr
        type: DisplayString
  - name: snmp_arista_hrStorageUsed
    oid: 1.3.6.1.2.1.25.2.3.1.6
    type: gauge
    help: The amount of the storage represented by this entry that is allocated, in
      units of hrStorageAllocationUnits. - 1.3.6.1.2.1.25.2.3.1.6
    indexes:
    - labelname: hrStorageIndex
      type: gauge
    lookups:
      - labels: [hrStorageIndex]
        oid: 1.3.6.1.2.1.25.2.3.1.3
        labelname: hrStorageDescr
        type: DisplayString
  - name: snmp_arista_hrStorageAllocationFailures
    oid: 1.3.6.1.2.1.25.2.3.1.7
    type: counter
    help: The number of requests for storage represented by this entry that could
      not be honored due to not enough storage - 1.3.6.1.2.1.25.2.3.1.7
    indexes:
    - labelname: hrStorageIndex
      type: gauge
    lookups:
      - labels: [hrStorageIndex]
        oid: 1.3.6.1.2.1.25.2.3.1.3
        labelname: hrStorageDescr
        type: DisplayString
  - name: snmp_arista_hrProcessorLoad
    oid: 1.3.6.1.2.1.25.3.3.1.2
    type: gauge
    help: The average, over the last minute, of the percentage of time that this processor
      was not idle - 1.3.6.1.2.1.25.3.3.1.2
    indexes:
    - labelname: hrDeviceIndex
      type: gauge
    lookups:
      - labels: [hrDeviceIndex]
        oid: 1.3.6.1.2.1.25.3.2.1.3
        labelname: hrDeviceDescr
        type: DisplayString
      - labels: [hrDeviceIndex]
        oid: 1.3.6.1.2.1.25.3.2.1.5
        labelname: hrDeviceStatus
        type: DisplayString                 
  - name: snmp_arista_HardwareUtilizationInUseEntries
    oid: 1.3.6.1.4.1.30065.3.22.1.1.1.4
    type: counter
    help: This MIB object represents the number of entries in the specific hardware
      resource that is currently consumed by a feature. - 1.3.6.1.4.1.30065.3.22.1.1.1.4
    indexes:
    - labelname: aristaHardwareUtilizationResource
      type: DisplayString
    - labelname: aristaHardwareUtilizationFeature
      type: DisplayString
    - labelname: aristaHardwareUtilizationForwardingElement
      type: DisplayString
  - name: snmp_arista_HardwareUtilizationFreeEntries
    oid: 1.3.6.1.4.1.30065.3.22.1.1.1.5
    type: counter
    help: This MIB object represents the number of free entries in the specific hardware
      resource. - 1.3.6.1.4.1.30065.3.22.1.1.1.5
    indexes:
    - labelname: aristaHardwareUtilizationResource
      type: DisplayString
    - labelname: aristaHardwareUtilizationFeature
      type: DisplayString
    - labelname: aristaHardwareUtilizationForwardingElement
      type: DisplayString
  - name: snmp_arista_HardwareUtilizationMaxEntries
    oid: 1.3.6.1.4.1.30065.3.22.1.1.1.7
    type: counter
    help: This MIB object represents the number of max entries in the specific hardware
      resource. - 1.3.6.1.4.1.30065.3.22.1.1.1.7
    indexes:
    - labelname: aristaHardwareUtilizationResource
      type: DisplayString
    - labelname: aristaHardwareUtilizationFeature
      type: DisplayString
    - labelname: aristaHardwareUtilizationForwardingElement
      type: DisplayString
