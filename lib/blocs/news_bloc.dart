import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_mobile_app/models/news_model.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  // For development, we'll use mock data instead of Firebase
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  NewsBloc() : super(NewsInitial()) {
    on<FetchNewsRequested>(_onFetchNewsRequested);
    on<FetchNewsDetailRequested>(_onFetchNewsDetailRequested);
  }

  Future<void> _onFetchNewsRequested(
    FetchNewsRequested event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsLoading());
    try {
      // Use mock data for development
      await Future.delayed(const Duration(seconds: 1));
      final mockNewsList = _getMockNews();
      emit(NewsLoaded(mockNewsList));
    } catch (e) {
      emit(NewsError('Жаңылыктарды жүктөөдө ката кетти: $e'));
      // Use mock data as fallback
      emit(NewsLoaded(_getMockNews()));
    }
  }

  Future<void> _onFetchNewsDetailRequested(
    FetchNewsDetailRequested event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsLoading());
    try {
      // Use mock data for development
      await Future.delayed(const Duration(seconds: 1));
      final mockNews = _getMockNews();
      final foundNews = mockNews.firstWhere(
        (news) => news.id == event.newsId,
        orElse: () => mockNews.first,
      );
      emit(NewsDetailLoaded(foundNews));
    } catch (e) {
      emit(NewsError('Жаңылык деталдарын жүктөөдө ката кетти: $e'));
      // Use first mock news as fallback
      emit(NewsDetailLoaded(_getMockNews().first));
    }
  }

  // Mock data for development purposes
  List<NewsModel> _getMockNews() {
    return [
      NewsModel(
        id: '1',
        title: 'Жаңы ветеринардык вакцина иштелип чыкты',
        summary: 'Бодо малдар үчүн жаңы вакцина иштелип чыкты.',
        content: 'Кыргызстанда бодо малдар үчүн жаңы вакцина иштелип чыкты. '
            'Бул вакцина малдарды көптөгөн оорулардан сактайт жана алардын '
            'иммунитетин жогорулатат. Вакцина жергиликтүү лабораторияларда '
            'өндүрүлөт жана баасы арзан болот. Бул жаңылык фермерлер үчүн '
            'абдан маанилүү, анткени алар малдарын оорулардан коргой алышат '
            'жана өндүрүмдүүлүгүн жогорулата алышат.',
        imageUrl: 'https://images.unsplash.com/photo-1605152276897-4f618f831968',
        publishDate: DateTime.now().subtract(const Duration(days: 2)),
      ),
      NewsModel(
        id: '2',
        title: 'Малдарды туура тоюттандыруу боюнча семинар',
        summary: 'Фермерлер үчүн малдарды туура тоюттандыруу боюнча семинар өткөрүлөт.',
        content: 'Бишкекте фермерлер үчүн малдарды туура тоюттандыруу боюнча '
            'семинар өткөрүлөт. Семинарда тажрыйбалуу ветеринарлар жана '
            'адистер малдарды туура тоюттандыруу, тоюттун сапатын текшерүү '
            'жана тоютту сактоо боюнча маалымат беришет. Катышуучулар '
            'суроолорун бере алышат жана практикалык кеңештерди алышат. '
            'Семинар акысыз өткөрүлөт жана бардык каалоочулар катыша алышат.',
        imageUrl: 'https://images.unsplash.com/photo-1516467508483-a7212febe31a',
        publishDate: DateTime.now().subtract(const Duration(days: 5)),
      ),
      NewsModel(
        id: '3',
        title: 'Жаңы ветеринардык клиника ачылды',
        summary: 'Бишкекте жаңы заманбап ветеринардык клиника ачылды.',
        content: 'Бишкекте жаңы заманбап ветеринардык клиника ачылды. '
            'Клиникада тажрыйбалуу ветеринарлар иштешет жана заманбап '
            'жабдуулар орнотулган. Клиника бардык түрдөгү малдарга кызмат '
            'көрсөтөт жана 24/7 иштейт. Клиникада диагностика, дарылоо, '
            'операция жана башка кызматтар көрсөтүлөт. Клиниканын дареги: '
            'Бишкек шаары, Чүй проспекти, 123.',
        imageUrl: 'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7',
        publishDate: DateTime.now().subtract(const Duration(days: 10)),
      ),
    ];
  }
}
