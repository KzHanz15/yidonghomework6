import 'package:flutter/material.dart';

/// 实践任务3：层叠角标
/// Stack + Positioned：头像徽标 + 图片浮层文字
class StackBadgePage extends StatelessWidget {
  const StackBadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('层叠角标 · Stack'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAvatarBadge(),
          const SizedBox(height: 16),
          _buildImageOverlay(),
          const SizedBox(height: 16),
          _buildCardBadge(),
        ],
      ),
    );
  }

  // 场景1：头像右下角在线徽标
  Widget _buildAvatarBadge() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('场景1：头像徽标', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            // Stack: 非 Positioned 子项按 alignment 对齐, Positioned 不参与尺寸
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.purpleAccent,
                  child: Icon(Icons.person, size: 45, color: Colors.white),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Positioned(right:0, bottom:0)\n非 Positioned 按 Stack.alignment(center) 对齐',
                style: TextStyle(fontSize: 12, color: Colors.blueAccent), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  // 场景2：图片上浮层文字
  Widget _buildImageOverlay() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('场景2：图片浮层文字', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            // Stack + Positioned 浮层
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Stack(
                children: [
                  // 底层：容器模拟图片 (使用渐变色代替网络图片)
                  SizedBox.expand(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  // 浮层：左上角标签
                  Positioned(
                    left: 12,
                    top: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('🔥 热门',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                  // 浮层：底部渐变遮罩 + 文字
                  Positioned(
                    left: 0, right: 0, bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87],
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Flutter 3.0 正式发布',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(height: 2),
                          Text('全新渲染引擎 Impeller · 性能大幅提升',
                              style: TextStyle(color: Colors.white70, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 场景3：未读消息角标
  Widget _buildCardBadge() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('场景3：未读消息角标', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.email, size: 64, color: Colors.grey[700]),
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('5',
                        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Positioned(top:-4, right:-4)\nclipBehavior: Clip.none 允许超出边界',
                style: TextStyle(fontSize: 12, color: Colors.blueAccent), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
