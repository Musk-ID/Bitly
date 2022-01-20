#!/usr/bin/bash
# creator by Kingtebe
# follow my github https://github.com/Musk-ID

function packages(){
   if [ -z $(command -v jq) ];then
   echo -e "\n[•] jq not installed !"
   echo -e "[•] pkg install jq for install\n"
   exit
   fi
}
packages

function second(){
   printf "\b[•] Loading    "
   for meki in {3..0};do
       get=$(printf "\b${meki}")
   printf "\b\b\b⟨⟨${get}⟩"
   sleep 1
   done
}

function short(){
   echo -e "\n[•] creator by kingtebe"
   echo -e "[•] https://githib.com/Musk-ID"
   echo -e "=============================="
   printf "[+] URL WEBSITE: " wal
   read url;
   use=$(curl -s -i --user-agent "Mozilla/5.0 (Linux; Android 8.1.0; CPH1853) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36" "https://bitly.com/");
   tok=$(echo -e "$use" | grep -Eo "_xs.*" | cut -d ";" -f1 | cut -d "=" -f2);
   cok=$(echo -e "$use" | grep -Eo "non_u.*" | cut -d ";" -f1)
   short=$(curl -s -X POST -H "x-requested-with:XMLHttpRequest" -H "x-xsrftoken:$tok" -H "save-data:on" -H "user-agent:Mozilla/5.0 (Linux; Android 8.1.0; CPH1853) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36" -H "cookie:a$cok" -H "cookie:optimizelyEndUserId=oeu1603761331892r0.787489685351362" -H "cookie:_mkto_trk=id:754-KBJ-733&token:_mch-bitly.com-1603761338881-15530" -H "cookie:_ga=GA1.2.1709603254.1603761340" -H "cookie:_gid=GA1.2.1165806065.1603761340" -H "cookie:wow-modal-id-2=yes" -H "cookie:_xsrf=$tok" -H "cookie:_gat=1" -H "cookie:cookie_banner=1" -d "url=$url" "https://bitly.com/data/anon_shorten");
   res=$(echo -e "$short" | jq -r .status_code);
   suc=$(echo -e "$short" | jq -r .data.id)
   if [[ ${res} =~ "200" ]];then
      echo -e "=============================="
      second
      echo -e "\n[✓] Success!"
      echo -e "[•] HASIL: ${suc}\n"
   elif [[ $res =~ "400" ]];then
      printf "[!] Invalid URL !!\n"
      exit 1
    fi
}
short

