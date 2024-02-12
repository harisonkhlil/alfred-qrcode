# 先识别系统,然后设定 PATH, m1 mac 与 intel mac 的 zbarimg 路径不同

if [[ $(uname -m) == "arm64" ]]; then
  PATH="/opt/homebrew/bin:$PATH"
else
  PATH="/usr/local/bin:$PATH"
fi

screencapture -i "$HOME/qrimg.png"

# 检测 是否有 qrimg.png 文件
if [ ! -f "$HOME/qrimg.png" ]; then
  exit 1
else
  zbarimg "$HOME/qrimg.png" | sed -e 's/scanned.*//g' -e 's/QR-Code://g' | pbcopy
  rm "$HOME/qrimg.png"
fi

