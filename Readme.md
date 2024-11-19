# Python DevSecOps pipeline

Self-service для быстрой интеграции DevSecOps в разработку веб-приложений на Python3.

## Let's go!

```shell
vagrant up
```

## Управление кредами

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

## Уязвимые приложения

TODO: дописать

## Тестирование эффективности

TODO: сравнительная таблица для заложенных и найденных уязвимостей в приложениях
