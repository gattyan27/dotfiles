#!/usr/bin/env bash

if [ `acpi -b | grep -oE Discharging` = "Discharging" ] ; then
  echo -n \#\[fg=yellow,bold\]
else
  echo -n \#\[fg=green,bold\]
fi

echo `acpi -b | grep -oE \[0-9\]+%`

