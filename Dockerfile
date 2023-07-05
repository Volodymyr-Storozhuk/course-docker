# install basic image
FROM python:3.10-slim-buster

# about project
LABEL maintainer="Volodymyr Storozhuk volodymyr.storozhuk@hotmail.com"

# users uid gid
ARG UID=1000
ARG GIT=1000
ENV UID=${UID}
ENV GID=${GID}

# add user
RUN useradd -m -u $UID docker_user
USER docker_user

# work dir
WORKDIR /home/docker_user/app

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1

# cp project and copy requiremets
COPY requirements.txt ./
RUN pip install -r requirements.txt
#  cp project
COPY . .

# run project
# for run as module
CMD ["python3", "-m", "bot.main"]
# for run as script
# CMD ["python3", "bot/main.py"]
