FROM python:3.9-slim

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o arquivo de dependências para o contêiner
COPY requirements.txt .

# Instalar as dependências da aplicação
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o código da aplicação para o contêiner
COPY . .

# Expor a porta em que a aplicação roda (supondo que Flask rode na porta 5000)
EXPOSE 5000

# Comando para iniciar a aplicação
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
