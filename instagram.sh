#!/bin/bash
# GET GAMBAR INSTAGRAM 
# Coded by xSuxHaxDax a.k.a DayWalker
# Zerobyte.id

####### COLOR #######
HIJAU='\033[0;32m'
MERAH='\033[0;31m'
NORMAL='\033[0m'
CYAN='\033[0;36m'
BIRU='\033[0;34m'
PUTIH='\033[1;37m'
#printf "${MERAH}Hello\n ${NORMAL}"
#echo
useragent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36";

function get(){
	cek=$(curl -s -A $useragent "https://www.instagram.com/$username/");
	if [[ $cek =~ 'The link you followed may be broken, or the page may have been removed.' ]]; then
		echo "[x] $username NOT FOUND!";
		exit
	elif [[ ${cek} =~ 'is_private": true' ]]; then
		echo "[x] Private Account $username";
		exit
	else
		printf "[!] FOUND USERNAME : ${HIJAU}$username\n${NORMAL}"
		curl -s -A $useragent https://www.instagram.com/$username/ | grep -Po '(?<="display_src": ")[^",]*' >> list_gambar.tmp
	fi
}

cat << "ZERO"
 _____              _           _         _     _
|__  /___ _ __ ___ | |__  _   _| |_ ___  (_) __| |
  / // _ \ '__/ _ \| '_ \| | | | __/ _ \ | |/ _` |
 / /|  __/ | | (_) | |_) | |_| | ||  __/_| | (_| |
/____\___|_|  \___/|_.__/ \__, |\__\___(_)_|\__,_|
                          |___/                  
----------- DayWalker [at] zerobyte.id ----------
------------ GRAB DOWNLOAD PHOTO IG -------------
-------------------------------------------------
 
ZERO
echo -n "MASUKAN USER IG : "; read username;
get
printf "${PUTIH}Proses Downloading . . .\n"
mkdir Download_$username
sleep 2s
for download in $(cat list_gambar.tmp); do
	wget $download -P Download_$username/ &> /dev/null
done
printf "${BIRU}=====================================\n${NORMAL}";
printf "${MERAH}USERNAME ${HIJAU}$username\n";
printf "${CYAN}DOWNLOADING DONE . . .\n";
printf "${PUTIH}FOLDER = Download_$username\n"
printf "${BIRU}=====================================\n${NORMAL}";
## REMOVE LIST ##
rm list_gambar.tmp
