#!/usr/bin/env bash
  
terraform --version
cp github/provider.tf .

terraform init

terraform apply -var 'tags={ Name = "cicd-test-go-aws-instance-module" }' -auto-approve
terraform show
public_ip=`terraform output -raw public_ip`

ret=1
total=${NUM_OF_RETRIES:=40}


for (( c=1; c<=$total; c++ ))
do
   ssh -o StrictHostKeyChecking=no -i /tmp/go-ssh ubuntu@$public_ip ls -l
   ret=$?
   if [ "${ret}" == 0 ]
   then
        echo "Success"
        break
   fi
   echo "Got exit_code=$ret.Going to sleep. Will retry.attempt=$c:total=$total"
   sleep 10
done

terraform destroy -auto-approve
rm -f provider.tf
exit $ret
