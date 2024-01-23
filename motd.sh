#!/bin/bash
clear
chsh -s $(which zsh)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash > /dev/null 2>&1
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # Install Oh My Zsh if not installed
    yes '' | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null 2>&1 && sed -i 's/ZSH_THEME=".*"/ZSH_THEME="duellj"/' ~/.zshrc && source ~/.zshrc 
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="duellj"/' ~/.zshrc
    source ~/.zshrc
    sudo su
fi

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
echo -e "
${COLOR_LIGHT_GREEN}$(${BIN_FIGLET} -f smblock "NextSekai VPS")
${COLOR_WHITE}Date and time             = ${COLOR_LIGHT_BLUE}$(${BIN_DATE})
${COLOR_WHITE}Hostname                  = ${COLOR_LIGHT_BLUE}$(${BIN_HOSTNAME})
${COLOR_WHITE}Global IP Addresses       = ${COLOR_LIGHT_BLUE}$(${BIN_IP})
${COLOR_WHITE}Uptime                    = ${COLOR_LIGHT_BLUE}$(${BIN_UPTIME} | ${BIN_CUT} -d "," -f 1 | xargs)
${COLOR_WHITE}Load avg.                 = ${COLOR_LIGHT_BLUE}$(${BIN_UPTIME} | ${BIN_GREP} -o -e "load averages\?.*" | ${BIN_SED} -e "s/load averages\?: //")
${COLOR_WHITE}Release                   = ${COLOR_LIGHT_BLUE}$(${BIN_LSB_RELEASE} -d --short)
${COLOR_WHITE}Kernel                    = ${COLOR_LIGHT_BLUE}$(${BIN_UNAME} -ro)
${COLOR_WHITE}CPU Usage (Core)          = ${COLOR_LIGHT_BLUE}$(echo $(${BIN_PS} -eo pcpu | ${BIN_AWK} 'NR>1' | ${BIN_AWK} '{tot=tot+$1} END {print tot}') / $(${BIN_CAT} /proc/cpuinfo | ${BIN_GREP} -c processor) | ${BIN_BC} )%
${COLOR_WHITE}Memory         Used/Total = ${COLOR_LIGHT_BLUE}$(${BIN_FREE} -m | ${BIN_HEAD} -n 2 | ${BIN_TAIL} -n 1 | ${BIN_AWK} {'print $3'})/$(${BIN_FREE} -m | ${BIN_HEAD} -n 2 | ${BIN_TAIL} -n 1 | ${BIN_AWK} {'print $2'})MB
${COLOR_WHITE}Swap           Used/Total = ${COLOR_LIGHT_BLUE}$(${BIN_FREE} -m | tail -n 1 | ${BIN_AWK} {'print $3'})/$(${BIN_FREE} -m | ${BIN_TAIL} -n 1 | ${BIN_AWK} {'print $2'})MB
${COLOR_WHITE}Disk(/)        Used/Total = ${COLOR_LIGHT_BLUE}$(${BIN_DF} -h / | tail -n 1 | ${BIN_AWK} {'print $3'})/$(${BIN_DF} -h / | ${BIN_TAIL} -n 1 | ${BIN_AWK} {'print $2'})
${COLOR_DEFAULT}
===========[ ${COLOR_LIGHT_BLUE}Terms of Service${COLOR_DEFAULT} ]===============
${COLOR_RED}✘ DILARANG MINING
${COLOR_RED}✘ DILARANG DIJADIKAN SERVER VPN
${COLOR_RED}✘ DILARANG UNTUK MENGGUNAKAN KEGIATAN ILLEGAL 
${COLOR_RED}✘ DILARANG UNTUK BRUTE FORCE
${COLOR_RED}✘ And other illegal activities...${COLOR_DEFAULT}
==============================================
${COLOR_WHITE}Jangan lupa follow ${COLOR_RED}@ditzzsxz_ ${COLOR_WHITE}yaaa... arigatou and enjoyy your vps~~
${COLOR_DEFAULT}"

unset BIN_DATE BIN_FIGLET BIN_HOSTNAME BIN_IP BIN_GREP BIN_SED BIN_UPTIME BIN_CAT BIN_LSB_RELEASE BIN_UNAME BIN_FREE BIN_HEAD BIN_TAIL BIN_DF BIN_AWK BIN_BC BIN_PS
unset COLOR_LIGHT_GREEN COLOR_LIGHT_BLUE COLOR_YELLOW COLOR_RED COLOR_WHITE COLOR_DEFAULT
