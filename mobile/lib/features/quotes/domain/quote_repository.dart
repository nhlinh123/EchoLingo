import 'quote.dart';

abstract class QuoteRepository {
  List<Quote> getAll();
  Quote getDaily();
  List<Quote> filter({String topic = 'all', String level = 'all'});
}
