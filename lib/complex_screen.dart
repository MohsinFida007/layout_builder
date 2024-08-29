import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';

class ComplexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enhanced Complex Layout'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('You have no new notifications.'),
                ),
              );
            },
          ),
        ],
      ),
      drawer: _buildSidebar(context),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return _buildDashboard(context);
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.indigoAccent,
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Add New Item',
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.indigoAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildProfileSection(context),
            Divider(color: Colors.white70, thickness: 1),
            _buildSidebarItem(Icons.dashboard, 'Dashboard', context),
            _buildSidebarItem(Icons.analytics, 'Analytics', context),
            _buildSidebarItem(Icons.settings, 'Settings', context),
            _buildSidebarItem(Icons.help, 'Help', context),
            _buildSidebarItem(Icons.logout, 'Logout', context),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String label, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(label, style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label feature coming soon!'),
          ),
        );
      },
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          'https://randomuser.me/api/portraits/women/44.jpg',
        ),
      ),
      accountName: Text('Jane Doe', style: TextStyle(fontSize: 18)),
      accountEmail:
          Text('jane.doe@example.com', style: TextStyle(fontSize: 14)),
    );
  }

  Widget _buildDashboard(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAnimatedHeader(),
          _buildFeatureCards(context),
          _buildStatisticsSection(),
          _buildInteractiveChart(),
          _buildNetworkImageGrid(context),
          _buildContentList(context),
        ],
      ),
    );
  }

  Widget _buildAnimatedHeader() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigoAccent, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 5)),
        ],
      ),
      child: Center(
        child: Text(
          'Welcome to Your Dashboard',
          style: TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildFeatureCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFeatureCard(
              Icons.wallet_travel, 'Wallet', Colors.orange, context),
          _buildFeatureCard(
              Icons.trending_up, 'Analytics', Colors.teal, context),
          _buildFeatureCard(
              Icons.chat_bubble, 'Messages', Colors.pinkAccent, context),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
      IconData icon, String title, Color color, BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title feature coming soon!'),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Statistics Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.black26, width: 1),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        color: Colors.blueAccent,
                        barWidth: 4,
                        spots: [
                          FlSpot(0, 1),
                          FlSpot(1, 1.5),
                          FlSpot(7, 1.4),
                          FlSpot(3, 3.4),
                          FlSpot(4, 8),
                          FlSpot(5, 2.2),
                          FlSpot(3, 1.8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Interactive chart widget placeholder
  Widget _buildInteractiveChart() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'Interactive Chart Placeholder',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // Grid with cached network images
  Widget _buildNetworkImageGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/200/200?random=$index',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(height: 8),
                  Text('Image ${index + 1}',
                      style: TextStyle(color: Colors.black87)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Content list with detailed cards and interactive elements
  Widget _buildContentList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          5,
          (index) => Card(
            color: Colors.white,
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child:
                    Text('${index + 1}', style: TextStyle(color: Colors.white)),
              ),
              title: Text('Item ${index + 1}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Detailed description of Item ${index + 1}'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You tapped on Item ${index + 1}!'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.indigoAccent,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
