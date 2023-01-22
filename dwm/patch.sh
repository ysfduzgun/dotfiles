#!/bin/bash

patch --forward --strip=1 --input="diffs/qqq.diff"
git apply -3 qqq.diff
