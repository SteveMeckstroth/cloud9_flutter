#!/bin/bash

echo "Downloading Android SDK"

cd /opt
sudo wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
sudo tar -xvf android-sdk*-linux.tgz
cd android-sdk-linux/tools
sudo ./android update sdk --no-ui --filter platform,platform-tools

echo "Setting Paths"
sudo echo 'export PATH=$PATH:/opt/android-sdk-linux/platform-tools' >> /etc/profile.d/android.sh

sudo echo 'export ANDROID_TOOLS=/opt/android-sdk-linux' >> /etc/profile.d/android.sh
source /etc/profile.d/android.sh

echo "Add i386 support"
sudo dpkg --add-architecture i386
sudo apt-get install -y libc6:i386 libstdc++6:i386 zlib1g:i386
