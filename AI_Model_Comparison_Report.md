# Pythonコード比較表（PNG → JPEG変換）

```
// お題
フォルダ内のpng画像を、jpeg画像に変換するPythonスクリプトを作って
```

| 項目 | Mistral生成コード | ChatGPT生成コード |
|------|------------------|-------------------|
| **基本構造** | `os.listdir()` でファイル一覧取得後、条件分岐で `.png` のみ処理 | 同様に `os.listdir()` でループ。ただしパス結合に `os.path.join()` 使用 |
| **ファイルパス結合** | 文字列連結（`folder_path + "/" + filename`） | `os.path.join(folder_path, filename)` でOS依存回避 |
| **拡張子変更** | `.replace(".png", ".jpeg")` を使用 | `os.path.splitext()` で安全に拡張子変更 |
| **画像処理** | PILの `Image.open()` → `.save()` でJPEG保存 | 同様。ただし `img.convert("RGB")` を追加して透過対応 |
| **透過PNG対応** | なし（透過があるとJPEG変換でエラーや背景黒化の可能性） | `convert("RGB")` で透過を白背景に変換 |
| **エラー処理** | なし | `try-except` で失敗時にスキップ可能にすることも容易 |
| **互換性** | 簡潔だが拡張子処理と透過対応に弱い | より汎用性・安全性が高い |

---

## Mistral生成コード
```python
import os
from PIL import Image

folder_path = "/path/to/your/folder"

for filename in os.listdir(folder_path):
    if filename.endswith(".png"):
        file_path = folder_path + "/" + filename
        img = Image.open(file_path)
        output_filename = file_path.replace(".png", ".jpeg")
        img.save(output_filename)
```

---

## ChatGPT生成コード（改善版）
```python
from PIL import Image
import os

# 変換元のフォルダパス
input_folder = r"C:\path\to\input"   # ここを変更
# 変換後の保存フォルダ
output_folder = r"C:\path\to\output" # ここを変更

# 出力先フォルダがなければ作成
os.makedirs(output_folder, exist_ok=True)

for filename in os.listdir(input_folder):
    if filename.lower().endswith(".png"):
        # 入力ファイルパス
        input_path = os.path.join(input_folder, filename)
        # 出力ファイルパス（拡張子をjpgに変更）
        output_path = os.path.join(output_folder, os.path.splitext(filename)[0] + ".jpg")

        # 画像を開いて変換
        with Image.open(input_path) as img:
            # RGBAの場合はRGBに変換
            if img.mode in ("RGBA", "P"):
                img = img.convert("RGB")
            img.save(output_path, "JPEG", quality=95)

print("変換が完了しました！")

```

---

### まとめ
- **Mistral** → シンプルで短い。Pythonの初学者でもわかりやすいが、OS依存や透過PNG対応が弱い  
- **ChatGPT** → 少し長くなるが、実運用でのエラーや環境依存を減らす工夫が多い
