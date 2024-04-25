import fileinput

# Путь к файлу с конфигурацией
config_file_path = '/home/ec2-user/flask-alb-app/config.py'

# Новое значение MYSQL_HOST
new_mysql_host = "0.0.0.0"

# Заменить строку с MYSQL_HOST в файле
with fileinput.FileInput(config_file_path, inplace=True) as file:
    for line in file:
        print(line.replace("MYSQL_HOST = os.environ.get('MYSQL_HOST') or '127.0.0.1'", f"MYSQL_HOST = '{new_mysql_host}'"), end='')

