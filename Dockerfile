FROM python:3.10
WORKDIR /student-portal
COPY . .
CMD ["python", "student-portal.py"]