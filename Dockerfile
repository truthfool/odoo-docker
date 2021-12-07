FROM odoo:12.0

EXPOSE 8069

ENV POSTGRES_DB=openg2p
ENV POSTGRES_PASSWORD=openg2p
ENV POSTGRES_USER=openg2p
ENV PGDATA=/var/lib/postgresql/data/pgdata
ENV POSTGRES_HOST_AUTH_METHOD="trust"

USER openg2p

RUN rm -rf /var/lib/apt/lists/* && apt-get update && \
apt-get clean && pip3 install --upgrade pip && \
pip3 install --upgrade setuptools

COPY . /mnt/extra-addons

RUN pip3 install --no-cache-dir -r /mnt/extra-addons/requirements.txt 