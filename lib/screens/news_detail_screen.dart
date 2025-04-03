import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:vet_mobile_app/blocs/news_bloc.dart';
import 'package:vet_mobile_app/blocs/news_event.dart';
import 'package:vet_mobile_app/blocs/news_state.dart';

class NewsDetailScreen extends StatefulWidget {
  final String newsId;

  const NewsDetailScreen({super.key, required this.newsId});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNewsDetailRequested(widget.newsId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Жаңылык',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          } else if (state is NewsDetailLoaded) {
            final news = state.newsDetail;
            final dateFormat = DateFormat('dd.MM.yyyy');
            final formattedDate = dateFormat.format(news.publishDate);

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: news.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 250,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 250,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported, size: 50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 16,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.green.shade100),
                          ),
                          child: Text(
                            news.summary,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          news.content,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Divider(color: Colors.green),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildShareButton(Icons.facebook, 'Facebook'),
                            const SizedBox(width: 16),
                            _buildShareButton(Icons.send, 'Telegram'),
                            const SizedBox(width: 16),
                            _buildShareButton(Icons.chat, 'WhatsApp'),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is NewsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<NewsBloc>().add(
                            FetchNewsDetailRequested(widget.newsId),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Кайра жүктөө'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Жаңылык табылган жок'),
            );
          }
        },
      ),
    );
  }

  Widget _buildShareButton(IconData icon, String platform) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$platform аркылуу бөлүшүү'),
            backgroundColor: Colors.green,
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 4),
          Text(
            platform,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
