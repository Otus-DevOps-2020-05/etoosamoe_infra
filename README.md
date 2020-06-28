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
