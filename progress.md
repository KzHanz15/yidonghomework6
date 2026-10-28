# 进度报告6（第8周·基础组件与布局系统）

**使用方式：** 在模板上作答，作答完成后将全文复制到雨课堂答题区，并将同一内容存入仓库 `lecture6/progress.md`。

---

## 一、任务理解

**本次作业要完成的内容：**
1. **案例复现 profile_card：** 按实践指南分三步完成个人名片页 — (1) 骨架与对齐：Scaffold + Column，头像区 CircleAvatar、姓名与签名、统计条（三个 Expanded 数字块）、标签云（Wrap）；(2) 容器美化：给统计条与整体加 Container 装饰（圆角、阴影、留白），头像右下角加 Stack+Positioned 徽标（在线状态点）；(3) 设计稿对照验收，无 RenderFlex 溢出警告。
2. **自主实践基本要求：** (1) 对齐任务卡（六种对齐场景逐一实现）；(2) 弹性分配实验（Expanded 2:1:1 三栏布局）；(3) 层叠角标（Stack+Positioned 头像徽标 + 图片浮层文字）；(4) 容器美化（圆角/阴影/剪裁卡片至少两处）；(5) AI 使用标注。
3. **独立研究任务（选做）：** 约束传递实验、FittedBox 缩放策略、自定义剪裁形状。（本课重点完成必做部分）

**验收标准：**
- profile_card 与设计稿一致；运行无 RenderFlex 溢出黄黑警告
- 代码按步骤 Git 提交（≥3 次）
- 进度报告按十节模板填写完整
- 仓库 `lecture6` 独立项目仓库含 README
- AI 使用记录真实可追溯

---

## 二、环境与工具

- **操作系统：** Windows 11
- **Flutter SDK：** C:\src\flutter（stable channel）
- **Dart SDK：** 随 Flutter 附带
- **Git：** 2.55.0.windows.5
- **IDE：** VS Code + Flutter 插件 / Trae AI 编码助手
- **运行目标：** flutter run -d windows（桌面应用）/ Chrome Web
- **AI 工具：** Trae AI 编码助手，用于代码生成、代码审查、错误定位；所有 AI 生成内容均经 flutter analyze 与运行验证

**flutter doctor 摘要：** Flutter / Android toolchain / Chrome / 桌面设备均正常 ✓

---

## 三、过程记录

**按时间线记录主要操作步骤：**

1. **创建工程：** `flutter create lecture6 --org com.example`，生成标准 Flutter 工程骨架；`flutter pub get` 安装依赖；git init + 首次提交。
2. **搭建 HomePage 骨架：** main.dart + HomePage，List 五个入口（案例复现 + 四个实践任务）；每入口一个独立 Page 类；Navigator.push 跳转。git commit -m "feat: home page with 5 navigation entries"
3. **案例复现 ProfileCard（步骤一·骨架与对齐）：** profile_card_page.dart — Column 骨架（CircleAvatar + 姓名签名 Text + Row 统计条 + Wrap 标签云）；统计条用三个 Expanded；头像用 CircleAvatar；标签云用 Wrap(spacing: 8, runSpacing: 8)。git commit -m "feat: profile_card skeleton with alignment"
4. **案例复现 ProfileCard（步骤二·容器美化）：** 整体 Container 装饰：borderRadius.circular(16)、boxShadow（blurRadius: 12, offset: 0,4）、padding；统计条 Container 背景灰 + borderRadius；头像 Stack+Positioned（right:0, bottom:0, 绿色在线状态点）；clipBehavior: Clip.none 允许徽标超出边界。git commit -m "feat: profile_card decoration & status badge"
5. **案例复现 ProfileCard（步骤三·设计稿对照）：** 打开页面核对间距、配色；故意移除 Expanded 观察 Row 里 Text 挤成一团/溢出，再加回来；验证无黄黑 RenderFlex 警告 ✓。git commit -m "feat: match design spec, zero overflow warnings"
6. **自主实践 - 对齐任务卡：** alignment_page.dart — 六种 Row 对齐场景（start/center/end/spaceBetween/spaceAround/spaceEvenly 搭配不同 crossAxisAlignment）+ 一种 Column 对齐示例；每个场景 Card 包 Container(grey[200]) 可视化对齐效果 + 标注参数。git commit -m "feat: alignment task card (6 scenarios)"
7. **自主实践 - 弹性分配实验：** expanded_page.dart — 三栏 flex 2:1:1；经典骨架（Header + Expanded(body) + BottomBar）；故意去掉 Expanded 展示约束规则。git commit -m "feat: expanded flex ratio 2:1:1 layout"
8. **自主实践 - 层叠角标：** stack_badge_page.dart — 三个场景：(1) 头像右下角绿色在线徽标 Positioned(right:0, bottom:0)；(2) 图片浮层文字 Positioned(left/right/top/bottom) + 底部渐变遮罩；(3) 未读消息角标 Positioned(top:-4, right:-4, clipBehavior: Clip.none)。git commit -m "feat: stack + positioned badges and overlays"
9. **自主实践 - 容器美化：** container_page.dart — 四种卡片：圆角 Container、阴影+圆角、ClipRRect(borderRadius: 12/20) 不同半径对比、ClipOval（正方→圆，长方→椭圆）；卡片套路 Container(padding+decoration[color+borderRadius+boxShadow]) 至少两处应用。git commit -m "feat: container beautification (radius/shadow/clip)"
10. **最终验证：** flutter analyze 无警告/错误 ✓；flutter run -d windows 正常启动，五个页面均可访问；截图留证。git commit -m "docs: progress report readme + final verify"

