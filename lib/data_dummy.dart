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
    CompanyModel('Amazon', 'http://www.vmastoryboard.com/wp-content/uploads/2014/08/Amazon-A-Logo.jpg'),
    CompanyModel('Apple Inc', 'http://res.thegear.co.kr/images/20170720/20170720095826607464.jpg'),
    CompanyModel('Google', 'https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/evolving_google_identity_videoposter_006.jpg'),
    CompanyModel('GO-JEK', 'https://cdn-images-1.medium.com/max/512/1*5fCAiEdtIXD53sM90gn5JA.jpeg'),
    CompanyModel('Microsoft', 'http://www.digitalsquad.co.id/wp-content/uploads/2013/05/microsoft-logo.jpg'),
  ];
}

class Label {
  static final String COMPANY_TIER = 'companytier';
  static final String DATE_POSTED = 'dateposted';
  static final String JOB_TYPE = 'jobtype';
  static final String SORT_BY = 'sortby';
}