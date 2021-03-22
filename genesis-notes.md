# Setup

### pre-feature
```bash
curl -X POST http://127.0.0.1:6677/v1/producer/schedule_protocol_feature_activations -d '{"protocol_features_to_activate": ["0ec7e080177b2c02b278d5088611686b49d739925a92d9bfcacd7fc6b74053bd"]}'
```

### set boot
```bash
cleos-lacchain set contract eosio contracts/build/contracts/boot -p eosio
```

### Features on
```bash
cleos-lacchain push action eosio activate '["1a99a59d87e06e09ec5b028a9cbb7749b4a5ad8819004365d02dc4379a8b7241"]' -p eosio
cleos-lacchain push action eosio activate '["2652f5f96006294109b3dd0bbde63693f55324af452b799ee137a81a905eed25"]' -p eosio
cleos-lacchain push action eosio activate '["299dcb6af692324b899b39f16d5a530a33062804e41f09dc97e9f156b4476707"]' -p eosio
cleos-lacchain push action eosio activate '["ef43112c6543b88db2283a2e077278c315ae2c84719a8b25f25cc88565fbea99"]' -p eosio
cleos-lacchain push action eosio activate '["4a90c00d55454dc5b059055ca213579c6ea856967712a56017487886a4d4cc0f"]' -p eosio
cleos-lacchain push action eosio activate '["4e7bf348da00a945489b2a681749eb56f5de00b900014e137ddae39f48f69d67"]' -p eosio
cleos-lacchain push action eosio activate '["4fca8bd82bbd181e714e283f83e1b45d95ca5af40fb89ad3977b653c448f78c2"]' -p eosio
cleos-lacchain push action eosio activate '["68dcaa34c0517d19666e6b33add67351d8c5f69e999ca1e37931bc410a297428"]' -p eosio
cleos-lacchain push action eosio activate '["8ba52fe7a3956c5cd3a656a3174b931d3bb2abb45578befc59f283ecd816a405"]' -p eosio
cleos-lacchain push action eosio activate '["ad9e3d8f650687709fd68f4b90b41f7d825a365b02c23a636cef88ac2ac00c43"]' -p eosio
cleos-lacchain push action eosio activate '["e0fb64b1085cc5538970158d05a009c24e276fb94e1a0bf6a528b48fbc4ff526"]' -p eosio
cleos-lacchain push action eosio activate '["f0af56d2c5a48d60a4a5b5c903edfb7db3a736a94ed589d0b797df33ff9d3e1d"]' -p eosio
```
### Create genesis testnet-comitee accounts
cleos-lacchain create account eosio ve EOS6siJqwagvQvT254W6VEv2FsSuMe5cpVZwruteQ7zPTNMM5FVBg
cleos-lacchain create account eosio cr EOS6qd8RdSUbiV3o8TNSPxXbVxA6unSJGyF2o4LLuwFjZKKbvrvDD
cleos-lacchain create account eosio idb EOS6pRxjHwBv54L16BbFVLtZFS26Ku49KrFXg2Tcwnuaqv8YQB7sR
cleos-lacchain create account eosio ar EOS5ctRLnjycmDzCkJeCxviPwVJ7SX5ckTpzzsCWoiJhpiL5MgBAn


### change `active` permission of eosio (comitee account)
```bash
cleos-lacchain set account permission eosio active \
'{
    "threshold":1,
    "keys":[],
    "accounts":[
        {"weight":1, "permission" :{"actor":"ar", "permission":"active"}},
        {"weight":1, "permission" :{"actor":"cr", "permission":"active"}},
        {"weight":1, "permission" :{"actor":"idb", "permission":"active"}},
        {"weight":1, "permission" :{"actor":"ve", "permission":"active"}}
    ],
    "waits":[]
}' owner -p eosio@owner

### change `owner` permission of eosio (comitee account)
```bash
cleos-lacchain set account permission eosio owner \
'{
    "threshold":1,
    "keys":[{"key":"EOS6booNQ6pV1b4T2Gy9C6SqLngzdymTPPDqwSZE6prB8MEkpasLi","weight":1}],
    "accounts":[
        {"weight":1, "permission" :{"actor":"ar", "permission":"owner"}},
        {"weight":1, "permission" :{"actor":"cr", "permission":"owner"}},
        {"weight":1, "permission" :{"actor":"idb", "permission":"owner"}},
        {"weight":1, "permission" :{"actor":"ve", "permission":"owner"}}
    ],
    "waits":[]
}' -p eosio@owner

