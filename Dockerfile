FROM grahamdumpleton/mod-wsgi-docker:python-3.5

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		git \
		python3-pip \
		python3-dev \
		postgresql-10 \
		libpq-dev \
		postgresql-client \
		postgresql-client-common \
		unattended-upgrades && \
	rm -r /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install \
	"django==2.1" \
	"postgres==2.2.2" \
	"kafka-python<=1.0" \
	"elasticsearch<3.0"

ENV LANG=en_US.UTF-8 PYTHONHASHSEED=random \
    PATH=/usr/local/python/bin:/usr/local/apache/bin:$PATH \
    MOD_WSGI_USER=www-data MOD_WSGI_GROUP=www-data

WORKDIR /app
