# V4L2
[Documentation](https://www.kernel.org/doc/html/v4.9/media/index.html)
## Install 
Ubuntu / Raspberry Pi X 
``` bash
sudo apt install -y v4l-utils
```
## デバイスリスト
``` bash
v4l2-ctl --list-devices
```
## 解像度情報取得
``` bash
v4l2-ctl --list-formats-ext
```
## デバイス指定解像度情報取得
``` bash
v4l2-ctl --device /dev/video0 --list-formats-ext
```
## デバイス指定全情報取得
``` bash
v4l2-ctl --device /dev/video0 --all
```
## v4l2loopback-dkms 仮想デバイス作成 同時接続
Install Debian系 ([source install Github](https://github.com/umlaeute/v4l2loopback))
``` bash
sudo apt install -y v4l2loopback-dkms
```
仮想ビデオデバイス作成
``` bash
sudo modprobe v4l2loopback devices=[index]
```
indexに整数を指定することで指定分の「/dev/video[index]」仮想ファイル数が作成される
``` bash
sudo modprobe v4l2loopback devices=2
```
作成の確認
``` bash
v4l2-ctl --list-devices
```
out:  
Dummy video device (0x0000) (platform:v4l2loopback-000):  
	/dev/video2

Dummy video device (0x0001) (platform:v4l2loopback-001):  
	/dev/video3

個数の変更の場合には，一度アンロードを行いその後，個数を指定
``` bash
sudo modprobe -r v4l2loopback
```
デバイスを4つ作成
``` bash
sudo modprobe v4l2loopback devices=4
```
指定した番号でデバイスの作成 (例: /dev/video10,/dev/video20,/dev/video30)
``` bash
sudo modprobe v4l2loopback video_nr=10,20,30
```
## 仮想デバイスに映像を流す
ffmpegをインストールすること
``` bash
ffmpeg                                      \
  -f video4linux2 -i /dev/video0            \
  -f video4linux2 -vcodec copy /dev/video10 \
  -f video4linux2 -vcodec copy /dev/video20 \
  -f video4linux2 -vcodec copy /dev/video30
```
フォーマット，フレームレート，解像度の指定
``` bash
ffmpeg                                      \
  -f video4linux2                           \
  -input_format mjpeg                       \
  -video_size 1280x720                      \
  -framerate 30                             \
  -i /dev/video0                            \
  -f video4linux2 -vcodec copy /dev/video10 \
  -f video4linux2 -vcodec copy /dev/video20 \
  -f video4linux2 -vcodec copy /dev/video30
```
## ラベル指定仮想デバイス作成
``` bash
sudo modprobe v4l2loopback video_nr=10,20,30 card_label="device number 10","device number 20","device number 30"
```

## ブラウザ上でカメラを使用する際でエラーとなった場合
``` bash
sudo modprobe v4l2loopback exclusive_caps=1
```

## FPS 