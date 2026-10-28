import 'package:flutter/material.dart';
import 'pages/profile_card_page.dart';
import 'pages/alignment_page.dart';
import 'pages/expanded_page.dart';
import 'pages/stack_badge_page.dart';
import 'pages/container_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '课堂作业6 - 基础组件与布局系统',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/profile-card': (_) => const ProfileCardPage(),
        '/alignment': (_) => const AlignmentPage(),
        '/expanded': (_) => const ExpandedPage(),
        '/stack': (_) => const StackBadgePage(),
        '/container': (_) => const ContainerPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('课堂作业6 · 基础组件与布局系统'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMenuCard(
            context: context,
            title: '案例复现：Profile Card',
            subtitle: '个人名片页 - 骨架/对齐/容器美化',
            icon: Icons.person,
            color: Colors.blue,
            page: const ProfileCardPage(),
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context: context,
            title: '实践1：对齐任务卡',
            subtitle: '六种对齐场景逐一实现',
            icon: Icons.align_horizontal_center,
            color: Colors.green,
            page: const AlignmentPage(),
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context: context,
            title: '实践2：弹性分配实验',
            subtitle: 'Expanded 2:1:1 比例布局',
            icon: Icons.space_dashboard,
            color: Colors.orange,
            page: const ExpandedPage(),
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context: context,
            title: '实践3：层叠角标',
            subtitle: 'Stack + Positioned 头像徽标/浮层文字',
            icon: Icons.layers,
            color: Colors.purple,
            page: const StackBadgePage(),
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context: context,
            title: '实践4：容器美化',
            subtitle: '圆角/阴影/剪裁 卡片设计',
            icon: Icons.style,
            color: Colors.pink,
            page: const ContainerPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget page,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
