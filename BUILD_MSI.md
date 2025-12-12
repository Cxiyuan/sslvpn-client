# Windows MSI 打包说明

## 前提条件
需要安装 WiX Toolset 3.11 或更高版本
- 下载地址: https://wixtoolset.org/releases/

## 构建 MSI 安装包

### 1. 在 Windows 上使用 CMake 构建项目

```bash
mkdir build
cd build
cmake -G "MinGW Makefiles" ..
cmake --build .
```

### 2. 生成 MSI 安装包

```bash
cpack -G WIX
```

## MSI 安装包特性

- **默认安装路径**: C:\Program Files\aVPN
- **标准 MSI 格式**: Windows Installer 标准格式
- **程序图标一致**: 安装界面和桌面图标使用统一的程序图标
- **开始菜单快捷方式**: 在开始菜单创建 aVPN 程序组
- **支持升级和修复**: 标准 MSI 特性
- **企业部署友好**: 支持 GPO 和静默安装
- **优化加载速度**: 跳过验证优化安装体验

## 优化说明

已针对 MSI 安装包进行以下优化：
- 使用 WixUI_Minimal 简化界面，减少加载时间
- 跳过内部验证（-sval），加快打包和安装速度
- 统一使用程序 .ico 图标，保持界面一致性

## 安装方式

直接双击 MSI 文件即可安装，或使用命令行：

```cmd
msiexec /i aVPN-1.5.3-win64.msi
```

## 完全静默安装（后台安装，无界面）

```cmd
msiexec /i aVPN-1.5.3-win64.msi /quiet /qn
```

## 被动安装（仅显示进度条，无用户交互）

```cmd
msiexec /i aVPN-1.5.3-win64.msi /passive
```

## 自定义安装路径

默认路径为 C:\Program Files\aVPN，如需安装到指定路径：

```cmd
msiexec /i aVPN-1.5.3-win64.msi INSTALL_ROOT="D:\MyPrograms\aVPN"
```