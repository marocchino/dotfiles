function opsworks-instance-ips
  for i in $argv
    aws opsworks describe-instances --region=us-east-1 --stack-id=$i | python -c "import json,sys;obj=json.load(sys.stdin);print '\n'.join(' : '.join([stack['Hostname'], stack['PrivateIp']]) for stack in obj['Instances'])"
  end
end
