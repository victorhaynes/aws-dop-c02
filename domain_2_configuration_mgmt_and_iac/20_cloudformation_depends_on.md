# CF Depends On
- Specify a specific creation order for a specific resource
- I.e. EC2 `DependsOn: DBInstance` so DBInstance gets created first
- Most of this is determined automatically but sometimes if a `!Ref` or `!GetAtt` function isn't used to link things you may want to use `DependsOn:
