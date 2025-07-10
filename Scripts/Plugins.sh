#!/bin/bash

#Linkease
git clone --depth=1 --single-branch https://github.com/linkease/istore.git
git clone --depth=1 --single-branch https://github.com/linkease/nas-packages.git
git clone --depth=1 --single-branch https://github.com/linkease/nas-packages-luci.git

# packages
#git clone --depth=1 --single-branch https://github.com/kiddin9/openwrt-packages.git kiddin9

# R4S机型调整网口,wan/lan对调，以适配T4机型
#sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network

# partexp 扩容分区
git clone https://github.com/hza81007155/luci-app-partexp.git package/luci-app-partexp

# 18.06 Argone theme
git clone https://github.com/hza81007155/luci-theme-argone
git clone https://github.com/hza81007155/luci-app-argone-config

# dockerman
git clone --depth=1 --single-branch https://github.com/sirpdboy/luci-app-dockerman.git

# ddns-go
git clone --depth=1 --single-branch https://github.com/sirpdboy/luci-app-ddns-go.git

# passwall/passwall2
git clone --depth=1 --single-branch https://github.com/xiaorouji/openwrt-passwall.git
git clone --depth=1 --single-branch https://github.com/xiaorouji/openwrt-passwall2.git

# adguardHome
git clone --depth=1 --single-branch https://github.com/rufengsuixing/luci-app-adguardhome.git

# cpufreq
git clone --depth=1 --single-branch https://github.com/hza81007155/luci-app-cpufreq.git

# lucky
git clone --depth=1 --single-branch https://github.com/gdy666/luci-app-lucky.git

#Open Clash
git clone --depth=1 --single-branch --branch "dev" https://github.com/vernesong/OpenClash.git

