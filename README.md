# DynamicModuleLoading
弊社開発にて、先輩エンジニアの特定dir直下に指定のinterfaceを満たすmoduleを追加すると自動で指定文字列からmoduleを読み込むという設計に感動したのでパクりました。
(実際にはclassname.new()だったけど、ここでは動的に内部関数を呼び出すことにする)

## Usage
- `/lib/processes/children`直下に`___.ex`の形式でファイルを作成
- `/lib/processes/children/README.md`を元に、interface(定義してないけど)を満たすmoduleを作成
- `Main.execute`より動作を開始。動的に作成したファイルからプロセスが起動していることが確認出来る。

## Action
- 指定のdir内にinterfaceを満たすmoduleを作成(`/lib/processes/children`)
- children内部に作成されている`.ex`ファイルを読み込み、module名を取得して一覧として返す
- 読み込んだ文字列からmodule内に定義された関数を動的に呼び出す -> ここでは定義ファイルなどに新たに作成したmoduleの指定は行わない

### Multi Task
- 事前に親となるプロセスを立ち上げる
- 動的に生成されるプロセスは子プロセスとして扱い立ち上げる
- 親プロセスに対して子プロセスはメッセージを送信し続ける(MasterSlaveModel)
  - メッセージが多すぎてツライのでランダム停止させている

