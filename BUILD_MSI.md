# Windows EXE 安装包打包说明

## 前提条件
需要安装 NSIS (Nullsoft Scriptable Install System)

## 构建 EXE 安装包

### 1. 在 Windows 上使用 CMake 构建项目

```bash
mkdir build
cd build
cmake -G "MinGW Makefiles" ..
cmake --build .
```

### 2. 生成 EXE 安装包

```bash
cpack -G NSIS
```

## EXE 安装包特性

- **默认安装路径**: C:\Program Files\aVPN
- **自动创建桌面快捷方式**: 安装时自动创建桌面图标
- **开始菜单快捷方式**: 在开始菜单创建 aVPN 程序组
- **显示安装进度**: 显示安装进度条
- **简单易用**: 双击即可安装，无需复杂配置

## 安装方式

直接双击 EXE 安装包文件即可安装：

```cmd
aVPN-1.5.3-win64.exe
```

## 静默安装（无界面）

```cmd
aVPN-1.5.3-win64.exe /S
```

## 自定义安装路径

静默安装到指定路径：

```cmd
aVPN-1.5.3-win64.exe /S /D=D:\MyPrograms\aVPN
```

注意：`/D` 参数必须是最后一个参数。