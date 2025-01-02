#!/bin/bash
#
# FetchPi - Uma ferramenta minimalista para monitorar sua Raspberry Pi
# 
# Autor: Eder Garbin
# Licença: MIT
# 
# Este script foi criado para monitorar recursos básicos da Raspberry Pi de forma simples e eficiente.
# Pode ser usado em modo único ou contínuo (loop), com suporte para intervalos configuráveis.
#

# Cores para saída no terminal
CYAN="\033[1;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
NC="\033[0m" # Sem cor

# Função para exibir as informações do sistema
display_info() {
    echo -e "${CYAN}-----------------------------------------"
    echo -e "        ${GREEN}FetchPi - System Info${CYAN}"
    echo -e "-----------------------------------------${NC}"
    echo -e "${YELLOW}Hostname: ${NC}$(hostname)"
    echo -e "${YELLOW}OS:       ${NC}$(lsb_release -ds 2>/dev/null || echo "Raspberry Pi OS")"
    echo -e "${YELLOW}Kernel:   ${NC}$(uname -r)"
    echo -e "${YELLOW}Uptime:   ${NC}$(uptime -p)"
    echo -e "${YELLOW}CPU:      ${NC}$(cat /proc/cpuinfo | grep -E 'Model|Hardware' | cut -d ':' -f2 | xargs)"
    echo -e "${YELLOW}Memory:   ${NC}$(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
    echo -e "${YELLOW}Disk:     ${NC}$(df -h / | awk '/\// {print $3 "/" $2 " (" $5 ")"}')"
    echo -e "${YELLOW}Temp:     ${NC}$(vcgencmd measure_temp 2>/dev/null || echo "N/A")"
    echo -e "${CYAN}-----------------------------------------${NC}"
}

# Função principal para execução em loop
run_loop() {
    local delay=$1
    while true; do
        clear
        display_info
        sleep "$delay"
    done
}

# Argumentos e opções
show_usage() {
    echo -e "${GREEN}Uso:${NC} ./fetchpi.sh [opções]"
    echo -e "${YELLOW}Opções:${NC}"
    echo -e "  -w, --watch         Executa em modo contínuo (loop)."
    echo -e "  -n <segundos>       Define o intervalo de atualização no modo contínuo (padrão: 5 segundos)."
    echo -e "  -h, --help          Exibe esta mensagem de ajuda."
}

# Variáveis padrão
delay=5

# Processar argumentos
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -w|--watch) watch_mode=true ;;
        -n) shift; delay=$1 ;;
        -h|--help) show_usage; exit 0 ;;
        *) echo -e "${RED}Erro:${NC} opção desconhecida $1"; show_usage; exit 1 ;;
    esac
    shift
done

# Execução
if [[ $watch_mode == true ]]; then
    run_loop "$delay"
else
    display_info
fi