---

## 四、关键代码

粘贴 1-3 段关键代码并逐行解释。

### 4.1 卡片套路：Container 装饰 + Row + Expanded

```dart
Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 12,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Row(
    children: [
      _buildStatItem('128', '项目'),
      Container(width: 1, height: 40, color: Colors.grey[300]),
      _buildStatItem('2.4k', '粉丝'),
      Container(width: 1, height: 40, color: Colors.grey[300]),
      _buildStatItem('86', '关注'),
    ],
  ),
)
```

**逐行解释：**
- `padding: EdgeInsets.all(20)`：留白内边距，卡片套路必备
- `decoration`：Container 装饰器；color、borderRadius、boxShadow 三合一
- `borderRadius.circular(16)`：统一圆角，值越大卡片越圆润
- `boxShadow`：阴影列表，可写多个；blurRadius 模糊程度，offset 阴影偏移
- ⚠️ 注意：color 放进 decoration 里，Container 顶层不能同时设置 color 和 decoration（编译报错！）
- `Row` + `_buildStatItem` 内部用 Expanded → 三栏自动等分剩余空间

**验证方式：** flutter run 打开 Profile Card 页面，统计条三栏等宽显示，无溢出警告。

### 4.2 Stack + Positioned：头像右下角徽标

```dart
Stack(
  clipBehavior: Clip.none,
  alignment: Alignment.center,
  children: [
    const CircleAvatar(
      radius: 48,
      backgroundColor: Colors.blueAccent,
      child: Icon(Icons.person, size: 48, color: Colors.white),
    ),
    Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
        ),
      ),
    ),
  ],
)
```

**逐行解释：**
- `Stack(clipBehavior: Clip.none)`：允许子组件超出 Stack 边界；默认 Clip.hardEdge 会裁掉徽标
- `alignment: Alignment.center`：Stack 内非 Positioned 子项（CircleAvatar）居中对齐
- `Positioned(right: 0, bottom: 0)`：相对于 Stack 定位右下角；Positioned 子项不参与 Stack 尺寸计算
- `Container(width:18, height:18, shape: BoxShape.circle)`：圆形徽标（shape 或 borderRadius.circular 都可）
- `border: Border.all(color: Colors.white, width: 3)`：白色描边让徽标从头像上"跳出来"

**验证方式：** 运行后头像右下角绿色圆点清晰可见，点击进入子页面也可看到其他 Stack 示例。

### 4.3 Expanded flex 2:1:1 弹性分配

```dart
Row(
  children: [
    Expanded(
      flex: 2,
      child: Container(
        color: Colors.red,
        child: Center(child: Text('flex:2')),
      ),
    ),
    Expanded(
      flex: 1,
      child: Container(color: Colors.blue, child: Center(child: Text('flex:1'))),
    ),
    Expanded(
      flex: 1,
      child: Container(color: Colors.green, child: Center(child: Text('flex:1'))),
    ),
  ],
)
```

