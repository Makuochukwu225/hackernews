import 'package:flutter/cupertino.dart';
import 'package:hackernews/src/screens/web/web_screen.dart';
import 'package:hackernews/src/src.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  List<HackerNews> latestNews = [];
  bool isLoading = true;
  bool isMoreNewsLoading = false;
  List<Map<String, dynamic>> savedTime = [];
  int currentPage = 0;

  // get all the times with page where saved to database
  getLastSavedTime() async {
    var time = await LocalDatabase.getSaveTime();
    setState(() {
      savedTime = time;
    });
  }

  // read news from db or fetch api
  firstPageNews() async {
    int count = await LocalDatabase.getNewsCount() ?? 0;
    print("No of news saved $count");
    int savedTimeLength = savedTime.length;
    DateTime firstPageSavedTime = savedTimeLength >= 1
        ? DateTime.parse(savedTime[0]["lastSavedTime"] ?? "2000-01-01")
        : DateTime(2000);

    print(firstPageSavedTime);

    DateTime currentTime = DateTime.now();

    Duration difference = currentTime.difference(firstPageSavedTime);
    if (difference.inMinutes > 5 || count == 0) {
      print("fetching the api");
      var isApifetching = await NewsService.getLatestNews(pageNo: currentPage);
      if (isApifetching) {
        getNews();
      }
    } else {
      print("data from local database");
      getNews();
    }
  }

// next page news
  nextPageNews() async {
    setState(() {
      isMoreNewsLoading = true;
    });
    int count = await LocalDatabase.getNewsCount() ?? 0;
    print("No of news saved $count");
    await getLastSavedTime();
    int savedTimeLength = savedTime.length;
    DateTime nextPageSavedTime = currentPage > savedTimeLength - 1
        ? DateTime(2000)
        : DateTime.parse(
            savedTime[currentPage]["lastSavedTime"] ?? "2000-01-01");

    print(nextPageSavedTime);

    DateTime currentTime = DateTime.now();

    Duration difference = currentTime.difference(nextPageSavedTime);
    if (difference.inMinutes > 5) {
      print("fetching the api for $currentPage");
      var isApifetching = await NewsService.getLatestNews(pageNo: currentPage);
      if (isApifetching) {
        getMoreNews();
      }
    } else {
      print("data from local database");
      getMoreNews();
    }
  }

// read data from local database
  getNews() async {
    var news = await LocalDatabase.getNews();
    setState(() {
      latestNews = news.map((e) => HackerNews.fromJson(e)).toList();
      isLoading = false;
    });
  }

  // get more news from local database
  getMoreNews() async {
    var news = await LocalDatabase.getMoreNews(latestNews.length);
    setState(() {
      latestNews.addAll(news.map((e) => HackerNews.fromJson(e)).toList());
      isMoreNewsLoading = false;
    });
  }

  // to load more news on scroll
  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      currentPage++;
      nextPageNews();
    }
  }

  @override
  void initState() {
    getLastSavedTime();
    firstPageNews();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                getLastSavedTime();
                firstPageNews();
                currentPage = 0;

                setState(() {
                  isLoading = true;
                });
              },
              icon: const Icon(
                Icons.refresh,
              )),
          IconButton(
              onPressed: () {
                LocalDatabase.deleteAllNews();
                LocalDatabase.deleteSavedTime();
                setState(() {
                  latestNews = [];
                });
              },
              icon: const Icon(
                Icons.delete,
              )),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getLastSavedTime();
          firstPageNews();
          currentPage = 0;

          setState(() {
            isLoading = true;
          });
        },
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : latestNews.isEmpty
                ? const Center(child: Text("No News Found"))
                : ListView.builder(
                    controller: scrollController,
                    itemCount: latestNews.length,
                    itemBuilder: (context, index) {
                      var latestNew = latestNews[index];
                      return ListTile(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            // useSafeArea: true,
                            // isScrollControlled: true,
                            // enableDrag: false,
                            builder: (context) {
                              return WebScreen(url: latestNew.url);
                            },
                          );
                          // _launchUrl(latestNews[index].url);
                        },
                        leading: Text("${index + 1}."),
                        title: Text(latestNew.title),
                        subtitle: Row(
                          children: [
                            Text("By ${latestNew.author}"),
                          ],
                        ),
                      );
                    },
                  ),
      ),
      bottomNavigationBar:
          isMoreNewsLoading ? const LinearProgressIndicator() : null,
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
