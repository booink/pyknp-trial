# PyKNPのお試し環境

build

```sh
docker-compose build
```

起動

```sh
docker-compose run --rm pyknp bash
```

pyknpの実行
(私の環境では微動だにしなかった…)

```sh
python pyknp_test.py
```

コマンドラインから解析

```sh
echo "太郎は5月18日の朝9時に花子に会いに行った．" | juman | knp -tab -tree
```


# 参考

* https://qiita.com/equanz/items/f3027e334e204ac0bf12
* https://qiita.com/Kensuke-Mitsuzawa/items/ca6967f0ce07a978f358
