import 'package:flutter/material.dart';

/// 实践任务1：对齐任务卡
/// 六种对齐场景逐一实现并标注参数
class AlignmentPage extends StatelessWidget {
  const AlignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('对齐任务卡 · 六种场景'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAlignmentCard(
            title: '场景1：主轴 start + 交叉轴 center',
            row: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _coloredBoxes([Colors.red, Colors.blue, Colors.green]),
            ),
            params: 'mainAxisAlignment: start, crossAxisAlignment: center',
          ),
          const SizedBox(height: 12),
          _buildAlignmentCard(
            title: '场景2：主轴 center + 交叉轴 center',
            row: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _coloredBoxes([Colors.red, Colors.blue, Colors.green]),
            ),
            params: 'mainAxisAlignment: center, crossAxisAlignment: center',
          ),
          const SizedBox(height: 12),
          _buildAlignmentCard(
            title: '场景3：主轴 end + 交叉轴 center',
            row: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _coloredBoxes([Colors.red, Colors.blue, Colors.green]),
            ),
            params: 'mainAxisAlignment: end, crossAxisAlignment: center',
          ),
          const SizedBox(height: 12),
          _buildAlignmentCard(
            title: '场景4：主轴 spaceBetween + 交叉轴 start',
            row: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _coloredBoxes([Colors.red, Colors.blue, Colors.green]),
            ),
            params: 'mainAxisAlignment: spaceBetween, crossAxisAlignment: start',
          ),
          const SizedBox(height: 12),
          _buildAlignmentCard(
            title: '场景5：主轴 spaceAround + 交叉轴 end',
            row: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _coloredBoxes([Colors.red, Colors.blue, Colors.green]),
            ),
            params: 'mainAxisAlignment: spaceAround, crossAxisAlignment: end',
          ),
          const SizedBox(height: 12),
          _buildAlignmentCard(
            title: '场景6：主轴 spaceEvenly + 交叉轴 stretch',
            row: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _coloredBoxes([Colors.red, Colors.blue, Colors.green]),
            ),
            params: 'mainAxisAlignment: spaceEvenly, crossAxisAlignment: stretch',
          ),
          const SizedBox(height: 20),
          _buildColumnExample(),
        ],
      ),
    );
  }

  List<Widget> _coloredBoxes(List<Color> colors) {
    const heights = [30.0, 50.0, 40.0];
    return List.generate(colors.length, (i) {
      return Container(
        width: 50,
        height: heights[i],
        color: colors[i],
        child: Center(
          child: Text(
            '${i + 1}',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
  }

  Widget _buildAlignmentCard({
    required String title,
    required Row row,
    required String params,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 80,
              color: Colors.grey[200],
              child: SizedBox.expand(child: row),
            ),
            const SizedBox(height: 4),
            Text(params,
                style: const TextStyle(fontSize: 11, color: Colors.blueAccent, fontFamily: 'monospace')),
          ],
        ),
      ),
    );
  }

  // ===== Column 对齐示例 =====
  Widget _buildColumnExample() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('补充：Column 对齐（center + center）',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 150,
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: 60, height: 30, color: Colors.orange, child: const Text('A', textAlign: TextAlign.center)),
                  const SizedBox(height: 8),
                  Container(width: 80, height: 30, color: Colors.purple, child: const Text('B', textAlign: TextAlign.center)),
                  const SizedBox(height: 8),
                  Container(width: 50, height: 30, color: Colors.teal, child: const Text('C', textAlign: TextAlign.center)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
