FROM jnbnyc/ansible:2.4

WORKDIR /app/
COPY ansible.cfg \
    site.yml \
    /app/

RUN mkdir -pv /app/roles /app/output
COPY roles/manage_secrets /app/roles/manage_secrets
CMD ansible-playbook site.yml --tags shell
