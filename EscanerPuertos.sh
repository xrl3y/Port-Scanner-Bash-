#!/bin/bash

# Colores para la salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin color

# Función de ayuda
function show_help {
    echo -e "${CYAN}Uso: $0 <IP_o_nombre_de_host> [opciones]${NC}"
    echo
    echo -e "${YELLOW}Opciones:${NC}"
    echo "  -h, --help            Mostrar este mensaje de ayuda."
    echo "  -p, --puertos         Especificar puertos a escanear (ejemplo: 1-1000)."
    echo "  -s, --scan-type       Tipo de escaneo (ejemplo: -sS para escaneo SYN, -sT para escaneo TCP completo)."
    echo "  -o, --output          Guardar resultados en un archivo."
    echo "  -A, --aggressive      Realizar un escaneo agresivo (detecta versiones y sistema operativo)."
    echo "  -v, --verbose         Muestra información detallada durante el escaneo."
    echo "  -iL, --input-list     Leer direcciones IP desde un archivo."
    echo "  -p-                   Escanear todos los puertos (1-65535)."
    echo "  -Pn                   No realizar ping antes del escaneo."
    echo
    echo -e "${GREEN}Ejemplo:${NC}"
    echo "  $0 192.168.1.1 -p 1-1000 -sS -o resultados.txt"
    exit 0
}

# Comprobar si se proporciona una dirección IP o nombre de host
if [[ $# -eq 0 ]]; then
    show_help
fi

# Definir variables predeterminadas
TARGET=""
PORTS=""
SCAN_TYPE="-sS"
OUTPUT_FILE=""
VERBOSE=""

# Procesar opciones
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            ;;
        -p|--puertos)
            PORTS="$2"
            shift
            ;;
        -s|--scan-type)
            SCAN_TYPE="$2"
            shift
            ;;
        -o|--output)
            OUTPUT_FILE="$2"
            shift
            ;;
        -A|--aggressive)
            SCAN_TYPE="-sS -A"
            ;;
        -v|--verbose)
            VERBOSE="-v"
            ;;
        -iL|--input-list)
            TARGET="$2"
            shift
            ;;
        *)
            TARGET="$1"
            ;;
    esac
    shift
done

# Ejecutar nmap para escanear puertos abiertos
if [[ -n "$OUTPUT_FILE" ]]; then
    echo -e "${GREEN}Escaneando puertos abiertos en $TARGET...${NC}"
    nmap $SCAN_TYPE $VERBOSE -p ${PORTS:-1-65535} $TARGET -oN "$OUTPUT_FILE"
    echo -e "${YELLOW}Resultados guardados en $OUTPUT_FILE${NC}"
else
    echo -e "${GREEN}Escaneando puertos abiertos en $TARGET...${NC}"
    nmap $SCAN_TYPE $VERBOSE -p ${PORTS:-1-65535} $TARGET
fi

