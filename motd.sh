#!/bin/bash
clear
chsh -s $(which zsh)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # Install Oh My Zsh if not installed
    yes '' | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null 2>&1 && sed -i 's/ZSH_THEME=".*"/ZSH_THEME="duellj"/' ~/.zshrc && source ~/.zshrc 
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="duellj"/' ~/.zshrc
    source ~/.zshrc
    sudo su
fi
mb_to_gb() {
    local mb=$1
    local gb=$(echo "scale=2; $mb / 1024" | bc)
    echo "$gb"
}

BIN_DATE='/bin/date'
BIN_FIGLET='/usr/bin/figlet'
BIN_HOSTNAME='/bin/hostname'
BIN_IP='/bin/hostname -i'
BIN_GREP='/bin/grep'
BIN_SED='/bin/sed'
BIN_UPTIME='/usr/bin/uptime'
BIN_CAT='/bin/cat'
BIN_LSB_RELEASE='/usr/bin/lsb_release'
BIN_UNAME='/bin/uname'
BIN_FREE='/usr/bin/free'
BIN_HEAD='/usr/bin/head'
BIN_TAIL='/usr/bin/tail'
BIN_DF='/bin/df'
BIN_AWK='/usr/bin/awk'
BIN_BC='/usr/bin/bc'
BIN_PS='/bin/ps'
BIN_CUT='/usr/bin/cut'
BIN_XARGS='/usr/bin/xargs'

COLOR_LIGHT_GREEN='\033[1;32m'
COLOR_LIGHT_BLUE='\033[1;34m'
COLOR_YELLOW='\033[1;33m'
COLOR_RED='\033[0;31m'
COLOR_WHITE='\033[1;37m'
COLOR_DEFAULT='\033[0m'
# colors
W="\e[0;39m"
G="\e[1;32m"
R="\e[1;31m"
dim="\e[2m"
undim="\e[0m"
# get load averages
IFS=" " read LOAD1 LOAD5 LOAD15 <<<$(awk '{ print $1,$2,$3 }' /proc/loadavg)
# get free memory
IFS=" " read USED AVAIL TOTAL <<<$(free -htm | awk '/Mem/ { print $3,$7,$2 }')
# get processes
PROCESS=$(ps -eo user=|sort|uniq -c | awk '{ print $2 " " $1 }')
PROCESS_ALL=$(echo "$PROCESS"| awk {'print $2'} | awk '{ SUM += $1} END { print SUM }')
PROCESS_ROOT=$(echo "$PROCESS" | awk '/root/ { print $2}')
PROCESS_USER=$(echo "$PROCESS" | awk '!/root/ { SUM += $2} END { print SUM }')
# get processors
PROCESSOR_NAME=$(awk -F": " '/model name/ { print $2 }' /proc/cpuinfo | head -1)
PROCESSOR_COUNT=$(grep -ioPc 'processor\t:' /proc/cpuinfo)
# Memory usage
memory_used_mb=$(${BIN_FREE} -m | ${BIN_HEAD} -n 2 | ${BIN_TAIL} -n 1 | ${BIN_AWK} '{print $3}')
memory_total_mb=$(${BIN_FREE} -m | ${BIN_HEAD} -n 2 | ${BIN_TAIL} -n 1 | ${BIN_AWK} '{print $2}')
memory_used_gb=$(mb_to_gb $memory_used_mb)
memory_total_gb=$(mb_to_gb $memory_total_mb)

# Swap usage
swap_used_mb=$(${BIN_FREE} -m | ${BIN_TAIL} -n 1 | ${BIN_AWK} '{print $3}')
swap_total_mb=$(${BIN_FREE} -m | ${BIN_TAIL} -n 1 | ${BIN_AWK} '{print $2}')
swap_used_gb=$(mb_to_gb $swap_used_mb)
swap_total_gb=$(mb_to_gb $swap_total_mb)

# Disk usage
disk_used_mb=$(${BIN_DF} -m / | ${BIN_TAIL} -n 1 | ${BIN_AWK} '{print $3}')
disk_total_mb=$(${BIN_DF} -m / | ${BIN_TAIL} -n 1 | ${BIN_AWK} '{print $2}')
disk_used_gb=$(mb_to_gb $disk_used_mb)
disk_total_gb=$(mb_to_gb $disk_total_mb)
echo -e "
${COLOR_LIGHT_GREEN}$(${BIN_FIGLET} -f smblock "NextSekai VPS")${COLOR_DEFAULT}
==========[ ${COLOR_LIGHT_BLUE}System Information${COLOR_DEFAULT} ]=============
$W  Hostname$dim····$undim: $W${HOSTNAME}
$W  Distro$dim······$undim: $W$(grep "PRETTY_NAME" /etc/*release | cut -d "=" -f 2- | sed 's/"//g')
$W  Kernel$dim······$undim: $W$(uname -sr)
$W  Uptime$dim······$undim: $W$(uptime -p)
$W  Load$dim········$undim: $G$LOAD1$W (1m), $G$LOAD5$W (5m), $G$LOAD15$W (15m)
$W  Processes$dim···$undim: $G$PROCESS_ROOT$W (root), $G$PROCESS_USER$W (user), $G$PROCESS_ALL$W (total)
$W  CPU$dim·········$undim: $W$PROCESSOR_NAME ($G$PROCESSOR_COUNT$W vCPU)
$W  Memory$dim······$undim: $G$USED$W used, $G$AVAIL$W avail, $G$TOTAL$W total
$W  Swap$dim········$undim: $G${swap_used_gb}${COLOR_DEFAULT}GB/$G${swap_total_gb}${COLOR_DEFAULT}GB
$W  Disk(/)$dim·····$undim: ${G}${disk_used_gb}${W}GB/$G${disk_total_gb}${W}GB

===========[ ${COLOR_LIGHT_BLUE}Terms of Service${COLOR_DEFAULT} ]===============
${COLOR_RED}✘ DILARANG MINING
${COLOR_RED}✘ DILARANG DIJADIKAN SERVER VPN
${COLOR_RED}✘ DILARANG UNTUK MENGGUNAKAN KEGIATAN ILLEGAL 
${COLOR_RED}✘ DILARANG UNTUK BRUTE FORCE
${COLOR_RED}✘ And other illegal activities...${COLOR_DEFAULT}
==============================================
${COLOR_WHITE}Jangan lupa follow ${COLOR_RED}@ditzzsxz_ ${COLOR_WHITE}yaaa... arigatou and enjoyy your vps~~
${COLOR_WHITE}Silahkan ketik [ ${COLOR_RED}menu${COLOR_WHITE} ] untuk melihat menu yang tersedia
"
# config
max_usage=90
bar_width=50


unset BIN_DATE BIN_FIGLET BIN_HOSTNAME BIN_IP BIN_GREP BIN_SED BIN_UPTIME BIN_CAT BIN_LSB_RELEASE BIN_UNAME BIN_FREE BIN_HEAD BIN_TAIL BIN_DF BIN_AWK BIN_BC BIN_PS
unset COLOR_LIGHT_GREEN COLOR_LIGHT_BLUE COLOR_YELLOW COLOR_RED COLOR_WHITE COLOR_DEFAULT
