# Bash cheat codes

## working with env
```bash
echo "peremennaja=\$znachenie" > test.conf.tpl
echo "peremennaja=\${znachenie}" > test.conf.tpl
echo "peremennaja=\$znachenie2" > test.conf.tpl
export znachenie=Moja_SUper_puper_Peremennaja
export znachenie2=iskljuchaem_etu_peremennuju

envsubst '$znachenie' < test.conf.tpl > test.conf # podmenit toljko peremennuju $znachenie v dvuh formatah $znachenie i ${znachenie}
envsubst < test.conf.tpl > test.conf # Podmenit vse peremennie
```
export CONTAINER_IMAGE=$(cat build_${STAGE}.env  | grep CONTAINER_IMAGE | cut -d = -f2)
