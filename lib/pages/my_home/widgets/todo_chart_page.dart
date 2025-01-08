import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/bar_chart_model.dart';
import '../../../models/todo_model.dart';
import '../../../providers/todo_provider.dart';

class TodoChartPage extends StatefulWidget {
  const TodoChartPage({super.key});

  @override
  State<TodoChartPage> createState() => _TodoChartPageState();
}

class _TodoChartPageState extends State<TodoChartPage> {
  Map<String, int> _calculatePriorityCounts(List<TodoModel> todos) {
    final Map<String, int> counts = {
      ToDoPriority.low: 0,
      ToDoPriority.medium: 0,
      ToDoPriority.high: 0,
    };

    for (var todo in todos) {
      counts[todo.priority] = counts[todo.priority]! + 1;
    }

    return counts;
  }

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context).todos;
    // default listen:TRUE, rebuild widget เมื่อค่ามีการเปลี่ยนแปลง

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
    final pieChart = Column(
      children: [
        const SizedBox(height: 20),
        Text(
          "Todo Priority Distribution",
          style: Theme.of(context).textTheme.titleMedium,
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

    final barChartSimple = Column(
      children: [
        const SizedBox(height: 20),
        Text(
          "Todo Count by Month",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.6,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: _createBarGroups(),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (
                      double value,
                      TitleMeta meta,
                    ) {
                      final index = value.toInt();

                      if (index < data.length) {
                        return Text(data[index].label);
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ),
            duration: const Duration(milliseconds: 150),
            curve: Curves.linear,
          ),
        ),
      ],
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          pieChart,
          barChartSimple,
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections(
    Map<String, int> priorityCounts,
  ) {
    final total = priorityCounts.values.reduce((a, b) => a + b);
    final colors = {
      ToDoPriority.high: Colors.red,
      ToDoPriority.medium: Colors.orange,
      ToDoPriority.low: Colors.green,
    };

    return priorityCounts.entries.map((entry) {
      final priority = entry.key;
      final count = entry.value;
      final percentage = total > 0 ? (count / total) * 100 : 0;

      return PieChartSectionData(
        color: colors[priority],
        value: count.toDouble(),
        title: "$priority\n${percentage.toStringAsFixed(1)}%",
        radius: 50,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  final List<BarChartModel> data = [
    BarChartModel(label: 'Jan', value: 10),
    BarChartModel(label: 'Feb', value: 20),
    BarChartModel(label: 'Mar', value: 30),
    BarChartModel(label: 'Apr', value: 25),
    BarChartModel(label: 'May', value: 15),
  ];

  List<BarChartGroupData> _createBarGroups() {
    return data.asMap().entries.map((entry) {
      final index = entry.key;
      final barData = entry.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: barData.value,
            color: Colors.green,
            width: 20,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      );
    }).toList();
  }
}
