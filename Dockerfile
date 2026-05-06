# Usar una imagen de Ruby oficial y ligera
FROM ruby:3.3-slim

# Instalar dependencias del sistema necesarias para sqlite3 y las gemas
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libsqlite3-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el Gemfile y Gemfile.lock (si existe)
COPY Gemfile* ./

# Instalar las gemas
RUN bundle install

# Copiar el resto de la aplicación
COPY . .

# Exponer el puerto predeterminado de Sinatra
EXPOSE 4567

# Comando para iniciar la aplicación
# Usamos -o 0.0.0.0 para que sea accesible desde fuera del contenedor
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0"]
