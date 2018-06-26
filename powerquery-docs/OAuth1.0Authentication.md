# OAuth

## Implementing an OAuth Flow
The OAuth authentication type allows an extension to implement custom logic for their service. To do this, an extension will provide functions for StartLogin (returning the authorization URI to initiate the OAuth flow) and FinishLogin (exchanging the authorization code for an access token). Extensions can optionally implement Refresh (exchanging a refresh token for a new access token) and Logout (expiring the current refresh and access tokens) functions as well.
>**Note**: Power Query extensions are evaluated in applications running on client machines. Data Connectors should not use confidential secrets in their OAuth flows, as users may inspect the extension or network traffic to learn the secret. Please see the [OAuth 2.0 for Native Apps RFC](https://tools.ietf.org/html/rfc8252) for further details on providing flows that do not rely on shared secrets.
In the future we plan to support data sources that require confidential secrets (using a proxy based mechanism).
Please see the [MyGraph]() and [Github]() samples for more details.

TODO: Add links to MyGraph and Github
TODO: Describe how OAuth and OAuth2.0 differ, perhaps with examples for each?