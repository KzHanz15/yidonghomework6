import 'package:flutter/material.dart';

/// 实践任务4：容器美化
/// 圆角/阴影/剪裁：卡片套路 + ClipRRect + ClipOval
class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('容器美化 · 圆角/阴影/剪裁'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCardRounded(),
          const SizedBox(height: 16),
          _buildCardWithShadow(),
          const SizedBox(height: 16),
          _buildClipRRectExample(),
          const SizedBox(height: 16),
          _buildClipOvalExample(),
        ],
      ),
    );
  }

  // ===== 卡片套路1：圆角容器美化 =====
  Widget _buildCardRounded() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.pink.shade200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('卡片套路1：圆角 Container',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.pink,
                child: Icon(Icons.person, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('张三', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('3 分钟前', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(height: 12),
          Text('这是一条动态内容，可以在这里写很长的文字描述...',
              style: TextStyle(color: Colors.grey[800])),
        ],
      ),
    );
  }

  // ===== 卡片套路2：阴影 + 圆角 =====
  Widget _buildCardWithShadow() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('卡片套路2：阴影 + 圆角',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetric(Icons.trending_up, '营收', '¥128,430', Colors.green),
              _buildMetric(Icons.shopping_cart, '订单', '1,284', Colors.blue),
              _buildMetric(Icons.person, '用户', '2,430', Colors.purple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  // ===== ClipRRect：圆角剪裁 =====
  Widget _buildClipRRectExample() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ClipRRect 圆角剪裁',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange, Colors.red],
                    ),
                  ),
                  child: const Center(child: Text('RRect', style: TextStyle(color: Colors.white))),
                ),
              ),
              const SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.cyan, Colors.blue],
                    ),
                  ),
                  child: const Center(child: Text('big R', style: TextStyle(color: Colors.white))),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('ClipRRect(borderRadius: Radius.circular(12))',
              style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
        ],
      ),
    );
  }

  // ===== ClipOval：圆形剪裁 =====
  Widget _buildClipOvalExample() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ClipOval 圆形剪裁',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            children: [
              ClipOval(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.purple],
                    ),
                  ),
                  child: const Center(child: Text('Oval', style: TextStyle(color: Colors.white))),
                ),
              ),
              const SizedBox(width: 16),
              ClipOval(
                child: Container(
                  width: 70,
                  height: 90,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.amber, Colors.deepOrange],
                    ),
                  ),
                  child: const Center(child: Text('Oval\n非正方', style: TextStyle(color: Colors.white, fontSize: 11))),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('ClipOval：圆形剪裁（长宽相等→圆，不等→椭圆）',
              style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
        ],
      ),
    );
  }
}
