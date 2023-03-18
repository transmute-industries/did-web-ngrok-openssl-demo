# DID Web Tutorial

<img src="./docs/transmute-banner.png" />

#### [Questions? Contact Transmute](https://transmute.typeform.com/to/RshfIw?typeform-source=did-web-tutorial)

### Demo

#### Create DID

```
./scripts/generate.sh
```

#### Sign with Private Key

```
./scripts/sign.sh ./message.txt ./private_key.pem
```

#### Get Public Key from DID URL

```
./scripts/dereference.sh did:web:919ddedcf2e6.ngrok.app#key-0 public_key.pem
```

#### Verify with Public Key

```
./scripts/verify.sh ./message.txt ./message.txt.signature ./public_key.pem
```

<img src="./docs/demo.png" />
