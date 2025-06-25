import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Cycle extends StatefulWidget {
  const Cycle({super.key});

  @override
  State<Cycle> createState() => _CycleState();
}

class _CycleState extends State<Cycle> {
  int currentDay = 12;
  int totalCycleLength = 28;
  int daysLate = 2;
  int flowLevel = 3;
  int avgCycleLength = 30;
  int lastCycleLength = 29;
  int ovulationDay = 14;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    progress = currentDay / totalCycleLength;
  }

  Widget buildMiniProgress(String label, double percent, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 5.0,
            percent: percent.clamp(0.0, 1.0),
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.grey.shade200,
            progressColor: color,
            center: Text(
              "${(percent * 100).toInt()}%",
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, _) => Text("Day ${value.toInt()}",
                  style: const TextStyle(fontSize: 10)),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 2,
              getTitlesWidget: (value, _) => Text("${value.toInt()}",
                  style: const TextStyle(fontSize: 10)),
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(
            show: true,
            border: const Border(bottom: BorderSide(), left: BorderSide())),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(1, 28),
              FlSpot(2, 30),
              FlSpot(3, 29),
              FlSpot(4, 31),
              FlSpot(5, 28),
            ],
            isCurved: true,
            color: Colors.pink,
            barWidth: 3,
            belowBarData: BarAreaData(show: true, color: Colors.pink.shade100),
          )
        ],
      ),
    );
  }

  Widget buildStatTile(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 13)),
              const SizedBox(height: 2),
              Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87)),
            ],
          )
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        elevation: 5,
        title: const Text("Cycle Tracker",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade300, Colors.pink.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Current Cycle"),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.pink.shade100,
                      blurRadius: 12,
                      offset: const Offset(0, 5))
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 75.0,
                    lineWidth: 12.0,
                    percent: progress.clamp(0.0, 1.0),
                    animation: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: Colors.grey.shade300,
                    progressColor: Colors.pink,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Day $currentDay",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text("$daysLate days late",
                            style: const TextStyle(
                                color: Colors.redAccent, fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Cycle Progress",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "You're on day 12. Tracking symptoms helps forecast your next cycle.",
                          style: TextStyle(fontSize: 13, color: Colors.black87),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "🌼 Stay hydrated and rest well.",
                          style: TextStyle(
                              fontSize: 13, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            sectionTitle("Mini Stats"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child:
                        buildMiniProgress("Flow", flowLevel / 5, Colors.blue)),
                const SizedBox(width: 12),
                Expanded(
                    child: buildMiniProgress(
                        "Cycle", avgCycleLength / 35, Colors.orange)),
                const SizedBox(width: 12),
                Expanded(
                    child: buildMiniProgress(
                        "Ovulation", ovulationDay / 28, Colors.purple)),
              ],
            ),
            const SizedBox(height: 20),
            sectionTitle("Insights"),
            StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                buildStatTile("Avg Cycle", "$avgCycleLength days",
                    Icons.av_timer, Colors.teal),
                buildStatTile("Last Cycle", "$lastCycleLength days",
                    Icons.history, Colors.purple),
                buildStatTile(
                    "Flow Level", "$flowLevel / 5", Icons.opacity, Colors.blue),
                buildStatTile(
                    "Ovulation", "$ovulationDay", Icons.egg, Colors.orange),
              ],
            ),
            const SizedBox(height: 20),
            sectionTitle("Trends"),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.pink.shade100,
                        blurRadius: 10,
                        offset: const Offset(0, 4))
                  ]),
              child: SizedBox(height: 200, child: buildLineChart()),
            ),
            const SizedBox(height: 20),
            sectionTitle("Tip of the Day"),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.pink.shade100,
                      blurRadius: 10,
                      offset: const Offset(0, 4))
                ],
              ),
              child: const Text(
                "✨ Tip: Keep logging your symptoms daily for better predictions and health tracking.",
                style: TextStyle(fontSize: 15, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
