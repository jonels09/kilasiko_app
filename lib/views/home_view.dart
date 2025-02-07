import 'package:flutter/material.dart';
import 'package:kilasiko/view_models/home_viewmodel.dart';
import 'package:pdf/widgets.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().initDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenue sur Kilasiko',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Gestion des notes et des élèves',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            _buildDashboardCard(
              title: 'Tableau de bord',
              subtitle: 'Statistiques et analyses',
              color: Colors.red.shade100,

              //fullWidth: true,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildMenuCard(
                    icon: Icons.people,
                    title: 'Élèves',
                    subtitle: 'Gérer les élèves',
                    color: Colors.blue.shade100,
                  ),
                  _buildMenuCard(
                    icon: Icons.book,
                    title: 'Matières',
                    subtitle: 'Gérer les matières',
                    color: Colors.green.shade100,
                  ),
                  _buildMenuCard(
                    icon: Icons.edit_note,
                    title: 'Notes',
                    subtitle: 'Gérer les notes',
                    color: Colors.yellow.shade100,
                  ),
                  _buildMenuCard(
                    icon: Icons.assessment,
                    title: 'Bulletins',
                    subtitle: 'Générer les bulletins',
                    color: Colors.purple.shade100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    bool fullWidth = false,
  }) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required String subtitle,
    required Color color,
    //bool fullWidth = false,
  }) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
