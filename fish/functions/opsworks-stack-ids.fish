function opsworks-stack-ids
  aws opsworks describe-stacks --region=us-east-1 | python -c "import json,sys;obj=json.load(sys.stdin);print '\n'.join(' : '.join([stack['StackId'], stack['Name']]) for stack in obj['Stacks'])"
end
