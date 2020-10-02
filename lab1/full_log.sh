#!/bin/bash

warn_messages="$(cat /var/log/anaconda/X.log | awk '{if ($3 == "(WW)") print $0}')"
echo "${warn_messages//"(WW)"/"Warning: "}" > full.log
info_messages="$(cat /var/log/anaconda/X.log | awk '{if ($3 == "(II)") print $0}')"
echo "${info_messages//"(II)"/"Information: "}" >> full.log
exit 0
