# Alpine Node

:warning: This image should not be used yet. It is not completely done. :warning:

Also supports timezones.

Based on Node 15.6.0 and alpine 3.12.

## Supported ENV and ARG

All variables are optional.

| Stage | Variable              | Description                               | Default                         |
| ----- | --------------------- | ----------------------------------------- | ------------------------------- |
| BUILD | TZDATA_VERSION        | Set version of tzdata to install          | 2020f-r0                        |
| RUN   | NODE_ENV              | Which environment node should run in      | production                      |
| RUN   | TZ                    | Set the timezone of the container         | Europe/Berlin                   |
| RUN   | DOCUMENT_ROOT         | Define the directory of the project       | /var/www/html                   |
| RUN   | NPM_CONFIG_LOGLEVEL   | Define the directory of the public web    | warn                            |
| RUN   | START_SCRIPT          | Set application environment               | start                           |

[You can also pass any optional environment parameters which node automaticlly interprets.](https://docs.npmjs.com/cli/v6/using-npm/config#environment-variables)
