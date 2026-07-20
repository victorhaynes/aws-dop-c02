# Amazon CloudWatch Synthetics Canary
- Configurable script that monitor your APIs, URLs, Website
- Reproduce what your customers do programmatically to find issues before customers are impacted
- If the script somehow fails then you can find an issue
- Check availability and altency of your enpoints and can store load time dataadn screenshots of the UI
- Integration with CW Alarms
- Scripts written in Node.js or Python
- Programmatic access to a headless Google Chrome browser
- Canrun once or on a regular schedule

## Synetics Canar Blueprints
- `Heartbeat Monitor` - load url, store screenshot and HTTP archive file
- `API Canary` - test basic read andw rite functions of REST APIs
- `Broken Link Checker` - check all links inside the URL that you are testing
- `Visual Monitoring` - compare a screenshot taken during a canry run with a baseline screenshot
- `Canary Recorder` - used with CW Synthetics Recorder (record your actions on a website and automatically generates a script for that)
- `GUI Workflow Builder` - verifies that actions can be taken on your webpage (i.e. a login form works correctly)