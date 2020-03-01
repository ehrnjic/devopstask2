# Spin-up dev VM for DevOps Task #2

## Dev Host Envionnement

- Debian `v10.3 (Buster)`
- VirtualBox `v6.0.18`
- Vagrant `v2.2.3`

Vagrantfile use `VirtualBox` as a provider and `file` and `shell` as a provisioners. 

## Steps to spin-up VM

- Clone this repo on dev host
```
git clone https://github.com/ehrnjic/devopstask2.git
```

- Change working directory
```
cd ./devopstask2
```

- Spin-up VM
```
vagrant up
```

## Checks

- Login to `guest` and run health check script
```
vagrant ssh
./basic-microservices/health_check.sh
```

OR

- Run health check script on `host`
```
./scripts/health_check.sh
```

If everything works you can expect output
```
All checks passed. Congrats!
```
