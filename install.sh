#!/usr/bin/env bash

echo "downloading certificates..."
curl -s -L https://github.com/18F/install-dod-roots/raw/master/dod_root_certificates.zip > dod_root_certs.zip
unzip -o -qq dod_root_certs.zip
cd Certificates_PKCS7_v5.0u1_DoD

sudo -v -p "Please enter your computer password to install the DoD Root Certificates into your keychain: "

echo "adding certificates..."
sudo security add-trusted-cert -d -r trustRoot -k ~/Library/Keychains/login.keychain DoD_Root_CA_2__0x05__DoD_Root_CA_2.cer
sudo security add-trusted-cert -d -r trustRoot -k ~/Library/Keychains/login.keychain DoD_Root_CA_3__0x01__DoD_Root_CA_3.cer
sudo security add-trusted-cert -d -r trustRoot -k ~/Library/Keychains/login.keychain DoD_Root_CA_4__0x01__DoD_Root_CA_4.cer

sudo -k

echo "cleaning up..."
cd ..
rm -rf Certificates_PKCS7_v5.0u1_DoD
rm dod_root_certs.zip

echo "all done!"
