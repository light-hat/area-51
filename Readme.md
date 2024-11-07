# Area-51

Виртуальная инфраструктура для DevSecOps, построенная на открытых решениях.

```
TODO:
- Демо
- Развёртывание
- База
- Конкретные пайплайны
```

## Стек

![Vagrant](https://img.shields.io/badge/vagrant-%231563FF.svg?style=for-the-badge&logo=vagrant&logoColor=white)
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Jenkins](https://img.shields.io/badge/jenkins-%232C5263.svg?style=for-the-badge&logo=jenkins&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

## Аппаратные требования

- CPU: `6 ядер`

- RAM: `12 Гб`

- Disk: `100 Гб`

## Запуск

> [!WARNING]  
> Должны быть установлены `Vagrant` и `VirtualBox`.

> [!TIP]
> Базовый box `ubuntu/focal64` можно скачать [отсюда](https://portal.cloud.hashicorp.com/vagrant/discover/ubuntu/focal64).

```shell
vagrant up
```

## DNS

Добавьте следующее в файл `hosts`:

```
192.168.33.11   ci.area51.local
192.168.33.12   defectdojo.area51.local
192.168.33.13   storage.area51.local
```

## Цикл DevSecOps

![Схема цикла DevSecOps](assets/devsecops.png)

To be continued...
