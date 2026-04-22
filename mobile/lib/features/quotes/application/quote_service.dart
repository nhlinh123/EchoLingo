import '../data/mock_quote_repository.dart';
import '../domain/quote.dart';
import '../domain/quote_repository.dart';

class QuoteService {
  QuoteService({QuoteRepository? repository}) : _repository = repository ?? MockQuoteRepository();

  final QuoteRepository _repository;

  Quote dailyQuote() => _repository.getDaily();

  List<Quote> allQuotes() => _repository.getAll();

  List<Quote> filteredQuotes({String topic = 'all', String level = 'all'}) {
    return _repository.filter(topic: topic, level: level);
  }
}
