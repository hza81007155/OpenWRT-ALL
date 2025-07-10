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
git clone https://github.com/hza81007155/luci-app-partexp

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

#预置OpenClash内核和GEO数据
export CORE_VER=https://raw.githubusercontent.com/vernesong/OpenClash/core/dev/core_version
export CORE_TUN=https://github.com/vernesong/OpenClash/raw/core/dev/premium/clash-linux
export CORE_DEV=https://github.com/vernesong/OpenClash/raw/core/dev/dev/clash-linux
export CORE_MATE=https://github.com/vernesong/OpenClash/raw/core/dev/meta/clash-linux

export CORE_TYPE=$(echo $OWRT_TARGET | grep -Eiq "64|86" && echo "amd64" || echo "arm64")
export TUN_VER=$(curl -sfL $CORE_VER | sed -n "2{s/\r$//;p;q}")

export GEO_MMDB=https://github.com/alecthw/mmdb_china_ip_list/raw/release/lite/Country.mmdb
export GEO_SITE=https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat
export GEO_IP=https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat

cd ./OpenClash/luci-app-openclash/root/etc/openclash

curl -sfL -o ./Country.mmdb $GEO_MMDB
curl -sfL -o ./GeoSite.dat $GEO_SITE
curl -sfL -o ./GeoIP.dat $GEO_IP

mkdir ./core && cd ./core

curl -sfL -o ./tun.gz "$CORE_TUN"-"$CORE_TYPE"-"$TUN_VER".gz
gzip -d ./tun.gz && mv ./tun ./clash_tun

curl -sfL -o ./meta.tar.gz "$CORE_MATE"-"$CORE_TYPE".tar.gz
tar -zxf ./meta.tar.gz && mv ./clash ./clash_meta

curl -sfL -o ./dev.tar.gz "$CORE_DEV"-"$CORE_TYPE".tar.gz
tar -zxf ./dev.tar.gz

chmod +x ./clash* ; rm -rf ./*.gz