### add writer account
```bash
cleos-lacchain push action eosio newaccount \
'{
    "creator" : "eosio", 
    "name" : "writer",
    "active" : {
        "threshold":1,
        "keys":[],
        "accounts":[{"weight":1, "permission" :{"actor":"eosio", "permission":"active"}}],
        "waits":[]
    },
    "owner" : {
        "threshold":1,
        "keys":[],
        "accounts":[{"weight":1, "permission":{"actor":"eosio", "permission":"active"}}],
        "waits":[]
    }
}' -p eosio
```

### create `access` permission
```bash
cleos-lacchain set account permission writer access \
'{
    "threshold":1,
    "keys":[],
    "accounts":[{"weight":1, "permission" :{"actor":"eosio", "permission":"active"}}],
    "waits":[]
}' owner -p writer@owner
```

### set 0 resources to writer account (unusable)
```bash
cleos-lacchain push action eosio setalimits '["writer", -1, 0, 0, 0]' -p eosio
```

### set lacchain-system
```bash
cleos-lacchain set contract eosio contracts/build/contracts/lacchain.system -p eosio
```

# Play

### Comité crea una cuenta [FAIL]
```bash
cleos-lacchain push action eosio newaccount \
'{
    "creator" : "eosio", 
    "name" : "pepe",
    "active" : {
        "threshold":1,
        "keys":[ {"key":"EOS6wDfFCJqNYD3mteMZ4nEaYzx6s4TKKXeU4aQu35vyvexMWSdi5","weight":1}],
        "accounts":[], "waits":[]
    },
    "owner" : {
        "threshold":1,
        "keys":[ {"key":"EOS6wDfFCJqNYD3mteMZ4nEaYzx6s4TKKXeU4aQu35vyvexMWSdi5","weight":1}],
        "accounts":[], "waits":[]
    },
}' -p eosio
```

### Comité agrega un validador [OK]
```bash
cleos-lacchain push action eosio addvalidator \
'{
    "validator" : "ar1", 
    "owner" : {
        "threshold":1,
        "keys":[ {"key":"EOS5ctRLnjycmDzCkJeCxviPwVJ7SX5ckTpzzsCWoiJhpiL5MgBAn","weight":1}],
        "accounts":[], "waits":[]
    },
    "active" : {
        "threshold":1,
        "keys":[ {"key":"EOS5ctRLnjycmDzCkJeCxviPwVJ7SX5ckTpzzsCWoiJhpiL5MgBAn","weight":1}],
        "accounts":[], "waits":[]
    },
    "validator_authority" : [
        "block_signing_authority_v0", {
            "threshold" : 1,
            "keys":[ {"key":"EOS8M9LqAL964ZS5rxJ3WZtA3E1FvwWHxNJ8dsHrFDB1ywMqjZeJ9","weight":1}],
        }
    ],
    "url" : "https://my-validator-ar1-url.com/lacchain.json"
}' -p eosio
```

### Inspect `entity` table [OK]
```bash
cleos-lacchain get table eosio eosio entity
```

### Validator `ar1` crea un usuario [FAIL]
```bash
cleos-lacchain push action eosio newaccount \
'{
    "creator" : "ar1",
    "name" : "user1",
    "owner" : {
        "threshold":1,
        "keys":[ {"key":"EOS8mnEwNj2F8Qjwr3NUyViXgLPxW2r6bL8Yuyg7wPXraD36cpUnT","weight":1}],
        "accounts":[], "waits":[]
    },
    "active" : {
        "threshold":1,
        "keys":[ {"key":"EOS8mnEwNj2F8Qjwr3NUyViXgLPxW2r6bL8Yuyg7wPXraD36cpUnT","weight":1}],
        "accounts":[], "waits":[]
    }
}' -p ar1
```

### Comité agrega un escritor [OK]
```bash
cleos-lacchain push action eosio addwriter \
'{
    "writer" : "writer1", 
    "owner" : {
        "threshold":1,
        "keys":[ {"key":"EOS6nrfiTZ8EFyKsT4s5Z7UGd4JxZ5NGpNCo1yfZurURpPCUXppSZ","weight":1}],
        "accounts":[], "waits":[]
    },
    "active" : {
        "threshold":1,
        "keys":[ {"key":"EOS6nrfiTZ8EFyKsT4s5Z7UGd4JxZ5NGpNCo1yfZurURpPCUXppSZ","weight":1}],
        "accounts":[], "waits":[]
    },
    "url" : "https://my-writer-writer1-url.com/lacchain.json"
}' -p eosio
```

### get only entity writer1 [OK]
```bash
cleos-lacchain get table eosio eosio entity --index=1 --key-type=name -L writer1 --limit 1
```