**逐行解释：**
- `Expanded` = Flexible(flex: n, fit: FlexFit.tight)，强制子填满剩余空间
- `flex: 2` 的红色块宽度 = 总剩余宽度 × (2 / (2+1+1)) = 50%
- 两个 flex:1 各占 25%
- 去掉 Expanded → Row 只给 Text 自身尺寸 → 不拉伸、可能溢出（约束三句话验证）

**验证方式：** 运行后红色块宽度明显是蓝/绿的两倍；Expanded 缺失实验卡展示了无 Expanded 的后果。

---

## 五、检查点结果

### 检查点 1：profile_card 与设计稿一致

**验证项：**
- ✅ 骨架：CircleAvatar + 姓名签名两行 + 统计条三栏 + Wrap 标签云
- ✅ Container 装饰：borderRadius.circular(16)、boxShadow、padding 留白
- ✅ Stack+Positioned：头像右下角绿色在线状态徽标
- ✅ Wrap：spacing:8, runSpacing:8 标签云
- ✅ 配色协调、间距合理

### 检查点 2：无 RenderFlex 溢出警告

**验证方式：**
- flutter run 启动应用 → 未出现黄色黑条 RenderFlex overflow
- Widget Inspector 检查各 Row/Column 子项尺寸均在约束内
- **故意实验验证约束规则：** 移除统计条 Expanded → Row 内 Text 挤到一起；加回 Expanded → 恢复等分

### 检查点 3：Git 提交规范（≥3 次）

```
docs: progress report readme + final verify
feat: container beautification (radius/shadow/clip)
feat: stack + positioned badges and overlays
feat: expanded flex ratio 2:1:1 layout
feat: alignment task card (6 scenarios)
feat: match design spec, zero overflow warnings
feat: profile_card decoration & status badge
feat: profile_card skeleton with alignment
feat: home page with 5 navigation entries
init: flutter create lecture6
```

**共 9 次有效提交（含 1 次 init），message 规范化。**

---

## 六、问题与调试

### 问题 1：Stack 徽标被裁掉

**现象：** 头像右下角的在线状态徽标（Positioned right:0, bottom:0）只显示一半，另一半"被切掉"。

**定位过程：**
- 查 Stack 默认 clipBehavior → 默认 Clip.hardEdge，子组件超出 Stack 边界会被裁掉
- 本项目徽标用 Positioned(right:0, bottom:0)，徽标有 width:18、height:18，一半在 Stack 外部（负数位置或边界外）
- Stack 尺寸由 CircleAvatar（radius:48）决定，Positioned 不参与尺寸计算

**解决方案：** 在 Stack 上设置 `clipBehavior: Clip.none`

**验证：** 重新运行 → 徽标完整显示 ✓

---

### 问题 2：Container 同时设置 color 和 decoration 编译错误

**现象：** 课堂案例复现之初，写了：
```dart
Container(
  color: Colors.white,
  decoration: BoxDecoration(...),  // ❌ ERROR
)
```
编译报错："Cannot provide both a color and a decoration"

**定位：** Flutter Container 文档明确规定 color 和 decoration 互斥，因为 decoration 内部也可以设置 color（decoration: BoxDecoration(color: Colors.white)）。

**解决方案：** 把 color 移到 BoxDecoration 里：
```dart
Container(
  decoration: BoxDecoration(color: Colors.white, borderRadius: ...),
)
```

**验证：** flutter analyze 通过 ✓

---

## 七、AI 使用记录

