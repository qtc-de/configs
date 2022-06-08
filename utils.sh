#!/bin/bash

# Some shortcuts for playing ctf. Intended to be sourced by shell startup on a machine
# with the required tools installed (e.g. Kali Linux)

UTILS_PW='/usr/share/wordlists/rockyou.txt'
UTILS_DIR='/usr/share/seclists/Discovery/Web-Content/raft-large-words.txt'
UTILS_USER='/usr/share/seclists/Usernames/xato-net-10-million-usernames.txt'

alias my-nmap="mkdir -p nmap && sudo nmap -oA ./nmap/nmap -sV -sC -v -p- "
alias plain-buster="gobuster dir -k -o gobuster.dat -w ${UTILS_DIR} -u "
alias php-buster="gobuster dir -x .php,.html -k -o gobuster.dat -w ${UTILS_DIR} -u "
alias asp-buster="gobuster dir -x .asp,.aspx,.html,.htm -k -o gobuster.dat -w ${UTILS_DIR} -u "
alias all-buster="gobuster dir -x .html,.htm,.txt,.pdf,.xml,.json,.zip -k -o gobuster.dat -w ${UTILS_DIR} -u "
alias rjohn="john --wordlist=${UTILS_PW} "
alias vhosts='wfuzz -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -H "Host: FUZZ.example.org" http://'
alias impacket="cd /usr/share/doc/python3-impacket/examples"
alias rcat="rlwrap nc"
alias en="aspell --master=en check"
alias de="aspell --master=de check"

function no_space() {
    sed -u 's/ /${IFS}/g' | xclip -selection c
}

function no_space2() {
    local start
    start="IFS=_;CMD="
    sed -u 's/ /_/g' | \
    sed -u "s/^/$start/" | \
    sed -u 's/$/;$CMD;/' | xclip -selection c
}

function web() {
    echo "[+] Switching to ~/www"
    mkdir -p ~/www && cd ~/www

    #if [[ $# -ge 1 ]] && [[ $1 -le 1024 ]]; then
    #    sudo python3 -m http.server $1
    #else
        python3 -m http.server $1
    #fi

    echo -n "[+] Going back to "
    cd -
}