### Writer `writer1` crea un usuario [FAIL]
```bash
cleos-lacchain push action eosio newaccount \
'{
    "creator" : "writer1",
    "name" : "user1",
    "active" : {
        "threshold":1,
        "keys":[ {"key":"EOS8mnEwNj2F8Qjwr3NUyViXgLPxW2r6bL8Yuyg7wPXraD36cpUnT","weight":1}],
        "accounts":[], "waits":[]
    },
    "owner" : {
        "threshold":1,
        "keys":[ {"key":"EOS8mnEwNj2F8Qjwr3NUyViXgLPxW2r6bL8Yuyg7wPXraD36cpUnT","weight":1}],
        "accounts":[], "waits":[]
    }
}' -p writer1
```

### Writer `writer1` crea un usuario [FAIL]
```bash
cleos-lacchain push action eosio newaccount \
'{
    "creator" : "writer1",
    "name" : "user1",
    "active" : {
        "threshold":2,
        "keys":[ {"weight":1,"key":"EOS8mnEwNj2F8Qjwr3NUyViXgLPxW2r6bL8Yuyg7wPXraD36cpUnT"}],
        "accounts":[ {"weight":1, "permission" :{"actor":"writer", "permission":"access"}}], "waits":[]
    },
    "owner" : {
        "threshold":2,
        "keys":[ {"weight":1,"key":"EOS8mnEwNj2F8Qjwr3NUyViXgLPxW2r6bL8Yuyg7wPXraD36cpUnT"}],
        "accounts":[{"weight":2, "permission" :{"actor":"writer", "permission":"access"}}], "waits":[]
    },
}' -p writer1
```

### Writer `writer1` crea un usuario [OK]
```bash
cleos-lacchain push action eosio newaccount \
'{
    "creator" : "writer1",
    "name" : "user1",
    "active" : {
        "threshold":2,
        "keys":[ {"weight":1,"key":"EOS8mnEwNj2F8Qjwr3NUyViXgLPxW2r6bL8Yuyg7wPXraD36cpUnT"}],
        "accounts":[ {"weight":1, "permission" :{"actor":"writer", "permission":"access"}}], "waits":[]
    },
    "owner" : {
        "threshold":2,
        "keys":[ {"weight":1,"key":"EOS8mnEwNj2F8Qjwr3NUyViXgLPxW2r6bL8Yuyg7wPXraD36cpUnT"}],
        "accounts":[{"weight":1, "permission" :{"actor":"writer", "permission":"access"}}], "waits":[]
    },
}' -p writer1
```

### test dummy action
```bash
cleos-lacchain push action eosio dummy '{}' -p eosio
```

### create unsinged tx - called by user1
```bash
cleos-lacchain push action -x 1000 -j -s -d eosio dummy '{}' -p user1@active > tx.json
```

### cleos-lacchain sign tx.json
```bash
cleos-lacchain sign tx.json > signed-tx.json
```

### add second writer
```bash
cleos-lacchain push action eosio addwriter \
'{
    "writer" : "writer2", 
    "owner" : {
        "threshold":1,
        "keys":[ {"key":"EOS8JcAuhAgqmL8ehTwiZRkuVTCjei5joMEixmZ8pvKz2HXYNwUxX","weight":1}],
        "accounts":[], "waits":[]
    },
    "active" : {
        "threshold":1,
        "keys":[ {"key":"EOS8JcAuhAgqmL8ehTwiZRkuVTCjei5joMEixmZ8pvKz2HXYNwUxX","weight":1}],
        "accounts":[], "waits":[]
    },
    "url" : "https://my-writer-writer2-url.com/lacchain.json"
}' -p eosio
```

### add third writer
```bash
cleos-lacchain push action eosio addwriter \
'{
    "writer" : "writer3", 
    "owner" : {
        "threshold":1,
        "keys":[ {"key":"EOS6p6uRM3mhuj8p76hdWa94XyKSXjRPe7NenxGCTZeoP4g5X4QnZ","weight":1}],
        "accounts":[], "waits":[]
    },
    "active" : {
        "threshold":1,
        "keys":[ {"key":"EOS6p6uRM3mhuj8p76hdWa94XyKSXjRPe7NenxGCTZeoP4g5X4QnZ","weight":1}],
        "accounts":[], "waits":[]
    },
    "url" : "https://my-writer-writer3-url.com/lacchain.json"
}' -p eosio
```

### link two entities
```bash
cleos-lacchain push action eosio addnetlink '["writer1","writer2",2]' -p eosio
```

### read graph
```bash
cleos-lacchain get table eosio eosio netlink
```

### set new schedule
```bash
cleos-lacchain push action eosio setschedule '[["ar1"]]' -p eosio
```
