# etoosamoe_infra
etoosamoe Infra repository

## ДЗ №3 ycloud infra

``bastion`` ext: 84.201.173.68 int: 10.130.0.6
``someinternalhost`` int: 10.130.0.19
``84.201.173.68.xip.io``

### Задания

#### Подключение в одну строку

```
ssh -i ~/.ssh/appuser -A appuser@84.201.173.68 'ssh -tt appuser@10.130.0.19'``
```

#### Подключение короткой командой

```
cat > ~/.ssh/config << EOF
Host someinternalhost
    Hostname 84.201.173.68
    User appuser
    ForwardAgent yes
    IdentityFile ~/.ssh/appuser
    RequestTTY force
    RemoteCommand ssh 10.130.0.19
EOF

ssh someinternalhost
```

#### Pritunl VPN

```
bastion_IP = 84.201.173.68
someinternalhost_IP = 10.130.0.19
```

## ДЗ№4 Деплой тестового приложения в облако

```
testapp_IP=130.193.51.219
testapp_port=3030
```

```
yc compute instance create \
  --name reddit \
  --hostname reddit \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./meta.yaml

```

## ДЗ №5 Подготовка образа с помощью Packer

### Что сделано
 - Изучена документация Packer
 - Методом проб и ошибок написаны json-ы для образов
 - Сделан скрипт для создания готовой ВМ


## ДЗ №6 Работа с Terraform

 - Изучено создание конфигов для Терраформа, синтаксис команд
 - Изучена работа с переменными, с выходными данными
 - Проведены эксперименты с Load Balancer

 В задании с ** переделан код приложения для работы с count, так как это экономит код и лишает возможности ошибиться и дает возможность быстро масштабироваться.

 Параметр ``count`` задается как переменная, default = "1".

 В ``output.tf`` также добавлена информация о внешнем адресе балансировщика.

## ДЗ №7 Terraform 2

- Разделили инфраструктуру на модули, разбили на стейдж и прод
- Исправлена ситуация, что приложение ищет БД на локалхосте
- Закинул tfstate в бакет
- Разобрался с access_key и secret_key. Оказалось, что Яндекс не умеет их брать из tfvars. Пришлось ставить AWS-CLI

- Спасибо за `TF_LOG=TRACE`

## ДЗ Ansible 1

 - Базовые навыки работы с Ansible
 - Модули ping, command и т.п.
 - INI и YML инвентори файлы

Динамический инвентори сделаю позже. Трудозатраты велики. Хочется, чтобы из терраформа или yc сразу брался.

Ок. Вроде динамический и вроде даже инвентори. Скрипт смотрит в yc айпишники машин, если `ansible-inventory` запустить с ключом `--list`, то вроде формирует инвентори. Модуль `ping` отрабатывает

## ДЗ Ansible 2

 - сделал один большой плейбук
 - разбил на маленькие
 - переделал образы пакера на ансибл
 - то ли еще будет...
