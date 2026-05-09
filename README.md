# Terraform: 2 VMs in Yandex Cloud

**EN**  
This repository creates a small test environment in Yandex Cloud:

- 2 Linux virtual machines
- cloud-init bootstrap on first boot

**RU**  
Этот репозиторий создает небольшой тестовый стенд в Yandex Cloud:

- 2 Linux VM
- bootstrap через `cloud-init` при первом запуске

## Prerequisites

**EN**

- `yc` is installed and configured on your machine
- `terraform` is installed
- environment variables can be refreshed with your `tfauth` helper
- an SSH public key exists at `~/.ssh/id_ed25519.pub`

**RU**

- `yc` установлен и настроен на твоей машине
- `terraform` установлен
- переменные окружения можно обновлять через helper `tfauth`
- публичный SSH-ключ существует по пути `~/.ssh/id_ed25519.pub`

## 1. Get your image ID

**EN**  
Pick an image for the boot disks, for example Ubuntu:

**RU**  
Выбери образ для boot disk, например Ubuntu:

```zsh
yc compute image list --folder-id standard-images
```

**EN**  
Copy the required image ID.

**RU**  
Скопируй нужный `image_id`.

## 2. Prepare variables

**EN**  
Create your local variables file:

**RU**  
Создай локальный файл переменных:

```zsh
cp terraform.tfvars.example terraform.tfvars
```

**EN**  
Then edit `terraform.tfvars` and set:

- `cloud_id`
- `folder_id`
- `subnet_id`
- `image_id`
- optional VM sizes and names

**RU**  
Потом открой `terraform.tfvars` и задай:

- `cloud_id`
- `folder_id`
- `subnet_id`
- `image_id`
- при необходимости размеры и имена VM

## 3. Refresh auth

**EN**  
Before running Terraform:

**RU**  
Перед запуском Terraform:

```zsh
tfauth
```

## 4. Deploy

```zsh
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

**EN**  
After the instances are created, cloud-init will:

- create the user from `ssh_user` with passwordless sudo
- set the VM hostname
- create `/opt/bootstrap/cloud-init.done`

The custom image built by Packer already contains the shared OS baseline:

- system updates
- `cloud-init`
- base CLI tools
- SSH hardening
- firewall baseline
- `journald` baseline

You can verify bootstrap after SSH login:

**RU**  
После создания VM `cloud-init` выполнит:

- создание пользователя из `ssh_user` с `passwordless sudo`
- установку hostname VM
- создание файла-маркера `/opt/bootstrap/cloud-init.done`

Custom image, собранный через Packer, уже содержит общий OS baseline:

- системные обновления
- `cloud-init`
- базовые CLI-инструменты
- базовый SSH hardening
- базовый firewall
- базовую настройку `journald`

Проверить bootstrap после входа по SSH можно так:

```zsh
cloud-init status --long
ls -la /opt/bootstrap
/usr/local/bin/bootstrap-check
```

## 5. Destroy

**EN**  
When the test environment is no longer needed:

**RU**  
Когда тестовый стенд больше не нужен:

```zsh
tfauth
terraform destroy
```

## Notes

**EN**

- `terraform.tfvars` is ignored by git because it contains your real IDs
- if `YC_TOKEN` expires, run `tfauth` again and repeat the Terraform command

**RU**

- `terraform.tfvars` исключен из git, потому что содержит твои реальные значения
- если `YC_TOKEN` истек, снова выполни `tfauth` и повтори команду Terraform
