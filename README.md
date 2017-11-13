# Slinga Formula

This formula will install and configure Slinga, the Slack to Icinga2 connector.

## Pillar Example

    slinga:
      host: localhost                        # Icinga2 host
      port: 5665                             # Icinga2 API port
      username: IcingaApiUser
      password: IcingaApiPass
      validation_token: slackvalidationtoken
