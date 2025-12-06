# aVPN - VPN 客户端

基于 OpenConnect 的 VPN 客户端，支持 Cisco AnyConnect 协议。

## 功能特性

- 支持 Cisco AnyConnect/OpenConnect 协议
- 跨平台支持（Windows、Linux、macOS）
- 完整的中文界面
- 自动跳过证书验证
- 简洁易用的图形界面

## 系统要求

### Windows
- Windows 7 或更高版本
- Qt 5.15.2 或更高版本

### Linux
- Ubuntu 18.04 或更高版本
- Qt5 开发库
- OpenConnect 库

### macOS
- macOS 10.12 或更高版本
- Homebrew 包管理器

## 编译说明

### Windows (MSYS2)

```bash
pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-cmake mingw-w64-x86_64-qt5 mingw-w64-x86_64-openconnect
mkdir build && cd build
cmake .. -G "MinGW Makefiles"
make
```

### Linux

```bash
sudo apt-get install qtbase5-dev libopenconnect-dev libgnutls28-dev libspdlog-dev
mkdir build && cd build
cmake ..
make
```

### macOS

```bash
brew install qt@5 openconnect gnutls spdlog
mkdir build && cd build
cmake .. -DCMAKE_PREFIX_PATH=$(brew --prefix qt@5)
make
```

## 使用说明

1. 启动 aVPN 应用程序
2. 点击"新建配置"创建 VPN 连接配置
3. 输入服务器地址、用户名等信息
4. 点击"连接"按钮建立 VPN 连接

## 开源许可

本项目基于 GPL v2 许可证开源。

## 贡献

欢迎提交 Issue 和 Pull Request。

## 致谢

- [OpenConnect](https://www.infradead.org/openconnect/) - VPN 协议实现
- [Qt](https://www.qt.io/) - 图形界面框架
