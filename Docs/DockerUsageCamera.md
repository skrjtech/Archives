# Docker File
```Dockerfile
# image
FROM debian:latest
# init process
RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -y upgrade
# importante package
RUN apt install -y software-properties-common
RUN apt install -y sudo git fonts-takao ffmpeg wget v4l-utils
# python 
RUN apt install -y python3-pip 
RUN apt install -y build-essential libssl-dev libffi-dev python3-dev
# これ入れないとopencvが正常に作動しない
RUN apt install -y libgl1-mesa-dev
# pip update
RUN python3 -m pip install --upgrade pip setuptools
# 画像処理機能
RUN python3 -m pip install opencv-python opencv-contrib-python
# 進行状況可視化
RUN python3 -m pip install tqdm
RUN python3 -m pip install jupyterlab
RUN python3 -m pip install selenium webdriver-manager beautifulsoup4
#pyautogui
RUN python3 -m pip install pyautogui python-xlib
RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-tk tk-dev

CMD [ "/bin/bash" ]
```

# Docker Compose YML
```docker-compose.yml
version: '3.9'
services:
  opencamera:
    build: .
    image: opencamera:latest
    container_name: opencamera_con
    tty: true
    restart: always
    devices:
      - /dev/video0:/dev/video0
      - /dev/video1:/dev/video1
```

# Python Script
```python
import cv2

# カメラの読込み
# 内蔵カメラがある場合、下記引数の数字を変更する必要あり
cap = cv2.VideoCapture(0)
# 動画終了まで、1フレームずつ読み込んで表示する。
while(cap.isOpened()):
    # 1フレーム毎　読込み
    ret, frame = cap.read()
    frame = cv2.resize(frame, (640, 480))
    # GUIに表示
    cv2.imshow("Open Camera", frame)
    # qキーが押されたら途中終了
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
# 終了処理
cap.release()
cv2.destroyAllWindows()
```