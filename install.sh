#!/bin/bash

# Defina na variavel "user" o login do usuario que utilizará o sistema
# Assim para o usuario teste, algumas alterações serão aplicadas em /home/teste
USER_LINUX=teste

echo -e '\033[0;32m###########################################################################\033[0m'
echo -e '\033[0;32mAtualizando repositórios..\033[m'
echo -e '\033[0;32m###########################################################################\033[m'
if ! apt-get update -y
then
    echo -e '\033[48;2;255;0;02m###>>> Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list\033[m'
exit 1
fi
echo -e '\033[0;32m###########################################################################\033[m'
echo -e '\033[0;32mAtualização feita com sucesso\033[m'
echo -e '\033[0;32m###########################################################################\033[m'

echo ''
echo -e '\033[0;32m###########################################################################\033[m'
echo -e '\033[0;32mAtualizando pacotes já instalados\033[m'
echo -e '\033[0;32m###########################################################################\033[m'
if ! apt-get dist-upgrade -y
then
    echo -e '\033[48;2;255;0;02m###>>> Não foi possível atualizar pacotes.\033[m'
   exit 1
fi
echo ''
echo -e '\033[0;32m###########################################################################\033[m'
echo -e '\033[0;32mAtualização de pacotes feita com sucesso\033[m'
echo -e '\033[0;32m###########################################################################\033[m'

filename='apps.txt'
while read line; do
  if ! apt-get install $line -y
  then
      echo -e '\033[48;2;255;0;02m###>>> Não foi possível instalar o pacote '$line'\033[m'
      exit 1
  fi
  echo ''
  echo -e '\033[0;32m###########################################################################\033[m'
  echo -e '\033[0;32mInstalação do(a) "'$line'" finalizada.\033[m'
  echo -e '\033[0;32m###########################################################################\033[m'
done < $filename

echo ''
echo -e '\033[0;32m###########################################################################\033[m'
echo -e '\033[0;32mInstalar Powerline\033[m'
echo -e '\033[0;32m###########################################################################\033[m'
git clone --depth=1 https://github.com/Bash-it/bash-it.git /home/$USER_LINUX/.bash_it
/home/$USER_LINUX/.bash_it/install.sh -s
cp /root/.bashrc /home/$USER_LINUX/.bashrc
git clone https://github.com/powerline/fonts.git --depth=1 fonts
cd fonts
./install.sh
cd ..
rm -rf fonts
sed -i 's/bobby/powerline-multiline/' /home/$USER_LINUX/.bashrc
echo -e '\033[0;32mFinalizada a instalação do Powerline\033[m'
echo -e '\033[0;32m###########################################################################\033[m'
echo ''
echo ''

echo -e '\033[0;32mDefinindo o vim como editor padrão no bash:\033[m'
echo '' >> /home/$USER_LINUX/.bashrc
echo 'export VISUAL=vim' >> /home/$USER_LINUX/.bashrc
echo 'export EDITOR="$VISUAL"' >> /home/$USER_LINUX/.bashrc

echo ''
echo -e '\033[0;32m###########################################################################\033[m'
echo -e '\033[0;32mIniciar execução de comandos especificos\033[m'
ESPECIFICOS='comandos_especificos.txt'

if [ -s $ESPECIFICOS ]; then
        while read line; do
          if ! $line
          then
              echo -e '\033[38;2;255;0;02mNão foi possível executar o comando "'$line'".\033[m'
              exit 1
          fi
          echo ''
          echo -e '\033[0;32m###########################################################################\033[m'
          echo -e '\033[0;32mComando especifico "'$line'" finalizado.\033[m'
          echo -e '\033[0;32m###########################################################################\033[m'
        done < $ESPECIFICOS
else
        echo -e '\033[48;2;255;0;02m###>>> Não foram encontrados comandos especificos para serem executados.\033[m'
fi
