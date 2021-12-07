FROM odoo:12.0
USER root
COPY . /mnt/extra-addons
RUN pip3 install --no-cache-dir -r /mnt/extra-addons/requirements.txt
RUN apt-get -y update
RUN pip3 install -U setuptools
RUN apt-get install -y build-essential libssl-dev libffi-dev python3-dev