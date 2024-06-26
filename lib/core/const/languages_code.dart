
class AppLanguage {
  AppLanguage(this.isoCode, this.name);

  final String name;
  final String isoCode;

  AppLanguage.fromMap(Map<String, String> map)
      : name = map['name']!,
        isoCode = map['isoCode']!;

  /// Returns the Language matching the given ISO code from the standard list.
  factory AppLanguage.fromIsoCode(String isoCode) =>
      CustomLanguages.defaultLanguages.firstWhere((l) => l.isoCode == isoCode);

  bool operator ==(o) =>
      o is AppLanguage && name == o.name && isoCode == o.isoCode;

  @override
  int get hashCode => isoCode.hashCode;
}



class CustomLanguages {
  static AppLanguage get abkhazian => AppLanguage('ab', 'Аҧсуа');
  static AppLanguage get afar => AppLanguage('aa', 'Afar');
  static AppLanguage get afrikaans => AppLanguage('af', 'Afrikaans');
  static AppLanguage get akan => AppLanguage('ak', 'Akan');
  static AppLanguage get albanian => AppLanguage('sq', 'Shqip');
  static AppLanguage get amharic => AppLanguage('am', 'አማርኛ');
  static AppLanguage get arabic => AppLanguage('ar', 'العربية');
  static AppLanguage get aragonese => AppLanguage('an', 'Aragonés');
  static AppLanguage get armenian => AppLanguage('hy', 'Հայերեն');
  static AppLanguage get assamese => AppLanguage('as', 'অসমীয়া');
  static AppLanguage get avaric => AppLanguage('av', 'Авар мацӀ');
  static AppLanguage get avestan => AppLanguage('ae', 'avesta');
  static AppLanguage get aymara => AppLanguage('ay', 'Aymar');
  static AppLanguage get azerbaijani => AppLanguage('az', 'Azərbaycan');
  static AppLanguage get bambara => AppLanguage('bm', 'bamanankan');
  static AppLanguage get bashkir => AppLanguage('ba', 'башҡорт теле');
  static AppLanguage get basque => AppLanguage('eu', 'euskara');
  static AppLanguage get belarusian => AppLanguage('be', 'Беларуская');
  static AppLanguage get bengali => AppLanguage('bn', 'বাংলা');
  static AppLanguage get bihariLanguages => AppLanguage('bh', 'भोजपुरी');
  static AppLanguage get bislama => AppLanguage('bi', 'Bislama');
  static AppLanguage get bosnian => AppLanguage('bs', 'bosanski jezik');
  static AppLanguage get breton => AppLanguage('br', 'brezhoneg');
  static AppLanguage get bulgarian => AppLanguage('bg', 'български език');
  static AppLanguage get burmese => AppLanguage('my', 'ဗမာစာ');
  static AppLanguage get catalan => AppLanguage('ca', 'català');
  static AppLanguage get centralKhmer => AppLanguage('km', 'ខ្មែរ');
  static AppLanguage get chamorro => AppLanguage('ch', 'Chamoru');
  static AppLanguage get chechen => AppLanguage('ce', 'нохчийн мотт');
  static AppLanguage get chewaNyanja => AppLanguage('ny', 'chiCheŵa');
  static AppLanguage get chineseSimplified => AppLanguage('zh_Hans', '中文(简体)');
  static AppLanguage get chineseTraditional => AppLanguage('zh_Hant', '中文(繁體)');
  static AppLanguage get churchSlavonic => AppLanguage('cu', 'црькъвьнословѣньскъ');
  static AppLanguage get chuvash => AppLanguage('cv', 'чӑваш чӗлхи');
  static AppLanguage get cornish => AppLanguage('kw', 'kernewek');
  static AppLanguage get corsican => AppLanguage('co', 'corsu');
  static AppLanguage get cree => AppLanguage('cr', 'ᓀᐦᐃᔭᐍᐏᐣ');
  static AppLanguage get croatian => AppLanguage('hr', 'hrvatski jezik');
  static AppLanguage get czech => AppLanguage('cs', 'čeština');
  static AppLanguage get danish => AppLanguage('da', 'dansk');
  static AppLanguage get dhivehi => AppLanguage('dv', 'ދިވެހި');
  static AppLanguage get dutch => AppLanguage('nl', 'Nederlands');
  static AppLanguage get dzongkha => AppLanguage('dz', 'རྫོང་ཁ');
  static AppLanguage get english => AppLanguage('en', 'English');
  static AppLanguage get esperanto => AppLanguage('eo', 'Esperanto');
  static AppLanguage get estonian => AppLanguage('et', 'eesti');
  static AppLanguage get ewe => AppLanguage('ee', 'Eʋegbe');
  static AppLanguage get faroese => AppLanguage('fo', 'føroyskt');
  static AppLanguage get fijian => AppLanguage('fj', 'vosa Vakaviti');
  static AppLanguage get finnish => AppLanguage('fi', 'suomi');
  static AppLanguage get french => AppLanguage('fr', 'français');
  static AppLanguage get fulah => AppLanguage('ff', 'Fulfulde');
  static AppLanguage get gaelic => AppLanguage('gd', 'Gàidhlig');
  static AppLanguage get galician => AppLanguage('gl', 'Galego');
  static AppLanguage get ganda => AppLanguage('lg', 'Luganda');
  static AppLanguage get georgian => AppLanguage('ka', 'ქართული');
  static AppLanguage get german => AppLanguage('de', 'Deutsch');
  static AppLanguage get greek => AppLanguage('el', 'Ελληνικά');
  static AppLanguage get guarani => AppLanguage('gn', 'Avañe\'ẽ');
  static AppLanguage get gujarati => AppLanguage('gu', 'ગુજરાતી');
  static AppLanguage get haitian => AppLanguage('ht', 'Kreyòl ayisyen');
  static AppLanguage get hausa => AppLanguage('ha', 'Hausa');
  static AppLanguage get hebrew => AppLanguage('he', 'עברית');
  static AppLanguage get herero => AppLanguage('hz', 'Otjiherero');
  static AppLanguage get hindi => AppLanguage('hi', 'हिन्दी');
  static AppLanguage get hiriMotu => AppLanguage('ho', 'Hiri Motu');
  static AppLanguage get hungarian => AppLanguage('hu', 'Magyar');
  static AppLanguage get icelandic => AppLanguage('is', 'Íslenska');
  static AppLanguage get ido => AppLanguage('io', 'Ido');
  static AppLanguage get igbo => AppLanguage('ig', 'Asụsụ Igbo');
  static AppLanguage get indonesian => AppLanguage('id', 'Bahasa Indonesia');
  static AppLanguage get interlingua => AppLanguage('ia', 'Interlingua');
  static AppLanguage get interlingue => AppLanguage('ie', 'Interlingue');
  static AppLanguage get inuktitut => AppLanguage('iu', 'ᐃᓄᒃᑎᑐᑦ');
  static AppLanguage get inupiaq => AppLanguage('ik', 'Iñupiaq');
  static AppLanguage get irish => AppLanguage('ga', 'Gaeilge');
  static AppLanguage get italian => AppLanguage('it', 'italiano');
  static AppLanguage get japanese => AppLanguage('ja', '日本語');
  static AppLanguage get javanese => AppLanguage('jv', 'basa Jawa');
  static AppLanguage get kalaallisut => AppLanguage('kl', 'kalaallisut');
  static AppLanguage get kannada => AppLanguage('kn', 'ಕನ್ನಡ');
  static AppLanguage get kanuri => AppLanguage('kr', 'Kanuri');
  static AppLanguage get kashmiri => AppLanguage('ks', 'कश्मीरी');
  static AppLanguage get kazakh => AppLanguage('kk', 'қазақ тілі');
  static AppLanguage get kikuyu => AppLanguage('ki', 'Gĩkũyũ');
  static AppLanguage get kinyarwanda => AppLanguage('rw', 'Ikinyarwanda');
  static AppLanguage get kirghiz => AppLanguage('ky', 'Кыргызча');
  static AppLanguage get komi => AppLanguage('kv', 'коми кыв');
  static AppLanguage get kongo => AppLanguage('kg', 'Kikongo');
  static AppLanguage get korean => AppLanguage('ko', '한국어');
  static AppLanguage get kuanyama => AppLanguage('kj', 'Kuanyama');
  static AppLanguage get kurdish => AppLanguage('ku', 'Kurdî');
  static AppLanguage get lao => AppLanguage('lo', 'ພາສາລາວ');
  static AppLanguage get latin => AppLanguage('la', 'latine');
  static AppLanguage get latvian => AppLanguage('lv', 'latviešu valoda');
  static AppLanguage get limburgan => AppLanguage('li', 'Limburgs');
  static AppLanguage get lingala => AppLanguage('ln', 'Lingála');
  static AppLanguage get lithuanian => AppLanguage('lt', 'lietuvių kalba');
  static AppLanguage get lubaKatanga => AppLanguage('lu', 'Tshiluba');
  static AppLanguage get luxembourgish => AppLanguage('lb', 'Lëtzebuergesch');
  static AppLanguage get macedonian => AppLanguage('mk', 'македонски јазик');
  static AppLanguage get malagasy => AppLanguage('mg', 'Malagasy fiteny');
  static AppLanguage get malay => AppLanguage('ms', 'bahasa Melayu');
  static AppLanguage get malayalam => AppLanguage('ml', 'മലയാളം');
  static AppLanguage get maltese => AppLanguage('mt', 'Malti');
  static AppLanguage get manx => AppLanguage('gv', 'Gaelg');
  static AppLanguage get maori => AppLanguage('mi', 'te reo Māori');
  static AppLanguage get marathi => AppLanguage('mr', 'मराठी');
  static AppLanguage get marshallese => AppLanguage('mh', 'Kajin M̧ajeļ');
  static AppLanguage get mongolian => AppLanguage('mn', 'Монгол хэл');
  static AppLanguage get nauru => AppLanguage('na', 'Ekakairũ Naoero');
  static AppLanguage get navajo => AppLanguage('nv', 'Diné bizaad');
  static AppLanguage get ndebeleNorth => AppLanguage('nd', 'isiNdebele');
  static AppLanguage get ndebeleSouth => AppLanguage('nr', 'isiNdebele');
  static AppLanguage get ndonga => AppLanguage('ng', 'Owambo');
  static AppLanguage get nepali => AppLanguage('ne', 'नेपाली');
  static AppLanguage get northernSami => AppLanguage('se', 'Davvisámegiella');
  static AppLanguage get norwegian => AppLanguage('no', 'Norsk');
  static AppLanguage get norwegianNynorsk => AppLanguage('nn', 'Norsk nynorsk');
  static AppLanguage get occitan => AppLanguage('oc', 'occitan, lenga d\'òc');
  static AppLanguage get ojibwa => AppLanguage('oj', 'ᐊᓂᔑᓈᐯᒧᐎᓐ');
  static AppLanguage get oriya => AppLanguage('or', 'ଓଡ଼ିଆ');
  static AppLanguage get oromo => AppLanguage('om', 'Afaan Oromoo');
  static AppLanguage get ossetian => AppLanguage('os', 'ирон æвзаг');
  static AppLanguage get pali => AppLanguage('pi', 'पाऴि');
  static AppLanguage get panjabi => AppLanguage('pa', 'ਪੰਜਾਬੀ');
  static AppLanguage get persian => AppLanguage('fa', 'فارسی');
  static AppLanguage get polish => AppLanguage('pl', 'Polski');
  static AppLanguage get portuguese => AppLanguage('pt', 'Português');
  static AppLanguage get pushto => AppLanguage('ps', 'پښتو');
  static AppLanguage get quechua => AppLanguage('qu', 'Runa Simi');
  static AppLanguage get romanian => AppLanguage('ro', 'română');
  static AppLanguage get romansh => AppLanguage('rm', 'rumantsch grischun');
  static AppLanguage get rundi => AppLanguage('rn', 'Ikirundi');
  static AppLanguage get russian => AppLanguage('ru', 'русский язык');
  static AppLanguage get samoan => AppLanguage('sm', 'gagana fa\'a Samoa');
  static AppLanguage get sango => AppLanguage('sg', 'yângâ tî sängö');
  static AppLanguage get sanskrit => AppLanguage('sa', 'संस्कृतम्');
  static AppLanguage get sardinian => AppLanguage('sc', 'sardu');
  static AppLanguage get serbian => AppLanguage('sr', 'српски језик');
  static AppLanguage get shona => AppLanguage('sn', 'chiShona');
  static AppLanguage get sichuanYi => AppLanguage('ii', 'ꆈꌠ꒿ Nuosuhxop');
  static AppLanguage get sindhi => AppLanguage('sd', 'सिन्धी');
  static AppLanguage get sinhala => AppLanguage('si', 'සිංහල');
  static AppLanguage get slovak => AppLanguage('sk', 'slovenčina');
  static AppLanguage get slovenian => AppLanguage('sl', 'slovenski jezik');
  static AppLanguage get somali => AppLanguage('so', 'Soomaaliga');
  static AppLanguage get sothoSouthern => AppLanguage('st', 'Sesotho');
  static AppLanguage get spanish => AppLanguage('es', 'Español');
  static AppLanguage get sundanese => AppLanguage('su', 'Basa Sunda');
  static AppLanguage get swahili => AppLanguage('sw', 'Kiswahili');
  static AppLanguage get swati => AppLanguage('ss', 'SiSwati');
  static AppLanguage get swedish => AppLanguage('sv', 'Svenska');
  static AppLanguage get tagalog => AppLanguage('tl', 'Wikang Tagalog');
  static AppLanguage get tahitian => AppLanguage('ty', 'Reo Tahiti');
  static AppLanguage get tajik => AppLanguage('tg', 'тоҷикӣ');
  static AppLanguage get tamil => AppLanguage('ta', 'தமிழ்');
  static AppLanguage get tatar => AppLanguage('tt', 'татарча, tatarça, تاتارچا');
  static AppLanguage get telugu => AppLanguage('te', 'తెలుగు');
  static AppLanguage get thai => AppLanguage('th', 'ไทย');
  static AppLanguage get tibetan => AppLanguage('bo', 'བོད་ཡིག');
  static AppLanguage get tigrinya => AppLanguage('ti', 'ትግርኛ');
  static AppLanguage get tongaTongaIslands => AppLanguage('to', 'faka Tonga');
  static AppLanguage get tsonga => AppLanguage('ts', 'Xitsonga');
  static AppLanguage get tswana => AppLanguage('tn', 'Setswana');
  static AppLanguage get turkish => AppLanguage('tr', 'Türkçe');
  static AppLanguage get turkmen => AppLanguage('tk', 'Türkmen');
  static AppLanguage get twi => AppLanguage('tw', 'Twi');
  static AppLanguage get uighur => AppLanguage('ug', 'ئۇيغۇرچە');
  static AppLanguage get ukrainian => AppLanguage('uk', 'українська');
  static AppLanguage get urdu => AppLanguage('ur', 'اردو');
  static AppLanguage get uzbek => AppLanguage('uz', 'Oʻzbek');
  static AppLanguage get venda => AppLanguage('ve', 'Tshivenḓa');
  static AppLanguage get vietnamese => AppLanguage('vi', 'Tiếng Việt');
  static AppLanguage get volapuk => AppLanguage('vo', 'Volapük');
  static AppLanguage get walloon => AppLanguage('wa', 'walon');
  static AppLanguage get welsh => AppLanguage('cy', 'Cymraeg');
  static AppLanguage get westernFrisian => AppLanguage('fy', 'Frysk');
  static AppLanguage get wolof => AppLanguage('wo', 'Wollof');
  static AppLanguage get xhosa => AppLanguage('xh', 'isiXhosa');
  static AppLanguage get yiddish => AppLanguage('yi', 'ייִדיש');
  static AppLanguage get yoruba => AppLanguage('yo', 'Yorùbá');
  static AppLanguage get zhuang => AppLanguage('za', 'Saɯ cueŋƅ');
  static AppLanguage get zulu => AppLanguage('zu', 'isiZulu');