| 用途 | 指令摘要 | AI 输出 | 本人验证方式 |
|------|----------|---------|-------------|
| HomePage 脚手架 | 创建 Flutter 应用骨架 + 五个导航入口 | main.dart + HomePage + List 导航 | flutter run 页面正常渲染 |
| Profile Card 骨架 | 按指南写 CircleAvatar + 姓名 + Expanded 统计 + Wrap 标签云 | profile_card_page.dart 初始版本 | 运行后对比指南结构一致 |
| Container 装饰 | 加 borderRadius + boxShadow 卡片套路 | Container + BoxDecoration 完整代码 | 对比截图视觉效果；无 color+decoration 冲突 |
| Stack+Positioned | 头像右下角徽标，带 clipBehavior | Stack(clipBehavior: Clip.none) + Positioned | 运行验证徽标不被裁 |
| Expanded 弹性布局 | 三栏 2:1:1 + 经典骨架 + 故意实验 | expanded_page.dart 完整实现 | 运行宽度比例目测 50%/25%/25% |
| 六种对齐场景 | mainAxisAlignment 六种 + crossAxisAlignment 三种组合 | alignment_page.dart 六个 Card | 运行对比参数标注 |
| 层叠角标三场景 | 头像徽标 + 图片浮层 + 未读角标 | stack_badge_page.dart 三个场景 | clipBehavior 验证 + Positioned 位置验证 |
| 容器美化四种 | 圆角 + 阴影 + ClipRRect + ClipOval | container_page.dart 四个卡片 | 运行效果对比 |
| 错误修复 | Stack clipBehavior / color+decoration 冲突定位与修复 | 正确代码片段 | flutter analyze + run 验证 |

**所有 AI 生成代码均经 flutter analyze 与 flutter run 验证后才提交。**

---

## 八、证据（截图/控制台输出/Git 记录）

（在提交前补充截图，每图配一句话说明）

- **截图1：** flutter analyze 输出 —— 无 warning 无 error ✓
- **截图2：** Profile Card 页面 —— 头像/姓名/统计条/标签云 + 右下绿色徽标
- **截图3：** 对齐任务卡页面 —— 六种场景 Card 展示
- **截图4：** 弹性分配页面 —— flex 2:1:1 红/蓝/绿三栏
- **截图5：** 层叠角标页面 —— 头像徽标/浮层文字/未读角标
- **截图6：** 容器美化页面 —— 圆角/阴影/ClipRRect/ClipOval
- **截图7：** git log --oneline 记录（见第五节）

---

## 九、自评

| 检查项 | 状态 | 说明 |
|--------|------|------|
| 案例复现 profile_card | ✅ | 骨架+对齐+美化+徽标+Wrap 全部到位 |
| 检查点：与设计稿一致 | ✅ | Container 装饰完整，Stack+Positioned 徽标正常 |
| 检查点：无 RenderFlex 溢出 | ✅ | 已验证，故意移除 Expanded 会溢出，加回正常 |
| 检查点：Git ≥3 次提交 | ✅ | 9 次提交，message 规范 |
| 实践1：对齐任务卡 (6场景) | ✅ | 六种 mainAxisAlignment × crossAxisAlignment 可视化 + 参数标注 |
| 实践2：Expanded 2:1:1 | ✅ | flex 2:1:1 + 经典骨架 + 故意实验 |
| 实践3：Stack + Positioned | ✅ | 三场景：头像徽标/浮层文字/未读角标 |
| 实践4：Container 美化 | ✅ | 圆角/阴影/ClipRRect/ClipOval 四种卡片 |
| 实践5：AI 使用标注 | ✅ | 第七节完整使用记录表 |
| 进度报告十节 | ✅ | 模板完整填写 |

---

## 十、心得与总结

**本课收获：**
- 约束三句话（父给约束→子报尺寸→父定位置）是 Flutter 布局的核心原理，能解释"撑不满"和"溢出"两类高频现象
- Row/Column 的 Expanded 是撑满剩余空间的刚需，Stack 里的 Positioned 不参与尺寸计算是关键区别
- 卡片套路（Container + padding + BoxDecoration(color + borderRadius + boxShadow)）背下来直接用
- Container 同时设 color 和 decoration 会编译报错 —— 这是本课第一个真实编译错误，印象深刻
- Stack 默认会裁掉超出边界的 Positioned 子项，需手动加 clipBehavior: Clip.none

**待深入：**
- FittedBox 的缩放策略（contain/fill/scaleDown）可在独立研究中继续探索
- 自定义 ClipPath 异形卡片头图是本课选做但很有意思的方向
- Expanded 与 Flexible 的区别（fit: FlexFit.loose vs tight）在内容不足时行为不同
