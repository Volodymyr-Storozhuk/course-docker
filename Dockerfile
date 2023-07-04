# Встановлення базового образу
FROM python:3.10-slim-buster

# Опис образу
LABEL maintainer="Volodymyr Storozhuk volodymyr.storozhuk@hotmail.com"

# Опис користувача
ARG UID=1000
ARG GIT=1000
ENV UID=${UID}
ENV GID=${GID}

# Створення користувача
RUN useradd -m -u $UID docker_user
USER docker_user

# Робоча директорія
WORKDIR /home/docker_user/app

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1

# Копіюю і встановлюю залежності
COPY requirements.txt ./
RUN pip install -r requirements.txt
#  Копіюю проект
COPY . .
# Запускаю проект
CMD ["python3", "-m", "bot.main"]
