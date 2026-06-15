import 'package:flutter/material.dart';

import 'pages/chongqing_travel_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xfff7f9fc),
      ),
      home: const TravelHomePage(),
    );
  }
}

class CityData {
  const CityData({
    required this.id,
    required this.name,
    required this.score,
    required this.desc,
    required this.tags,
    required this.image,
    required this.detail,
  });

  final int id;
  final String name;
  final String score;
  final String desc;
  final List<String> tags;
  final String image;
  final String detail;
}

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  static const List<CityData> cities = [
    CityData(
      id: 1,
      name: '枣庄',
      score: '4.9',
      desc: '古运河畔 鲁南水乡文化',
      tags: ['# 台儿庄', '# 微山湖'],
      image: 'assets/img1.jpg',
      detail:
          '枣庄位于山东南部，是著名的台儿庄古城所在地。这里有中国保存最完好的古运河文化遗址，水巷交错，古韵悠然。微山湖湿地风光旖旎，春季荷花盛开，是观鸟和休闲的绝佳去处。',
    ),
    CityData(
      id: 2,
      name: '上海',
      score: '4.8',
      desc: '摩登都市，现代繁华景象',
      tags: ['# 外滩', '# 南京路'],
      image: 'assets/img2.jpg',
      detail:
          '上海是中国最国际化的都市，外滩的万国建筑群与陆家嘴的摩天大楼交相辉映。南京路步行街繁华热闹，豫园古色古香，夜晚的黄浦江两岸灯火通明，美不胜收。',
    ),
    CityData(
      id: 3,
      name: '成都',
      score: '4.7',
      desc: '休闲慢城，美食熊猫之乡',
      tags: ['# 大熊猫', '# 宽窄巷子'],
      image: 'assets/img3.jpg',
      detail:
          '成都是西南地区的休闲之都，以大熊猫、火锅和悠闲的生活方式闻名。宽窄巷子保留了清代的街巷风貌，锦里古街充满三国文化气息，这里的人们爱喝茶、爱打麻将，节奏慢而美好。',
    ),
    CityData(
      id: 4,
      name: '西安',
      score: '4.9',
      desc: '千年古都，大唐不夜城',
      tags: ['# 大雁塔', '# 兵马俑'],
      image: 'assets/img4.jpg',
      detail:
          '西安是中华文明的重要发祥地，曾是十三朝古都。秦始皇兵马俑被誉为"世界第八大奇迹"，大雁塔见证了玄奘取经的历史。大唐不夜城夜晚流光溢彩，回民街的羊肉泡馍令人回味无穷。',
    ),
    CityData(
      id: 5,
      name: '重庆',
      score: '4.9',
      desc: '山城江城 8D魔幻旅行',
      tags: ['# 洪崖洞', '# 长江索道'],
      image: 'assets/chongqing/hongya_hero.png',
      detail: '进入重庆家乡旅游二级界面，查看景点、美食和推荐路线。',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopSearchBar(),
              const SizedBox(height: 16),
              _buildHeaderTitle(),
              const SizedBox(height: 20),
              _buildCityGrid(context),
              const SizedBox(height: 24),
              _buildExploreMore(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffe2e8f0),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(Icons.person, color: Color(0xff64748b), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xfff1f5f9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    '搜索目的地 / 景点 / 酒店',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Stack(
            children: [
              const Icon(
                Icons.notifications_none_outlined,
                size: 28,
                color: Colors.black,
              ),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '学生期末作业：',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '精选城市',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.landscape, color: Colors.green[300], size: 40),
          ),
        ],
      ),
    );
  }

  Widget _buildCityGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cities.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return _buildCityCard(context, cities[index]);
        },
      ),
    );
  }

  Widget _buildCityCard(BuildContext context, CityData city) {
    return GestureDetector(
      onTap: () => _openCity(context, city),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(city.image),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.65),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            city.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 14,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              city.score,
                              style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      city.desc,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: city.tags.map((tag) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    tag,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            '查看详情',
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCity(BuildContext context, CityData city) {
    if (city.id == 5) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const ChongqingTravelPage()));
      return;
    }

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                city.detail,
                style: const TextStyle(fontSize: 15, height: 1.6),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExploreMore() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '探索更多',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '景点、酒店、机票、攻略',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryItem(
                Icons.location_on,
                '景点',
                const Color(0xfffee2e2),
                const Color(0xffef4444),
              ),
              _buildCategoryItem(
                Icons.hotel,
                '酒店',
                const Color(0xffe0e7ff),
                const Color(0xff4f46e5),
              ),
              _buildCategoryItem(
                Icons.flight,
                '机票',
                const Color(0xffe0f2fe),
                const Color(0xff0ea5e9),
              ),
              _buildCategoryItem(
                Icons.menu_book,
                '攻略',
                const Color(0xffdcfce7),
                const Color(0xff22c55e),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    IconData icon,
    String label,
    Color bgColor,
    Color iconColor,
  ) {
    return Column(
      children: [
        Container(
          width: 75,
          height: 40,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
