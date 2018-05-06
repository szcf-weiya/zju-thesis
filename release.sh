#!/bin/bash
rm -f zju-thesis_v*.*.*.tar.gz
rm -f zju-proposal_v*.*.*.tar.gz
tar -czf zju-thesis_v1.0.4.tar.gz demo/ assets/ src/
#tar -czf zju-proposal_v1.0.0.tar.gz proposal/