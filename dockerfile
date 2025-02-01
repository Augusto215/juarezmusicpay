# Usa uma imagem oficial do Python
FROM python:3.10

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia apenas os arquivos necessários primeiro para otimizar o cache do Docker
COPY requirements.txt /app/

# Instala as dependências do projeto dentro do container
RUN pip install --no-cache-dir -r requirements.txt

# Copia todos os arquivos do projeto para dentro do container
COPY . /app

# Expõe a porta que o Django usará
EXPOSE 8000

# Comando padrão para rodar a aplicação
CMD ["python", "musicaapp/manage.py", "runserver", "0.0.0.0:8000"]
