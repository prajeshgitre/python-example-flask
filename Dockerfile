# Copyright 2020 Google, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.12-slim


ENV PYTHONUNBUFFERED True


ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./


RUN pip install Flask gunicorn


CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
