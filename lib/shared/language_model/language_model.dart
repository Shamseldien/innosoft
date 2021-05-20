class LanguageModel {
  String home;
  String league;
  String media;
  String states;
  String more;
  String latestNews;
  String nextMatches;
  String latestTweet;
  String leagueSport;
  String winner;
  String video;
  String news;
  String pics;
  String sponsors;
  String clubGuide;
  String stadiumGuide;
  String aboutUs;
  String laws;
  String committees;
  String contactUs;
  String share;
  String subscribe;
  String changeLang;
  String save;

  LanguageModel(
      {this.home,
        this.league,
        this.media,
        this.states,
        this.more,
        this.latestNews,
        this.nextMatches,
        this.latestTweet,
        this.leagueSport,
        this.winner,
        this.video,
        this.news,
        this.pics,
        this.sponsors,
        this.clubGuide,
        this.stadiumGuide,
        this.aboutUs,
        this.laws,
        this.committees,
        this.contactUs,
        this.share,
        this.subscribe,
        this.changeLang,
        this.save

      });

  LanguageModel.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    league = json['league'];
    media = json['media'];
    states = json['states'];
    latestNews = json['latestNews'];
    nextMatches = json['nextMatches'];
    latestTweet = json['latestTweet'];
    leagueSport = json['leagueSport'];
    winner = json['winner'];
    video = json['video'];
    news = json['news'];
    pics = json['pics'];
    sponsors = json['sponsors'];
    clubGuide = json['clubGuide'];
    stadiumGuide = json['stadiumGuide'];
    aboutUs = json['aboutUs'];
    laws = json['laws'];
    committees = json['committees'];
    contactUs = json['contactUs'];
    share = json['share'];
    subscribe = json['subscribe'];
    more = json['more'];
    changeLang = json['changeLang'];
    save = json['save'];
  }


}
