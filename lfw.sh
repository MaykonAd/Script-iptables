#! /bin/bash

while true
do

echo " ***TABELA DE FILTRAGEM*** "
echo "MENU DO SISTEMA"
echo "(1) Listar regras"
echo "(2) Inserir regras"
echo "(3) Deleta regra"
echo "(4) Limpar tela"
echo "(5) Sair"


read opcao

case "$opcao" in
"1")
iptables -L -n;;


"2")
echo "Ip de origem"
read ip_origem

echo "Porta de origem"
read porta_origem

echo "Ip destino"
read ip_destino

echo "Porta destino"
read porta_destino

echo "Protocolo"
read protocolo

echo "iface"
read iface

echo "Ação"
read acao

iptables -A INPUT -s $ip_origem -d $ip_destino -p $protocolo --sport $porta_origem --dport $porta_destino -i $iface -j $acao

echo " Regra inserida com sucesso "
;;

"3")
sleep 2
iptables -L --line-numbers

echo "***"
echo "***"
echo "Escolha a regra a ser removida"

read  deleta_regra

iptables -D INPUT $deleta_regra

echo "Regra deletada"
;;

"4")
clear
;;

"5")
exit 0
;; 
esac
done
