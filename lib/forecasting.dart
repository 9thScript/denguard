import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class ForecastingWidget extends StatefulWidget {
  const ForecastingWidget({Key? key}) : super(key: key);

  static String routeName = 'Forecasting';
  static String routePath = '/forecasting';

  @override
  State<ForecastingWidget> createState() => _ForecastingWidgetState();
}

class ForecastPoint {
  final DateTime date;
  final double forecast;
  final double? actual;
  final double? lowerBound;
  final double? upperBound;

  ForecastPoint({
    required this.date,
    required this.forecast,
    this.actual,
    this.lowerBound,
    this.upperBound,
  });
}

class _ForecastingWidgetState extends State<ForecastingWidget> {
  Map<String, List<ForecastPoint>> forecastByYear = {};
  String selectedYear = '';
  bool isLoading = true;

  final List<String> regions = [
    'NCR',
    'CAR',
    'Region I',
    'Region II',
    'Region III',
    'Region IV-A',
    'Region IV-B',
    'Region V',
    'Region VI',
    'Region VII',
    'Region VIII',
    'Region IX',
    'Region X',
    'Region XI',
    'Region XII',
    'BARMM'
  ];
  String selectedRegion = 'NCR';
  int forecastMonths = 72;

  @override
  void initState() {
    super.initState();
    fetchForecast();
  }