  static List<AppLanguage> defaultLanguages = [
    CustomLanguages.abkhazian,
    CustomLanguages.afar,
    CustomLanguages.afrikaans,
    CustomLanguages.akan,
    CustomLanguages.albanian,
    CustomLanguages.amharic,
    CustomLanguages.arabic,
    CustomLanguages.aragonese,
    CustomLanguages.armenian,
    CustomLanguages.assamese,
    CustomLanguages.avaric,
    CustomLanguages.avestan,
    CustomLanguages.aymara,
    CustomLanguages.azerbaijani,
    CustomLanguages.bambara,
    CustomLanguages.bashkir,
    CustomLanguages.basque,
    CustomLanguages.belarusian,
    CustomLanguages.bengali,
    CustomLanguages.bihariLanguages,
    CustomLanguages.bislama,
    CustomLanguages.bosnian,
    CustomLanguages.breton,
    CustomLanguages.bulgarian,
    CustomLanguages.burmese,
    CustomLanguages.catalan,
    CustomLanguages.centralKhmer,
    CustomLanguages.chamorro,
    CustomLanguages.chechen,
    CustomLanguages.chewaNyanja,
    CustomLanguages.chineseSimplified,
    CustomLanguages.chineseTraditional,
    CustomLanguages.churchSlavonic,
    CustomLanguages.chuvash,
    CustomLanguages.cornish,
    CustomLanguages.corsican,
    CustomLanguages.cree,
    CustomLanguages.croatian,
    CustomLanguages.czech,
    CustomLanguages.danish,
    CustomLanguages.dhivehi,
    CustomLanguages.dutch,
    CustomLanguages.dzongkha,
    CustomLanguages.english,
    CustomLanguages.esperanto,
    CustomLanguages.estonian,
    CustomLanguages.ewe,
    CustomLanguages.faroese,
    CustomLanguages.fijian,
    CustomLanguages.finnish,
    CustomLanguages.french,
    CustomLanguages.fulah,
    CustomLanguages.gaelic,
    CustomLanguages.galician,
    CustomLanguages.ganda,
    CustomLanguages.georgian,
    CustomLanguages.german,
    CustomLanguages.greek,
    CustomLanguages.guarani,
    CustomLanguages.gujarati,
    CustomLanguages.haitian,
    CustomLanguages.hausa,
    CustomLanguages.hebrew,
    CustomLanguages.herero,
    CustomLanguages.hindi,
    CustomLanguages.hiriMotu,
    CustomLanguages.hungarian,
    CustomLanguages.icelandic,
    CustomLanguages.ido,
    CustomLanguages.igbo,
    CustomLanguages.indonesian,
    CustomLanguages.interlingua,
    CustomLanguages.interlingue,
    CustomLanguages.inuktitut,
    CustomLanguages.inupiaq,
    CustomLanguages.irish,
    CustomLanguages.italian,
    CustomLanguages.japanese,
    CustomLanguages.javanese,
    CustomLanguages.kalaallisut,
    CustomLanguages.kannada,
    CustomLanguages.kanuri,
    CustomLanguages.kashmiri,
    CustomLanguages.kazakh,
    CustomLanguages.kikuyu,
    CustomLanguages.kinyarwanda,
    CustomLanguages.kirghiz,
    CustomLanguages.komi,
    CustomLanguages.kongo,
    CustomLanguages.korean,
    CustomLanguages.kuanyama,
    CustomLanguages.kurdish,
    CustomLanguages.lao,
    CustomLanguages.latin,
    CustomLanguages.latvian,
    CustomLanguages.limburgan,
    CustomLanguages.lingala,
    CustomLanguages.lithuanian,
    CustomLanguages.lubaKatanga,
    CustomLanguages.luxembourgish,
    CustomLanguages.macedonian,
    CustomLanguages.malagasy,
    CustomLanguages.malay,
    CustomLanguages.malayalam,
    CustomLanguages.maltese,
    CustomLanguages.manx,
    CustomLanguages.maori,
    CustomLanguages.marathi,
    CustomLanguages.marshallese,
    CustomLanguages.mongolian,
    CustomLanguages.nauru,
    CustomLanguages.navajo,
    CustomLanguages.ndebeleNorth,
    CustomLanguages.ndebeleSouth,
    CustomLanguages.ndonga,
    CustomLanguages.nepali,
    CustomLanguages.northernSami,
    CustomLanguages.norwegian,
    CustomLanguages.norwegianNynorsk,
    CustomLanguages.occitan,
    CustomLanguages.ojibwa,
    CustomLanguages.oriya,
    CustomLanguages.oromo,
    CustomLanguages.ossetian,
    CustomLanguages.pali,
    CustomLanguages.panjabi,
    CustomLanguages.persian,
    CustomLanguages.polish,
    CustomLanguages.portuguese,
    CustomLanguages.pushto,
    CustomLanguages.quechua,
    CustomLanguages.romanian,
    CustomLanguages.romansh,
    CustomLanguages.rundi,
    CustomLanguages.russian,
    CustomLanguages.samoan,
    CustomLanguages.sango,
    CustomLanguages.sanskrit,
    CustomLanguages.sardinian,
    CustomLanguages.serbian,
    CustomLanguages.shona,
    CustomLanguages.sichuanYi,
    CustomLanguages.sindhi,
    CustomLanguages.sinhala,
    CustomLanguages.slovak,
    CustomLanguages.slovenian,
    CustomLanguages.somali,
    CustomLanguages.sothoSouthern,
    CustomLanguages.spanish,
    CustomLanguages.sundanese,
    CustomLanguages.swahili,
    CustomLanguages.swati,
    CustomLanguages.swedish,
    CustomLanguages.tagalog,
    CustomLanguages.tahitian,
    CustomLanguages.tajik,
    CustomLanguages.tamil,
    CustomLanguages.tatar,
    CustomLanguages.telugu,
    CustomLanguages.thai,
    CustomLanguages.tibetan,
    CustomLanguages.tigrinya,
    CustomLanguages.tongaTongaIslands,
    CustomLanguages.tsonga,
    CustomLanguages.tswana,
    CustomLanguages.turkish,
    CustomLanguages.turkmen,
    CustomLanguages.twi,
    CustomLanguages.uighur,
    CustomLanguages.ukrainian,
    CustomLanguages.urdu,
    CustomLanguages.uzbek,
    CustomLanguages.venda,
    CustomLanguages.vietnamese,
    CustomLanguages.volapuk,
    CustomLanguages.walloon,
    CustomLanguages.welsh,
    CustomLanguages.westernFrisian,
    CustomLanguages.wolof,
    CustomLanguages.xhosa,
    CustomLanguages.yiddish,
    CustomLanguages.yoruba,
    CustomLanguages.zhuang,
    CustomLanguages.zulu
  ];
}
