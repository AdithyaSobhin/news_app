import 'package:flutter/material.dart';
import 'package:news_app/controller/detailed_screen_controller.dart';
import 'package:news_app/model/business_news_model.dart';
import 'package:provider/provider.dart';

class DetailedScreen extends StatefulWidget {
  final Article article;

  const DetailedScreen({Key? key, required this.article}) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context
            .read<DetailedScreenController>()
            .getDetailedNews(widget.article.url ?? "");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailedScreenProvider = context.watch<DetailedScreenController>();
    return Scaffold(
      appBar: AppBar(),
      body: detailedScreenProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.article.urlToImage ??
                          "https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ=",
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.article.title ?? "No Title",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.article.description ?? "No description",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.article.content ?? "No content available",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Author: ${widget.article.author ?? 'Unknown'}",
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // if (article.url != null) {
                      //   launchURL(article
                      //       .url!);
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text("No URL available")),
                      //   );
                      // }
                    },
                    child: Text("More"),
                  )
                ],
              ),
            ),
    );
  }
}
