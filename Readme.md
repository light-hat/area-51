# Python DevSecOps pipeline

Виртуальная инфраструктура для быстрой интеграции DevSecOps в процессы разработки веб-приложений на Python3.

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
