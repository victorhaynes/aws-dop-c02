# CF Drift
- CF does not protect against manual config changes
- How do we find drift?

## Solution
- Cloudformation Drift
- Upload your template and it will compare vs what is expected
- Can compare vs an entire stack, stackset, or individual resource

Again, KIND of like running terraform plan on up-resources

- Note changes made through CloudFormation to a stack directly (not at the StackSet level) aren't considered drifted `EXAM`

meaning if you have a stack set but then change it directly using cloudformation, cloudformation still did the change so it will not report drift. Note you should not do this