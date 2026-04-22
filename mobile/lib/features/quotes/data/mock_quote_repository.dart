import '../domain/quote.dart';
import '../domain/quote_repository.dart';

class MockQuoteRepository implements QuoteRepository {
  MockQuoteRepository();

  final List<Quote> _quotes = const [
    Quote(
      id: 'q1',
      text: 'Consistency is more important than intensity.',
      ipa: '/kənˈsɪstənsi ɪz mɔːr ɪmˈpɔːrtnt ðæn ɪnˈtensəti/',
      translation: '지속성은 강도보다 중요하다.',
      topic: 'motivation',
      level: 'A2',
    ),
    Quote(
      id: 'q2',
      text: 'Practice makes progress, not perfection.',
      ipa: '/ˈpræktɪs meɪks ˈprɑːɡres nɑːt pərˈfekʃn/',
      translation: '연습은 완벽이 아니라 성장을 만든다.',
      topic: 'learning',
      level: 'B1',
    ),
    Quote(
      id: 'q3',
      text: 'Small steps every day build big results.',
      ipa: '/smɔːl steps ˈevri deɪ bɪld bɪɡ rɪˈzʌlts/',
      translation: '매일의 작은 걸음이 큰 결과를 만든다.',
      topic: 'habit',
      level: 'A2',
    ),
  ];

  @override
  List<Quote> getAll() => _quotes;

  @override
  Quote getDaily() => _quotes[DateTime.now().day % _quotes.length];

  @override
  List<Quote> filter({String topic = 'all', String level = 'all'}) {
    return _quotes.where((q) {
      final topicMatch = topic == 'all' || q.topic == topic;
      final levelMatch = level == 'all' || q.level == level;
      return topicMatch && levelMatch;
    }).toList();
  }
}
