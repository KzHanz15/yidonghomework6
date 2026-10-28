import 'package:flutter/material.dart';

/// 实践任务2：弹性分配实验
/// 三栏 2:1:1 布局 + 一栏内容超长时的表现记录
class ExpandedPage extends StatelessWidget {
  const ExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('弹性分配 · Expanded'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExpanded211(),
          const SizedBox(height: 16),
          _buildExpandedShortDemo(),
          const SizedBox(height: 16),
          _buildOverflowWarning(),
        ],
      ),
    );
  }

  // Expanded flex 2:1:1 三栏布局
  Widget _buildExpanded211() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('三栏 2:1:1 比例布局',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              height: 60,
              color: Colors.grey[200],
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      child: const Center(
                        child: Text('flex:2',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      child: const Center(
                        child: Text('flex:1',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      child: const Center(
                        child: Text('flex:1',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[100],
              child: const Text('宽度比例 = flex/(flex总和) → 2/4 = 50%, 1/4 = 25%, 1/4 = 25%',
                  style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
            ),
          ],
        ),
      ),
    );
  }

  // Column 骨架：Header + Expanded(body) + BottomBar
  Widget _buildExpandedShortDemo() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('经典骨架：Header + Expanded + BottomBar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Container(
              height: 200,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Container(
                    height: 40,
                    color: Colors.blue,
                    child: const Center(child: Text('Header', style: TextStyle(color: Colors.white))),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      child: const Center(child: Text('Expanded(body)\n吃掉剩余高度')),
                    ),
                  ),
                  Container(
                    height: 40,
                    color: Colors.green,
                    child: const Center(child: Text('BottomBar', style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 故意去掉 Expanded → 观察溢出
  Widget _buildOverflowWarning() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('⚠️ 故意实验：去掉 Expanded',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red)),
            const SizedBox(height: 8),
            const Text('如果把统计条三个数字块外的 Expanded 去掉，\nRow 里的 Text 会挤成一团甚至溢出 RenderFlex!'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.amber.withOpacity(0.3),
              child: const Text(
                '约束规则：\n• 父给约束 → 子报尺寸 → 父定位置\n• Row 里的 Text 自身尺寸小，没 Expanded 就不会拉伸\n• 撑不满要 Expanded 或 width: double.infinity',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
