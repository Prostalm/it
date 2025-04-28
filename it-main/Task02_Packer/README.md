# Задача 02: Створення образів за допомогою Packer

## Опис
Шаблони Packer для збірки образів віртуальних машин.

## Кроки для запуску
1. Встановити Packer.
2. Перейти до папки і виконати:
   ```bash
   packer init .
   packer validate .
   packer build .
Файли
ubuntu.json — конфігурація для Ubuntu

variables.pkr.hcl — параметри збірки
