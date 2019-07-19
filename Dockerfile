FROM grahamdumpleton/mod-wsgi-docker:python-3.5

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		git \
		python3-pip \
		python3-dev \
		libpq-dev \
		postgresql-client \
		postgresql-client-common \
		memcached \
		unattended-upgrades && \
	rm -r /var/lib/apt/lists/*

RUN pip3 install --upgrade pip && pip install \
	"django==2.1" \
	"requests==2.21.0" \
	"postgres==2.2.2" \
	"kafka-python<=1.0" \
	"elasticsearch<3.0" \
	"freezegun==0.3.11" \
	"python-memcached==1.59" \
	"djangorestframework==3.9.4" \
	"pillow==6.1.0"

ENV LANG=en_US.UTF-8 PYTHONHASHSEED=random \
    PATH=/usr/local/python/bin:/usr/local/apache/bin:$PATH \
    MOD_WSGI_USER=www-data MOD_WSGI_GROUP=www-data

WORKDIR /app
