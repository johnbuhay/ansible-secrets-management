# Secrets Management

> This depends on [ansible-role-manage-secrets](https://github.com/jnbnyc/ansible-secrets-management.git)

## Docker

### Build
```
ansible-playbook galaxy.yml

docker build --pull -t jnbnyc/secret-mgmt:master .
```

### Test
```
docker run --rm \
    -e ANSIBLE_VAULT_PASSWORD_FILE=vault.secret \
    -v ${PWD}/:/app/ \
    jnbnyc/secret-mgmt:master \
    ansible-playbook site.yml --extra-vars "secrets_file=./${1:-secrets.yml}" --tags shell
```

> Note:
> Do not use atomic file updates for bind mounted files, eg: <br/>
> -v ${PWD}/secrets.sh:/app/secrets.sh <br/>
> using a directory instead works
