# Ruby script to get hash for Automatic SMS Verification on Android

Ruby implementation of this script: https://github.com/googlearchive/android-credentials/blob/master/sms-verification/bin/sms_retriever_hash_v9.sh

## How to use

```
$ ruby get_sms_verification_hash.rb --package com.yourcompany.appname --keystore ../AppName/android/app/release-key.keystore --alias release-key --storepass MyPass123

Your hash for verification sms: SQQpXpxMN75
```

## Contributing

1. Fork it ( https://github.com/kesha-antonov/android-sms-verification-hash/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Credits

https://github.com/googlearchive/android-credentials/blob/master/sms-verification/bin/sms_retriever_hash_v9.sh

## License

MIT
