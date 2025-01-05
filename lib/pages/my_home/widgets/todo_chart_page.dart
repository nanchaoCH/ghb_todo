import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/todo_model.dart';
import '../../../providers/todo_provider.dart';

class TodoChartPage extends StatefulWidget {
  const TodoChartPage({super.key});

  @override
  State<TodoChartPage> createState() => _TodoChartPageState();
}

class _TodoChartPageState extends State<TodoChartPage> {
  Map<Priority, int> _calculatePriorityCounts(List<TodoModel> todos) {
    final Map<Priority, int> counts = {
      Priority.low: 0,
      Priority.medium: 0,
      Priority.high: 0,
    };

    for (var todo in todos) {
      counts[todo.priority] = counts[todo.priority]! + 1;
    }

    return counts;
  }

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context).todos;

    if (todos.isEmpty) {
      return const Center(
        child: Icon(
          Icons.bar_chart,
          size: 100,
          color: Colors.green,
        ),
      );
    }

    final priorityCounts = _calculatePriorityCounts(todos);

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          "Todo Priority Distribution",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.6,
          child: PieChart(
            PieChartData(
              sections: _buildPieChartSections(priorityCounts),
              centerSpaceRadius: 50,
              sectionsSpace: 5,
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _buildPieChartSections(
    Map<Priority, int> priorityCounts,
  ) {
    final total = priorityCounts.values.reduce((a, b) => a + b);
    final colors = {
      Priority.high: Colors.red,
      Priority.medium: Colors.orange,
      Priority.low: Colors.green,
    };

    return priorityCounts.entries.map((entry) {
      final priority = entry.key;
      final count = entry.value;
      final percentage = total > 0 ? (count / total) * 100 : 0;

      return PieChartSectionData(
        color: colors[priority],
        value: count.toDouble(),
        title: "${priority.name}\n${percentage.toStringAsFixed(1)}%",
        radius: 50,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}
