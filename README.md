# etoosamoe_infra
etoosamoe Infra repository

##ДЗ №5 ycloud infra

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
