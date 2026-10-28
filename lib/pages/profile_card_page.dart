import 'package:flutter/material.dart';

/// 课堂案例复现：Profile Card 个人名片页
/// 步骤一：骨架与对齐 → 步骤二：容器美化 → 步骤三：设计稿对照
class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card · 个人名片'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // ===== 名片主体 =====
            _buildProfileCard(),
            const SizedBox(height: 20),
            // ===== 骨架对照说明 =====
            _buildStructureGuide(),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // 名片主体：CircleAvatar + 姓名签名 + 统计条(Expanded) + 标签云(Wrap)
  // ============================================================
  Widget _buildProfileCard() {
    return Container(
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // --- 头像区 (Stack + Positioned 徽标) ---
          _buildAvatarWithBadge(),
          const SizedBox(height: 16),
          // --- 姓名与签名 ---
          const Text(
            '李小明',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Flutter 开发者 · 开源爱好者',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 20),
          // --- 统计条 (三个 Expanded 数字块) ---
          _buildStatsRow(),
          const SizedBox(height: 20),
          // --- 标签云 (Wrap) ---
          _buildTagCloud(),
        ],
      ),
    );
  }

  // Stack + Positioned：头像右下角在线状态徽标
  Widget _buildAvatarWithBadge() {
    return Stack(
      clipBehavior: Clip.none,
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
    );
  }

  // 统计条：Row + 三个 Expanded (flex default 1:1:1)
  Widget _buildStatsRow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
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
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  // 标签云：Wrap
  Widget _buildTagCloud() {
    const tags = ['Flutter', 'Dart', 'React', 'Node.js', 'Python', 'Go'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: tags.map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue.withOpacity(0.3)),
          ),
          child: Text(
            tag,
            style: const TextStyle(fontSize: 12, color: Colors.blue),
          ),
        );
      }).toList(),
    );
  }

  // 骨架对照说明
  Widget _buildStructureGuide() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '💡 骨架说明',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('• Stack + Positioned：头像右下角绿色在线徽标'),
          Text('• Row + Expanded：三栏统计数字自动等分剩余空间'),
          Text('• Wrap：标签云自动换行，spacing/runSpacing 控制间距'),
          Text('• 无黄色黑条 RenderFlex 溢出警告 ✓'),
        ],
      ),
    );
  }
}
