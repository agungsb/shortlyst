import 'package:shortlyst/models/chat_item_model.dart';
import 'package:shortlyst/models/company_model.dart';
import 'package:meta/meta.dart';

final List<ChatItemModel> chats = [
  ChatItemModel('', 'ava'),
  ChatItemModel('Welcome back, Loretta', 'chat-left'),
  ChatItemModel('Hi Loretta, what do you want today?', 'chat-left'),
  ChatItemModel('Explore for an opening', 'chat-right'),
  ChatItemModel('', 'ava'),
  ChatItemModel('I\'ll recommend you the position that perfect your qualification!',
      'chat-left'),
];

class Companies {
  const Companies();

  get getAll => [
    CompanyModel('Amazon'),
    CompanyModel('Apple Inc'),
    CompanyModel('Google'),
    CompanyModel('GO-JEK'),
    CompanyModel('Microsoft'),
  ];
}

class Label {
  static final String COMPANY_TIER = 'companytier';
  static final String DATE_POSTED = 'dateposted';
  static final String JOB_TYPE = 'jobtype';
  static final String SORT_BY = 'sortby';
}