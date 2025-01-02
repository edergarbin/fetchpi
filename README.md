# **FetchPi**

**FetchPi** é uma ferramenta simples e leve para monitoramento do sistema em tempo real, desenvolvida para o Raspberry Pi. A principal função é exibir informações essenciais sobre o dispositivo, como **CPU**, **Memória**, **Sistema**, e outros dados úteis de forma contínua e customizável.

### **Objetivo do Projeto**
Criado para monitorar a Raspberry Pi, durante o desenvolvimento, o **FetchPi** permite que você acompanhe o desempenho do dispositivo diretamente no terminal, sem a necessidade de uma interface gráfica, com um código simples e direto.

### **Recursos**
- Exibe informações detalhadas sobre a **CPU**, **Memória** e **Sistema**.
- Suporta **execução contínua**, atualizando os dados de forma regular.
- **Personalizável**: você pode escolher o intervalo de atualização e se deseja exibir informações curtas ou completas.
- Feito para ser leve, com foco na eficiência no Raspberry Pi e outros dispositivos embarcados.

---

## **Instalação**

1. Clone o repositório:
    ```bash
    git clone https://github.com/seuusuario/fetchpi.git
    cd fetchpi
    ```

2. Torne o script executável:
    ```bash
    chmod +x fetchpi.sh
    ```

3. Agora você pode rodar o script com:
    ```bash
    ./fetchpi.sh
    ```

---

## **Uso**

### **Execução Única**

Para exibir as informações do sistema uma vez, execute:

```bash
./fetchpi.sh
```

## **Modo de Monitoramento (Loop)**
Para executar o FetchPi em loop, com a atualização das informações de forma contínua, utilize a opção -w ou --watch:

```bash
./fetchpi.sh -w
```
Você também pode especificar um intervalo de tempo para a atualização, usando a opção -n seguida do número de segundos (por exemplo, 5 segundos):

```bash
./fetchpi.sh -w -n 5
```

Isso irá atualizar as informações a cada 5 segundos.

---

## **Estrutura do Projeto**
O projeto é composto por um único script fetchpi.sh que pode ser facilmente modificado para incluir novas informações ou personalizações.

## **Estrutura de Arquivos:**

```bash
fetchpi/
├── fetchpi.sh        # Script principal
└── README.md         # Documentação do projeto
```



## **Licença**
Este projeto é de código aberto e distribuído sob a Licença MIT. Fique à vontade para usar e modificar conforme necessário.

## **Sobre o Autor**
Fiz esse projeto pra mim, mas espero que seja útil para outros também! 
A ideia era ter algo simples, direto, e que me permitisse monitorar facilmente o desempenho do meu Raspberry Pi durante o desenvolvimento.


