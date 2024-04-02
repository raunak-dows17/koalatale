import 'package:timeago/timeago.dart' as timeago;

class TimeAgo {
  String getTimeAgo(String time) {
    final now = DateTime.now();
    final difference = now.difference(DateTime.parse(time));
    return timeago.format(now.subtract(difference), locale: 'en_short');
  }
}
