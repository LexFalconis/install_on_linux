# Install on Linux

Install on Linux foi criado para facilitar a MINHA vida pós instalação de distro linux baseadas em debian/ubuntu.

### Arquivos e suas funções
#### apps.txt
Arquivo onde deve ser adicionado o nome do pacote que deve ser instalado.
Obs.: Certifique-se de adicionar o nome de um pacote existente/válido. No arquivo atual, existem alguns que eu considero importantes para meu uso.

#### comandos_especificos.txt
Tem um comando que vc precisa/quer executar, porém ele não é simplesmente a instalação de algo? Coloque neste arquivo.

#### install.sh
Arquivo que irá executar toda a rotina/script.
Altere o nome 'teste' que é atribuido na variável 'USER_LINUX' na linha 5, para o nome de usuário que você utiliza no linux.
Exemplo para o usuário lex:
```
USER_LINUX=lex
```
Antes de mais nada, acesse o terminal com superusuário e altere o “/etc/sudoers”, adicionando o nome do usuário abaixo do root, com as mesmas configurações.
Exemplo, caso o nome do usuário seja haidar, o /etc/sudoers ficará assim:

### Como executar
Antes de mais nada, é importante que vc consiga executar comandos como superusuário (sudo). Caso vc não tenha essa permissão, pesquise como resolver isso.

Após garantir que consegue executar os comandos como superusuário e alterar a linha 5 do arquivo install.sh para o nome do seu usuário.

Abra a pasta com os arquivos mencionados acima e execute:
```
sudo bash install.sh
```
Obs.: Além da instalação, o script também ressincroniza os arquivos do indice de pacotes e suas fontes (update), assim como atualiza todo o sistema, mas sem instalar, remover ou atualizar pacote que possa gerar quebra do sistema (upgrade).

FIM :-)

