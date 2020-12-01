#!/bin/bash
ldapdelete -r  -h 127.0.0.1 -p 10389 -D uid=admin,ou=system -w secret ads-partitionId=example,ou=partitions,ads-directoryServiceId=default,ou=config