  Future<void> fetchForecast() async {
    try {
      final uri = Uri.parse('https://dengue-forecast-api.onrender.com/forecast')
          .replace(queryParameters: {
        'region': selectedRegion,
        'months': forecastMonths.toString(),
      });
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final safeJsonString = response.body.replaceAll('NaN', 'null');
        final List data = json.decode(safeJsonString);

        Map<String, List<ForecastPoint>> groupedData = {};

        for (var item in data) {
          final date = DateTime.parse(item['ds']);
          final forecast = double.tryParse(item['yhat'].toString()) ?? 0;
          final actual = item.containsKey('y')
              ? double.tryParse(item['y'].toString())
              : null;
          final lowerBound = item.containsKey('yhat_lower')
              ? double.tryParse(item['yhat_lower'].toString())
              : null;
          final upperBound = item.containsKey('yhat_upper')
              ? double.tryParse(item['yhat_upper'].toString())
              : null;

          final point = ForecastPoint(
            date: date,
            forecast: forecast,
            actual: actual,
            lowerBound: lowerBound,
            upperBound: upperBound,
          );

          final year = date.year.toString();
          groupedData.putIfAbsent(year, () => []).add(point);
        }

        setState(() {
          forecastByYear = groupedData;
          selectedYear = groupedData.keys.firstOrNull ?? '';
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load forecast');
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() => isLoading = false);
    }
  }

  Widget buildChart(List<ForecastPoint> points) {
    List<FlSpot> forecastSpots = [];
    List<FlSpot> actualSpots = [];
    List<String> xLabels = [];

    for (int i = 0; i < points.length; i++) {
      forecastSpots.add(FlSpot(i.toDouble(), points[i].forecast));
      if (points[i].actual != null) {
        actualSpots.add(FlSpot(i.toDouble(), points[i].actual!));
      }
      xLabels.add(points[i].date.month.toString().padLeft(2, '0'));
    }

    if (forecastSpots.isEmpty && actualSpots.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    double maxY = 0;
    if (forecastSpots.isNotEmpty) {
      maxY = forecastSpots.map((e) => e.y).reduce(max);
    }
    if (actualSpots.isNotEmpty) {
      double maxActual = actualSpots.map((e) => e.y).reduce(max);
      if (maxActual > maxY) maxY = maxActual;
    }

    double interval;
    if (maxY <= 1000) {
      interval = 200;
    } else if (maxY <= 3000) {
      interval = 500;
    } else if (maxY <= 6000) {
      interval = 1000;
    } else {
      interval = 2000;
    }

    return LineChart(LineChartData(
      minY: 0,
      maxY: maxY + 200,
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: const Color.fromARGB(255, 238, 92, 92),
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toInt()} cases',
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
      ),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          axisNameWidget: const Text('Month'),
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, _) {
              int index = value.toInt();
              return (index >= 0 && index < xLabels.length)
                  ? Text(xLabels[index])
                  : const Text('');
            },
          ),
        ),
        leftTitles: AxisTitles(
          axisNameWidget: const Text('Cases'),
          sideTitles: SideTitles(
            showTitles: true,
            interval: interval,
            reservedSize: 42,
            getTitlesWidget: (value, _) => Text(
              value.toInt().toString(),
              style: const TextStyle(fontSize: 10),
            ),
          ),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: forecastSpots,
          isCurved: true,
          color: const Color.fromARGB(255, 238, 92, 92),
          barWidth: 2,
          dotData: FlDotData(show: false),
        ),
        LineChartBarData(
          spots: actualSpots,
          isCurved: true,
          color: Colors.orange,
          barWidth: 2,
          dotData: FlDotData(show: false),
        ),
      ],
      gridData: FlGridData(show: true),
      borderData: FlBorderData(show: true),
    ));
  }

  Widget buildSummary(List<ForecastPoint> points) {
    if (points.isEmpty) return const SizedBox();

    final forecastValues = points.map((e) => e.forecast).toList();
    final actualValues =
        points.where((e) => e.actual != null).map((e) => e.actual!).toList();

    final formatter = NumberFormat('#,###');

    final forecastMin = forecastValues.reduce(min);
    final forecastMax = forecastValues.reduce(max);
    final actualMin = actualValues.isNotEmpty ? actualValues.reduce(min) : null;
    final actualMax = actualValues.isNotEmpty ? actualValues.reduce(max) : null;

    final averageForecast =
        forecastValues.reduce((a, b) => a + b) / forecastValues.length;

    String riskLevel;
    Color riskColor;

    if (averageForecast < 1000) {
      riskLevel = 'Low';
      riskColor = Colors.green;
    } else if (averageForecast < 2000) {
      riskLevel = 'Moderate';
      riskColor = Colors.orange;
    } else {
      riskLevel = 'High Risk';
      riskColor = Colors.red;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forecast Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Min Forecast: ${formatter.format(forecastMin)} cases'),
              Text('Max Forecast: ${formatter.format(forecastMax)} cases'),
              Text(
                  'Average Forecast: ${formatter.format(averageForecast)} cases'),
              if (actualMin != null)
                Text('Min Actual: ${formatter.format(actualMin)} cases'),
              if (actualMax != null)
                Text('Max Actual: ${formatter.format(actualMax)} cases'),
              const SizedBox(height: 8),
              Text(
                'Estimated Risk Level: $riskLevel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: riskColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 32),
        const Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Risk Level Legend',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '• Low: < 1,000 forecasted cases',
                style: TextStyle(color: Colors.green),
              ),
              Text(
                '• Moderate: 1,000 – 1,999 forecasted cases',
                style: TextStyle(color: Colors.orange),
              ),
              Text(
                '• High Risk: ≥ 2,000 forecasted cases',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentData = forecastByYear[selectedYear] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dengue Forecasting',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 238, 92, 92),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Months to Forecast",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        forecastMonths = int.tryParse(value) ?? 12;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedRegion,
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                        hint: const Text('Select Region'),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedRegion = newValue;
                              isLoading = true;
                            });
                            fetchForecast();
                          }
                        },
                        items: regions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButton<String>(
                    value: selectedYear,
                    hint: const Text('Select Year'),
                    items: forecastByYear.keys
                        .map((year) => DropdownMenuItem(
                              value: year,
                              child: Text(year),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) selectedYear = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Dengue Forecast',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Expanded(child: buildChart(currentData)),
                  const SizedBox(height: 20),
                  buildSummary(currentData),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.show_chart,
                          color: Color.fromARGB(255, 238, 92, 92)),
                      Text(' Forecast  '),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
