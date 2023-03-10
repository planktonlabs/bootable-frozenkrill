# Release

In order to verify the release, you'll need to have gpg installed on your system. Once you've obtained a copy (and hopefully verified that as well), you'll first need to import the keys that have signed this release if you haven't done so already:

```bash
curl https://raw.githubusercontent.com/planktonlabs/frozenkrill/master/keys/dr.asc | gpg --import
```

Once you have the required PGP keys, you can verify the files. For instance after downloading a file and its signature `.sig`, run on the same directory:

```bash
gpg --verify alpine-frozenkrill_extended-edge-x86_64.iso.gz.sig
```

You should see something like:

```
gpg: assuming signed data in 'alpine-frozenkrill_extended-edge-x86_64.iso.gz'
gpg: Signature made Mon 13 Feb 2023 01:52:18 AM UTC
gpg:                using RSA key FA26B85752DC29DA32EE71403DD4DF7C8F3A3C60
gpg: Good signature from "Data Retriever <dr@galtland.network>" [ultimate]
gpg:                 aka "Data Retriever <dr@galtland.io>" [ultimate]
```

The above procedure should be enough to verify integrity and authenticity, but the checksums may be checked separately by downloading `sha512-manifest-checksums.txt` and then running:

```bash
sha512sum --ignore-missing -c sha512-manifest-checksums.txt
```