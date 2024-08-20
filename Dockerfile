# Python 이미지 사용
FROM python:3.9-slim

# 작업 디렉토리 설정
WORKDIR /app

# 의존성 파일 복사 및 설치
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 애플리케이션 코드 복사
COPY . /app/

# 환경 변수 설정 (필요 시)
ENV DJANGO_SETTINGS_MODULE=myproject.settings

# 마이그레이션 실행 및 static 파일 수집
RUN python manage.py migrate

# 애플리케이션 실행
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
