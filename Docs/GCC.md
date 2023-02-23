# GCC Reference
[Reference Page](https://gcc.gnu.org/onlinedocs/)

## コンパイラ判定
|コンパイラ|マクロ|定義値|備考|
|:---|:---:|:---|---|
|GCC|\_\_GNUC\_\_|Version Number||
|GCC/ARM|\_\_arm\_\_
|IAR EWARM|\_\_ICCARM\_\_
|ARM Compile|\_\_ARMCC_VERSION
|Intel Compile|\_\_INTEL_COMPILER
|Borland C++|\_\_BORLANDC\_\_
|Apple Compile|\_\_APPLE\_\_

## 実行環境判定
|実行環境|マクロ|定義値|備考|
|:---|:---:|:---|---|
|UNIX|\_\_unix\_\_|
|Linux|\_\_linux\_\_|
|Windows 32bit|_WIN32
|Windows 64bit|_WIN64
|mysys2 32bit|\_\_MINGW32\_\_
|mysys2 64bit|\_\_MINGW64\_\_
|Cygwin|\_\_CYGWIN\_\_
|macOS|\_\_MACH\_\_
|Linux/macOS 64bit|\_\_x86_64||64bit 判定

## Oprtions

-E: 