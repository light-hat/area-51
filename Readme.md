<h1 align="center">🐍 Python DevSecOps pipeline</h1>

<p align="center">
<img src="https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge">
<img src="https://img.shields.io/badge/vagrant-%231563FF.svg?style=for-the-badge&logo=vagrant&logoColor=white">
<img src="https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white">
<img src="https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white">
<img src="https://img.shields.io/badge/jenkins-%232C5263.svg?style=for-the-badge&logo=jenkins&logoColor=white">
<img src="https://img.shields.io/badge/SonarQube-black?style=for-the-badge&logo=sonarqube&logoColor=4E9BCD">
</p>

<p align="center">Виртуальная инфраструктура для быстрой интеграции DevSecOps в процессы разработки веб-приложений на Python3.</p>

## 🚀 Let's go!

1. Добавьте следующее в ваш `hosts` файл:

```text
127.0.0.1 jenkins.devops.local
127.0.0.1 defectdojo.devops.local
127.0.0.1 sonarqube.devops.local
```

> [!TIP]
> Где находится файл hosts?
>
> В Windows: `C:\Windows\System32\hosts`
>
> В Linux: `/etc/hosts`

2. Запустите виртуалку:

> [!WARNING]  
> Должны быть установлены `Vagrant` и `VirtualBox`.

> [!TIP]
> Базовый box `ubuntu/focal64` можно скачать [отсюда](https://portal.cloud.hashicorp.com/vagrant/discover/ubuntu/focal64).

```shell
vagrant up
```

<p align="center">
<img src="assets/vagrant_demo.gif">
</p>

## 🔒 Первичный доступ к сервисам

### SonarQube

Логин: `admin`

Пароль: `admin`

### DefectDojo

Логин: `admin`

Пароль получаем командой:

```shell
vagrant ssh -c "cd /vagrant/defectdojo && sudo docker compose logs initializer | grep 'Admin password:'"
```

### Jenkins

- Админ: `admin:admin`

- Разработчик: `developer:developer`

- Наблюдатель: `viewer:viewer`

## 🚩 Уязвимые приложения

TODO: дописать

## 📈 Тестирование эффективности

TODO: сравнительная таблица для заложенных и найденных уязвимостей в приложениях
