#!/bin/bash
echo "1002 67df" > /sys/bus/pci/drivers/vfio-pci/new_id
echo "0000:02:00.0" > /sys/bus/pci/devices/0000\:02\:00.0/driver/unbind
echo "0000:02:00.0" > /sys/bus/pci/drivers/vfio-pci/bind
echo "1002 67df" > /sys/bus/pci/drivers/vfio-pci/remove_id 

echo "Unbound video"

echo "1002 aaf0" > /sys/bus/pci/drivers/vfio-pci/new_id
echo "0000:02:00.1" > /sys/bus/pci/devices/0000\:02\:00.1/driver/unbind
echo "0000:02:00.1" > /sys/bus/pci/drivers/vfio-pci/bind
echo "1002 aaf0" > /sys/bus/pci/drivers/vfio-pci/remove_id 

echo "Unbound audio"

echo "8086 2723" > /sys/bus/pci/drivers/vfio-pci/new_id
echo "0000:01:00.0" > /sys/bus/pci/devices/0000\:01\:00.0/driver/unbind
echo "0000:01:00.0" > /sys/bus/pci/drivers/vfio-pci/bind
echo "8086 2723" > /sys/bus/pci/drivers/vfio-pci/remove_id 

echo "Unbound Wi-Fi"
