import 'Helpers.dart';

class BibleParser {

  Map<String, String> standardAbbreviation = {};

  // SBL-style abbreviations
  Map<String, String> standardAbbreviationENG = {
    "1": "Gen",
    "2": "Exod",
    "3": "Lev",
    "4": "Num",
    "5": "Deut",
    "6": "Josh",
    "7": "Judg",
    "8": "Ruth",
    "9": "1Sam",
    "10": "2Sam",
    "11": "1Kgs",
    "12": "2Kgs",
    "13": "1Chr",
    "14": "2Chr",
    "15": "Ezra",
    "16": "Neh",
    "17": "Esth",
    "18": "Job",
    "19": "Ps",
    "20": "Prov",
    "21": "Eccl",
    "22": "Song",
    "23": "Isa",
    "24": "Jer",
    "25": "Lam",
    "26": "Ezek",
    "27": "Dan",
    "28": "Hos",
    "29": "Joel",
    "30": "Amos",
    "31": "Obad",
    "32": "Jonah",
    "33": "Mic",
    "34": "Nah",
    "35": "Hab",
    "36": "Zeph",
    "37": "Hag",
    "38": "Zech",
    "39": "Mal",
    "40": "Matt",
    "41": "Mark",
    "42": "Luke",
    "43": "John",
    "44": "Acts",
    "45": "Rom",
    "46": "1Cor",
    "47": "2Cor",
    "48": "Gal",
    "49": "Eph",
    "50": "Phil",
    "51": "Col",
    "52": "1Thess",
    "53": "2Thess",
    "54": "1Tim",
    "55": "2Tim",
    "56": "Titus",
    "57": "Phlm",
    "58": "Heb",
    "59": "Jas",
    "60": "1Pet",
    "61": "2Pet",
    "62": "1John",
    "63": "2John",
    "64": "3John",
    "65": "Jude",
    "66": "Rev",
    "70": "Bar",
    "71": "AddDan",
    "72": "PrAzar",
    "73": "Bel",
    "75": "Sus",
    "76": "1Esd",
    "77": "2Esd",
    "78": "AddEsth",
    "79": "EpJer",
    "80": "Jdt",
    "81": "1Macc",
    "82": "2Macc",
    "83": "3Macc",
    "84": "4Macc",
    "85": "PrMan",
    "86": "Ps151",
    "87": "Sir",
    "88": "Tob",
    "89": "Wis",
    "90": "PssSol",
    "91": "Odes",
    "92": "EpLao",
  };

  Map<String, String> standardAbbreviationTC = {
    "1": "創",
    "2": "出",
    "3": "利",
    "4": "民",
    "5": "申",
    "6": "書",
    "7": "士",
    "8": "得",
    "9": "撒上",
    "10": "撒下",
    "11": "王上",
    "12": "王下",
    "13": "代上",
    "14": "代下",
    "15": "拉",
    "16": "尼",
    "17": "斯",
    "18": "伯",
    "19": "詩",
    "20": "箴",
    "21": "傳",
    "22": "歌",
    "23": "賽",
    "24": "耶",
    "25": "哀",
    "26": "結",
    "27": "但",
    "28": "何",
    "29": "珥",
    "30": "摩",
    "31": "俄",
    "32": "拿",
    "33": "彌",
    "34": "鴻",
    "35": "哈",
    "36": "番",
    "37": "該",
    "38": "亞",
    "39": "瑪",
    "40": "太",
    "41": "可",
    "42": "路",
    "43": "約",
    "44": "徒",
    "45": "羅",
    "46": "林前",
    "47": "林後",
    "48": "加",
    "49": "弗",
    "50": "腓",
    "51": "西",
    "52": "帖前",
    "53": "帖後",
    "54": "提前",
    "55": "提後",
    "56": "多",
    "57": "門",
    "58": "來",
    "59": "雅",
    "60": "彼前",
    "61": "彼後",
    "62": "約一",
    "63": "約二",
    "64": "約三",
    "65": "猶",
    "66": "啟",
    "70": "Bar",
    "71": "AddDan",
    "72": "三童歌",
    "73": "比勒與大龍",
    "75": "蘇撒拿傳",
    "76": "以斯拉續篇上卷",
    "77": "以斯拉續篇下卷",
    "78": "以斯帖補編",
    "79": "耶利米書信",
    "80": "猶滴傳",
    "81": "馬加比一書",
    "82": "馬加比二書",
    "83": "馬加比三書",
    "84": "馬加比四書",
    "85": "瑪拿西禱言",
    "86": "詩篇一五一",
    "87": "便西拉智訓",
    "88": "多比傳",
    "89": "所羅門智訓",
    "90": "PssSol",
    "91": "Odes",
    "92": "EpLao",
  };

  Map<String, String> standardAbbreviationSC = {
    "1": "创",
    "2": "出",
    "3": "利",
    "4": "民",
    "5": "申",
    "6": "书",
    "7": "士",
    "8": "得",
    "9": "撒上",
    "10": "撒下",
    "11": "王上",
    "12": "王下",
    "13": "代上",
    "14": "代下",
    "15": "拉",
    "16": "尼",
    "17": "斯",
    "18": "伯",
    "19": "诗",
    "20": "箴",
    "21": "传",
    "22": "歌",
    "23": "赛",
    "24": "耶",
    "25": "哀",
    "26": "结",
    "27": "但",
    "28": "何",
    "29": "珥",
    "30": "摩",
    "31": "俄",
    "32": "拿",
    "33": "弥",
    "34": "鸿",
    "35": "哈",
    "36": "番",
    "37": "该",
    "38": "亚",
    "39": "玛",
    "40": "太",
    "41": "可",
    "42": "路",
    "43": "约",
    "44": "徒",
    "45": "罗",
    "46": "林前",
    "47": "林后",
    "48": "加",
    "49": "弗",
    "50": "腓",
    "51": "西",
    "52": "帖前",
    "53": "帖后",
    "54": "提前",
    "55": "提后",
    "56": "多",
    "57": "门",
    "58": "来",
    "59": "雅",
    "60": "彼前",
    "61": "彼后",
    "62": "约一",
    "63": "约二",
    "64": "约三",
    "65": "犹",
    "66": "启",
    "70": "Bar",
    "71": "AddDan",
    "72": "三童歌",
    "73": "比勒与大龙",
    "75": "苏撒拿传",
    "76": "以斯拉续篇上卷",
    "77": "以斯拉续篇下卷",
    "78": "以斯帖补编",
    "79": "耶利米书信",
    "80": "犹滴传",
    "81": "马加比一书",
    "82": "马加比二书",
    "83": "马加比三书",
    "84": "马加比四书",
    "85": "玛拿西祷言",
    "86": "诗篇一五一",
    "87": "便西拉智训",
    "88": "多比传",
    "89": "所罗门智训",
    "90": "PssSol",
    "91": "Odes",
    "92": "EpLao",
  };

  // mapping bible book abbreviation / bible book name to book number
  Map<String, String> bibleBookNo = {
    "Ge.": "1",
    "Gen.": "1",
    "GEN.": "1",
    "Genesis": "1",
    "Gn.": "1",
    "Ex.": "2",
    "Exo.": "2",
    "EXO.": "2",
    "Exod.": "2",
    "Exodus": "2",
    "Le.": "3",
    "Lev.": "3",
    "LEV.": "3",
    "Leviticus": "3",
    "Lv.": "3",
    "Nb.": "4",
    "Nm.": "4",
    "Nu.": "4",
    "Num.": "4",
    "NUM.": "4",
    "Numbers": "4",
    "De.": "5",
    "Deu.": "5",
    "DEU.": "5",
    "Deut.": "5",
    "Deuteronomy": "5",
    "Dt.": "5",
    "Jos.": "6",
    "JOS.": "6",
    "Josh.": "6",
    "JoshA.": "6",
    "Joshua": "6",
    "Jsa.": "6",
    "JSA.": "6",
    "Jsh.": "6",
    "Jdb.": "7",
    "JDB.": "7",
    "Jdg.": "7",
    "JDG.": "7",
    "Jdgs.": "7",
    "Jg.": "7",
    "Judg.": "7",
    "JudgB.": "7",
    "Judges": "7",
    "Rth.": "8",
    "Ru.": "8",
    "Rut.": "8",
    "RUT.": "8",
    "Ruth": "8",
    "1 S.": "9",
    "1 Sa.": "9",
    "1 Sam.": "9",
    "1 Samuel": "9",
    "1 Sm.": "9",
    "1S.": "9",
    "1Sa.": "9",
    "1SA.": "9",
    "1Sam.": "9",
    "1st Sam.": "9",
    "1st Samuel": "9",
    "First Sam.": "9",
    "First Samuel": "9",
    "I Sa.": "9",
    "I Sam.": "9",
    "2 S.": "10",
    "2 Sa.": "10",
    "2 Sam.": "10",
    "2 Samuel": "10",
    "2 Sm.": "10",
    "2nd Sam.": "10",
    "2nd Samuel": "10",
    "2S.": "10",
    "2Sa.": "10",
    "2SA.": "10",
    "2Sam.": "10",
    "II Sa.": "10",
    "II Sam.": "10",
    "Second Sam.": "10",
    "Second Samuel": "10",
    "1 Kgs.": "11",
    "1 Ki.": "11",
    "1 Kings": "11",
    "1K.": "11",
    "1Kg.": "11",
    "1Kgs.": "11",
    "1Ki.": "11",
    "1KI.": "11",
    "1Kin.": "11",
    "1st Kgs.": "11",
    "1st Kings": "11",
    "First Kgs.": "11",
    "First Kings": "11",
    "I Kgs.": "11",
    "I Ki.": "11",
    "2 Kgs.": "12",
    "2 Ki.": "12",
    "2 Kings": "12",
    "2K.": "12",
    "2Kg.": "12",
    "2Kgs.": "12",
    "2Ki.": "12",
    "2KI.": "12",
    "2Kin.": "12",
    "2nd Kgs.": "12",
    "2nd Kings": "12",
    "II Kgs.": "12",
    "II Ki.": "12",
    "Second Kgs.": "12",
    "Second Kings": "12",
    "1 Ch.": "13",
    "1 Chr.": "13",
    "1 Chron.": "13",
    "1 Chronicles": "13",
    "1Ch.": "13",
    "1CH.": "13",
    "1Chr.": "13",
    "1Chron.": "13",
    "1st Chron.": "13",
    "1st Chronicles": "13",
    "First Chron.": "13",
    "First Chronicles": "13",
    "I Ch.": "13",
    "I Chr.": "13",
    "I Chron.": "13",
    "2 Ch.": "14",
    "2 Chr.": "14",
    "2 Chron.": "14",
    "2 Chronicles": "14",
    "2Ch.": "14",
    "2CH.": "14",
    "2Chr.": "14",
    "2Chron.": "14",
    "2nd Chron.": "14",
    "2nd Chronicles": "14",
    "II Ch.": "14",
    "II Chr.": "14",
    "II Chron.": "14",
    "Second Chron.": "14",
    "Second Chronicles": "14",
    "Ez.": "15",
    "Ezr.": "15",
    "EZR.": "15",
    "Ezra": "15",
    "Ne.": "16",
    "Neh.": "16",
    "NEH.": "16",
    "Nehemiah": "16",
    "Es.": "17",
    "Est.": "17",
    "EST.": "17",
    "Esth.": "17",
    "Esther": "17",
    "Jb.": "18",
    "Job": "18",
    "JOB": "18",
    "Ps.": "19",
    "Psa.": "19",
    "PSA.": "19",
    "Psalm": "19",
    "Psalms": "19",
    "Pslm.": "19",
    "Psm.": "19",
    "Pr.": "20",
    "Pro.": "20",
    "PRO.": "20",
    "Prov.": "20",
    "Proverbs": "20",
    "Prv.": "20",
    "Ec.": "21",
    "Ecc.": "21",
    "ECC.": "21",
    "Eccl.": "21",
    "Eccle.": "21",
    "Eccles.": "21",
    "Ecclesiastes": "21",
    "Qoh.": "21",
    "Cant.": "22",
    "Canticle of Canticles": "22",
    "Canticles": "22",
    "Sg.": "22",
    "Sng.": "22",
    "SNG.": "22",
    "So.": "22",
    "Son.": "22",
    "Song": "22",
    "Song of Solomon": "22",
    "Song of Songs": "22",
    "SOS.": "22",
    "Is.": "23",
    "Isa.": "23",
    "ISA.": "23",
    "Isaiah": "23",
    "Je.": "24",
    "Jer.": "24",
    "JER.": "24",
    "Jeremiah": "24",
    "Jr.": "24",
    "La.": "25",
    "Lam.": "25",
    "LAM.": "25",
    "Lamentations": "25",
    "Lm.": "25",
    "Eze.": "26",
    "Ezek.": "26",
    "Ezekiel": "26",
    "Ezk.": "26",
    "EZK.": "26",
    "Da.": "27",
    "Dan.": "27",
    "DAN.": "27",
    "Daniel": "27",
    "Dn.": "27",
    "Ho.": "28",
    "Hos.": "28",
    "HOS.": "28",
    "Hosea": "28",
    "Hs.": "28",
    "Jl.": "29",
    "Joe.": "29",
    "Joel": "29",
    "Jol.": "29",
    "JOL.": "29",
    "Am.": "30",
    "Amo.": "30",
    "AMO.": "30",
    "Amos": "30",
    "Ob.": "31",
    "Oba.": "31",
    "OBA.": "31",
    "Obad.": "31",
    "Obadiah": "31",
    "Jnh.": "32",
    "Jon.": "32",
    "JON.": "32",
    "Jonah": "32",
    "Mc.": "33",
    "Mic.": "33",
    "MIC.": "33",
    "Micah": "33",
    "Na.": "34",
    "Nah.": "34",
    "Nahum": "34",
    "Nam.": "34",
    "NAM.": "34",
    "Hab.": "35",
    "HAB.": "35",
    "Habakkuk": "35",
    "Hb.": "35",
    "Zep.": "36",
    "ZEP.": "36",
    "Zeph.": "36",
    "Zephaniah": "36",
    "Zp.": "36",
    "Zph.": "36",
    "Hag.": "37",
    "HAG.": "37",
    "Haggai": "37",
    "Hg.": "37",
    "Zc.": "38",
    "Zch.": "38",
    "Zec.": "38",
    "ZEC.": "38",
    "Zech.": "38",
    "Zechariah": "38",
    "Mal.": "39",
    "MAL.": "39",
    "Malachi": "39",
    "Ml.": "39",
    "Mat.": "40",
    "MAT.": "40",
    "Matt.": "40",
    "Matthew": "40",
    "Mt.": "40",
    "Mar.": "41",
    "Mark": "41",
    "Mk.": "41",
    "Mr.": "41",
    "Mrk.": "41",
    "MRK.": "41",
    "Lk.": "42",
    "Luk.": "42",
    "LUK.": "42",
    "Luke": "42",
    "Jhn.": "43",
    "JHN.": "43",
    "Jn.": "43",
    "Joh.": "43",
    "John": "43",
    "Ac.": "44",
    "Act.": "44",
    "ACT.": "44",
    "Acts": "44",
    "Rm.": "45",
    "Ro.": "45",
    "Rom.": "45",
    "ROM.": "45",
    "Romans": "45",
    "1 Co.": "46",
    "1 Cor.": "46",
    "1 Corinthians": "46",
    "1Co.": "46",
    "1CO.": "46",
    "1Cor.": "46",
    "1Corinthians": "46",
    "1st Corinthians": "46",
    "First Corinthians": "46",
    "I Co.": "46",
    "I Cor.": "46",
    "I Corinthians": "46",
    "2 Co.": "47",
    "2 Cor.": "47",
    "2 Corinthians": "47",
    "2Co.": "47",
    "2CO.": "47",
    "2Cor.": "47",
    "2Corinthians": "47",
    "2nd Corinthians": "47",
    "II Co.": "47",
    "II Cor.": "47",
    "II Corinthians": "47",
    "Second Corinthians": "47",
    "Ga.": "48",
    "Gal.": "48",
    "GAL.": "48",
    "Galatians": "48",
    "Gl.": "48",
    "Eph.": "49",
    "EPH.": "49",
    "Ephes.": "49",
    "Ephesians": "49",
    "Phi.": "50",
    "Phil.": "50",
    "Philip.": "50",
    "Philippians": "50",
    "Php.": "50",
    "PHP.": "50",
    "Pp.": "50",
    "Co.": "51",
    "Col.": "51",
    "COL.": "51",
    "Colossians": "51",
    "1 Th.": "52",
    "1 Thes.": "52",
    "1 Thess.": "52",
    "1 Thessalonians": "52",
    "1st Thess.": "52",
    "1st Thessalonians": "52",
    "1Th.": "52",
    "1TH.": "52",
    "1Thes.": "52",
    "1Thess.": "52",
    "1Thessalonians": "52",
    "First Thess.": "52",
    "First Thessalonians": "52",
    "I Th.": "52",
    "I Thes.": "52",
    "I Thess.": "52",
    "I Thessalonians": "52",
    "2 Th.": "53",
    "2 Thes.": "53",
    "2 Thess.": "53",
    "2 Thessalonians": "53",
    "2nd Thess.": "53",
    "2nd Thessalonians": "53",
    "2Th.": "53",
    "2TH.": "53",
    "2Thes.": "53",
    "2Thess.": "53",
    "2Thessalonians": "53",
    "II Th.": "53",
    "II Thes.": "53",
    "II Thess.": "53",
    "II Thessalonians": "53",
    "Second Thess.": "53",
    "Second Thessalonians": "53",
    "1 Ti.": "54",
    "1 Tim.": "54",
    "1 Timothy": "54",
    "1st Tim.": "54",
    "1st Timothy": "54",
    "1Ti.": "54",
    "1TI.": "54",
    "1Tim.": "54",
    "1Timothy": "54",
    "1Tm.": "54",
    "First Tim.": "54",
    "First Timothy": "54",
    "I Ti.": "54",
    "I Tim.": "54",
    "I Timothy": "54",
    "2 Ti.": "55",
    "2 Tim.": "55",
    "2 Timothy": "55",
    "2nd Tim.": "55",
    "2nd Timothy": "55",
    "2Ti.": "55",
    "2TI.": "55",
    "2Tim.": "55",
    "2Timothy": "55",
    "2Tm.": "55",
    "II Ti.": "55",
    "II Tim.": "55",
    "II Timothy": "55",
    "Second Tim.": "55",
    "Second Timothy": "55",
    "ti.": "56",
    "Tit.": "56",
    "TIT.": "56",
    "Titus": "56",
    "Philem.": "57",
    "Philemon": "57",
    "Phlm.": "57",
    "Phm.": "57",
    "PHM.": "57",
    "Pm.": "57",
    "Heb.": "58",
    "HEB.": "58",
    "Hebrews": "58",
    "Jam.": "59",
    "James": "59",
    "Jas.": "59",
    "JAS.": "59",
    "Jms.": "59",
    "Jm.": "59",
    "Js.": "59",
    "1 P.": "60",
    "1 Pe.": "60",
    "1 Pet.": "60",
    "1 Peter": "60",
    "1 Pt.": "60",
    "1P.": "60",
    "1Pe.": "60",
    "1PE.": "60",
    "1Pet.": "60",
    "1Peter": "60",
    "1Pt.": "60",
    "1st Peter": "60",
    "First Peter": "60",
    "I Pe.": "60",
    "I Pet.": "60",
    "I Peter": "60",
    "I Pt.": "60",
    "2 P.": "61",
    "2 Pe.": "61",
    "2 Pet.": "61",
    "2 Peter": "61",
    "2 Pt.": "61",
    "2nd Peter": "61",
    "2P.": "61",
    "2Pe.": "61",
    "2PE.": "61",
    "2Pet.": "61",
    "2Peter": "61",
    "2Pt.": "61",
    "II Pe.": "61",
    "II Pet.": "61",
    "II Peter": "61",
    "II Pt.": "61",
    "Second Peter": "61",
    "1 J.": "62",
    "1 Jhn.": "62",
    "1 Jn.": "62",
    "1 John": "62",
    "1J.": "62",
    "1Jhn.": "62",
    "1Jn.": "62",
    "1JN.": "62",
    "1Jo.": "62",
    "1Joh.": "62",
    "1John": "62",
    "1st John": "62",
    "First John": "62",
    "I Jhn.": "62",
    "I Jn.": "62",
    "I Jo.": "62",
    "I Joh.": "62",
    "I John": "62",
    "2 J.": "63",
    "2 Jhn.": "63",
    "2 Jn.": "63",
    "2 John": "63",
    "2J.": "63",
    "2Jhn.": "63",
    "2Jn.": "63",
    "2JN.": "63",
    "2Jo.": "63",
    "2Joh.": "63",
    "2John": "63",
    "2nd John": "63",
    "II Jhn.": "63",
    "II Jn.": "63",
    "II Jo.": "63",
    "II Joh.": "63",
    "II John": "63",
    "Second John": "63",
    "3 J.": "64",
    "3 Jhn.": "64",
    "3 Jn.": "64",
    "3 John": "64",
    "3J.": "64",
    "3Jhn.": "64",
    "3Jn.": "64",
    "3JN.": "64",
    "3Jo.": "64",
    "3Joh.": "64",
    "3John": "64",
    "3rd John": "64",
    "III Jhn.": "64",
    "III Jn.": "64",
    "III Jo.": "64",
    "III Joh.": "64",
    "III John": "64",
    "Third John": "64",
    "Jd.": "65",
    "Jud.": "65",
    "JUD.": "65",
    "Jude": "65",
    "Apocalypse of John": "66",
    "Re.": "66",
    "Rev.": "66",
    "REV.": "66",
    "Revelation": "66",
    "Revelation to John": "66",
    "Rv.": "66",
    "The Revelation": "66",
    "Bar.": "70",
    "BAR.": "70",
    "Baruch": "70",
    "Add. Dan.": "71",
    "Adddan.": "71",
    "AddDan.": "71",
    "Additions to Daniel": "71",
    "Dag.": "71",
    "DAG.": "71",
    "DanGr.": "71",
    "DanTh.": "71",
    "Dnt.": "71",
    "DNT.": "71",
    "Azariah": "72",
    "Pr. Az.": "72",
    "Pr. Azar.": "72",
    "Prayer of Azariah": "72",
    "PrAzar.": "72",
    "S3Y.": "72",
    "Sg. of 3 Childr.": "72",
    "Sg. Three": "72",
    "Song of the Three Holy Children": "72",
    "Song of Thr.": "72",
    "Song of Three": "72",
    "Song of Three Children": "72",
    "Song of Three Jews": "72",
    "Song of Three Youths": "72",
    "Song Thr.": "72",
    "The Song of the Three Holy Children": "72",
    "The Song of Three Jews": "72",
    "The Song of Three Youths": "72",
    "Bel": "73",
    "BEL": "73",
    "Bel and Dr.": "73",
    "Bel and the Dragon": "73",
    "Bel.": "73",
    "BelTh.": "73",
    "Blt.": "73",
    "BLT.": "73",
    "Sst.": "75",
    "SST.": "75",
    "Sus.": "75",
    "SUS.": "75",
    "Susanna": "75",
    "SusTh.": "75",
    "1 Esd.": "76",
    "1 Esdr.": "76",
    "1 Esdras": "76",
    "1Es.": "76",
    "1ES.": "76",
    "1Esd.": "76",
    "1Esdr.": "76",
    "1Esdras.": "76",
    "1st Esdras": "76",
    "First Esdras": "76",
    "I Es.": "76",
    "I Esd.": "76",
    "I Esdr.": "76",
    "I Esdras": "76",
    "2 Esd.": "77",
    "2 Esdr.": "77",
    "2 Esdras": "77",
    "2Es.": "77",
    "2ES.": "77",
    "2Esd.": "77",
    "2Esdr.": "77",
    "2Esdras": "77",
    "2nd Esdras": "77",
    "II Es.": "77",
    "II Esd.": "77",
    "II Esdr.": "77",
    "II Esdras": "77",
    "Second Esdras": "77",
    "Add. Es.": "78",
    "Add. Esth.": "78",
    "AddEsth.": "78",
    "Additions to Esther": "78",
    "Ade.": "78",
    "ADE.": "78",
    "AEs.": "78",
    "Esg.": "78",
    "ESG.": "78",
    "EsthGr.": "78",
    "Rest of Esther": "78",
    "The Rest of Esther": "78",
    "Ep. Jer.": "79",
    "EpJer.": "79",
    "Let. Jer.": "79",
    "Letter of Jeremiah": "79",
    "Lje.": "79",
    "LJe.": "79",
    "LJE.": "79",
    "Ltr. Jer.": "79",
    "Jdt.": "80",
    "JDT.": "80",
    "Jdth.": "80",
    "Jth.": "80",
    "Judith": "80",
    "1 Mac.": "81",
    "1 Macc.": "81",
    "1 Maccabees": "81",
    "1M.": "81",
    "1Ma.": "81",
    "1MA.": "81",
    "1Mac.": "81",
    "1Macc.": "81",
    "1Maccabees": "81",
    "1st Maccabees": "81",
    "First Maccabees": "81",
    "I Ma.": "81",
    "I Mac.": "81",
    "I Macc.": "81",
    "I Maccabees": "81",
    "2 Mac.": "82",
    "2 Macc.": "82",
    "2 Maccabees": "82",
    "2M.": "82",
    "2Ma.": "82",
    "2MA.": "82",
    "2Mac.": "82",
    "2Macc.": "82",
    "2Maccabees": "82",
    "2nd Maccabees": "82",
    "II Ma.": "82",
    "II Mac.": "82",
    "II Macc.": "82",
    "II Maccabees": "82",
    "Second Maccabees": "82",
    "3 Mac.": "83",
    "3 Macc.": "83",
    "3 Maccabees": "83",
    "3M.": "83",
    "3Ma.": "83",
    "3MA.": "83",
    "3Mac.": "83",
    "3Macc.": "83",
    "3Maccabees": "83",
    "3rd Maccabees": "83",
    "III Ma.": "83",
    "III Mac.": "83",
    "III Macc.": "83",
    "III Maccabees": "83",
    "Third Maccabees": "83",
    "4 Mac.": "84",
    "4 Macc.": "84",
    "4 Maccabees": "84",
    "4M.": "84",
    "4Ma.": "84",
    "4MA.": "84",
    "4Mac.": "84",
    "4Macc.": "84",
    "4Maccabees": "84",
    "4th Maccabees": "84",
    "Fourth Maccabees": "84",
    "IV Ma.": "84",
    "IV Mac.": "84",
    "IV Macc.": "84",
    "IV Maccabees": "84",
    "Man.": "85",
    "MAN.": "85",
    "PMa.": "85",
    "Pr. Man": "85",
    "Pr. of Man.": "85",
    "Prayer of Manasseh": "85",
    "Prayer of Manasses": "85",
    "PrMan.": "85",
    "Add. Ps.": "86",
    "Add. Psalm": "86",
    "Additional Psalm": "86",
    "AddPs.": "86",
    "Ps. 151": "86",
    "Ps2.": "86",
    "PS2.": "86",
    "Ps151": "86",
    "Psalm 151": "86",
    "Ecclesiasticus": "87",
    "Ecclus.": "87",
    "Sir.": "87",
    "SIR.": "87",
    "Sirach": "87",
    "Sirp.": "87",
    "SirP.": "87",
    "Tb.": "88",
    "Tbs.": "88",
    "TBS.": "88",
    "TOB": "88",
    "Tob.": "88",
    "Tobit": "88",
    "TobS.": "88",
    "Wis.": "89",
    "WIS.": "89",
    "Wisd. of Sol.": "89",
    "Wisdom": "89",
    "Wisdom of Solomon": "89",
    "Ws.": "89",
    "Ps. Sol.": "90",
    "Ps. Solomon": "90",
    "Psalms of Solomon": "90",
    "Psalms Solomon": "90",
    "Pss.": "90",
    "PSS.": "90",
    "PsSol.": "90",
    "PssSol.": "90",
    "Oda.": "91",
    "ODA.": "91",
    "Ode.": "91",
    "Odes": "91",
    "Ep. Lao.": "92",
    "Ep. Laod.": "92",
    "Epist. Laodiceans": "92",
    "Epistle Laodiceans": "92",
    "Epistle to Laodiceans": "92",
    "Epistle to the Laodiceans": "92",
    "EpLao.": "92",
    "Lao.": "92",
    "Laod.": "92",
    "Laodiceans": "92",
    "创": "1", // Chinese book names & abbreviations
    "创世记": "1",
    "創": "1",
    "創世記": "1",
    "出": "2",
    "出埃及記": "2",
    "出埃及记": "2",
    "利": "3",
    "利未記": "3",
    "利未记": "3",
    "民": "4",
    "民数记": "4",
    "民數記": "4",
    "申": "5",
    "申命記": "5",
    "申命记": "5",
    "书": "6",
    "書": "6",
    "約書亞記": "6",
    "约书亚记": "6",
    "士": "7",
    "士师记": "7",
    "士師記": "7",
    "得": "8",
    "路得記": "8",
    "路得记": "8",
    "撒上": "9",
    "撒母耳記上": "9",
    "撒母耳记上": "9",
    "撒下": "10",
    "撒母耳記下": "10",
    "撒母耳记下": "10",
    "列王紀上": "11",
    "列王纪上": "11",
    "王上": "11",
    "列王紀下": "12",
    "列王纪下": "12",
    "王下": "12",
    "代上": "13",
    "历代志上": "13",
    "歷代志上": "13",
    "代下": "14",
    "历代志下": "14",
    "歷代志下": "14",
    "以斯拉記": "15",
    "以斯拉记": "15",
    "拉": "15",
    "尼": "16",
    "尼希米記": "16",
    "尼希米记": "16",
    "以斯帖記": "17",
    "以斯帖记": "17",
    "斯": "17",
    "伯": "18",
    "約伯記": "18",
    "约伯记": "18",
    "詩": "19",
    "詩篇": "19",
    "诗": "19",
    "诗篇": "19",
    "箴": "20",
    "箴言": "20",
    "传": "21",
    "传道书": "21",
    "傳": "21",
    "傳道書": "21",
    "歌": "22",
    "雅歌": "22",
    "以賽亞書": "23",
    "以赛亚书": "23",
    "賽": "23",
    "赛": "23",
    "耶": "24",
    "耶利米书": "24",
    "耶利米書": "24",
    "哀": "25",
    "耶利米哀歌": "25",
    "以西結書": "26",
    "以西结书": "26",
    "結": "26",
    "结": "26",
    "但": "27",
    "但以理书": "27",
    "但以理書": "27",
    "何": "28",
    "何西阿书": "28",
    "何西阿書": "28",
    "珥": "29",
    "約珥書": "29",
    "约珥书": "29",
    "摩": "30",
    "阿摩司书": "30",
    "阿摩司書": "30",
    "俄": "31",
    "俄巴底亚书": "31",
    "俄巴底亞書": "31",
    "拿": "32",
    "約拿書": "32",
    "约拿书": "32",
    "弥": "33",
    "弥迦书": "33",
    "彌": "33",
    "彌迦書": "33",
    "那鴻書": "34",
    "那鸿书": "34",
    "鴻": "34",
    "鸿": "34",
    "哈": "35",
    "哈巴谷书": "35",
    "哈巴谷書": "35",
    "番": "36",
    "西番雅书": "36",
    "西番雅書": "36",
    "哈該書": "37",
    "哈该书": "37",
    "該": "37",
    "该": "37",
    "亚": "38",
    "亞": "38",
    "撒迦利亚书": "38",
    "撒迦利亞書": "38",
    "玛": "39",
    "玛拉基书": "39",
    "瑪": "39",
    "瑪拉基書": "39",
    "太": "40",
    "馬太福音": "40",
    "马太福音": "40",
    "可": "41",
    "馬可福音": "41",
    "马可福音": "41",
    "路": "42",
    "路加福音": "42",
    "約": "43",
    "約翰福音": "43",
    "约": "43",
    "约翰福音": "43",
    "使徒行传": "44",
    "使徒行傳": "44",
    "徒": "44",
    "罗": "45",
    "罗马书": "45",
    "羅": "45",
    "羅馬書": "45",
    "哥林多前书": "46",
    "哥林多前書": "46",
    "林前": "46",
    "哥林多后书": "47",
    "哥林多後書": "47",
    "林后": "47",
    "林後": "47",
    "加": "48",
    "加拉太书": "48",
    "加拉太書": "48",
    "以弗所书": "49",
    "以弗所書": "49",
    "弗": "49",
    "腓": "50",
    "腓利比书": "50",
    "腓利比書": "50",
    "歌罗西书": "51",
    "歌羅西書": "51",
    "西": "51",
    "帖前": "52",
    "帖撒罗尼迦前书": "52",
    "帖撒羅尼迦前書": "52",
    "帖后": "53",
    "帖後": "53",
    "帖撒罗尼迦后书": "53",
    "帖撒羅尼迦後書": "53",
    "提前": "54",
    "提摩太前书": "54",
    "提摩太前書": "54",
    "提后": "55",
    "提後": "55",
    "提摩太后书": "55",
    "提摩太後書": "55",
    "多": "56",
    "提多书": "56",
    "提多書": "56",
    "腓利門書": "57",
    "腓利门书": "57",
    "門": "57",
    "门": "57",
    "來": "58",
    "希伯來書": "58",
    "希伯来书": "58",
    "来": "58",
    "雅": "59",
    "雅各书": "59",
    "雅各書": "59",
    "彼前": "60",
    "彼得前书": "60",
    "彼得前書": "60",
    "彼后": "61",
    "彼後": "61",
    "彼得后书": "61",
    "彼得後書": "61",
    "約一": "62",
    "約翰壹書": "62",
    "约一": "62",
    "约翰壹书": "62",
    "約二": "63",
    "約翰貳書": "63",
    "约二": "63",
    "约翰贰书": "63",
    "約三": "64",
    "約翰參書": "64",
    "约三": "64",
    "约翰参书": "64",
    "犹": "65",
    "犹大书": "65",
    "猶": "65",
    "猶大書": "65",
    "启": "66",
    "启示录": "66",
    "啟": "66",
    "啟示錄": "66",
/*
    "1 ин": "62", // Russian book names & abbreviations
    "1 Ин": "62",
    "1 иоанна": "62",
    "1 Иоанна": "62",
    "1 кор": "46",
    "1 Кор": "46",
    "1 коринфянам": "46",
    "1 Коринфянам": "46",
    "1 ма": "81",
    "1 Ма": "81",
    "1 маккавеев": "81",
    "1 Маккавеев": "81",
    "1 пар": "13",
    "1 Пар": "13",
    "1 паралипоменон": "13",
    "1 Паралипоменон": "13",
    "1 пет": "60",
    "1 Пет": "60",
    "1 петра": "60",
    "1 Петра": "60",
    "1 тим": "54",
    "1 Тим": "54",
    "1 тимофею": "54",
    "1 Тимофею": "54",
    "1 фес": "52",
    "1 Фес": "52",
    "1 фессалоникийцам": "52",
    "1 Фессалоникийцам": "52",
    "1 цар": "9",
    "1 Цар": "9",
    "1 царств": "9",
    "1 Царств": "9",
    "1ин": "62",
    "1Ин": "62",
    "1иоанна": "62",
    "1Иоанна": "62",
    "1кор": "46",
    "1Кор": "46",
    "1коринфянам": "46",
    "1Коринфянам": "46",
    "1ма": "81",
    "1Ма": "81",
    "1маккавеев": "81",
    "1Маккавеев": "81",
    "1пар": "13",
    "1Пар": "13",
    "1паралипоменон": "13",
    "1Паралипоменон": "13",
    "1пет": "60",
    "1Пет": "60",
    "1петра": "60",
    "1Петра": "60",
    "1тим": "54",
    "1Тим": "54",
    "1тимофею": "54",
    "1Тимофею": "54",
    "1фес": "52",
    "1Фес": "52",
    "1фессалоникийцам": "52",
    "1Фессалоникийцам": "52",
    "1цар": "9",
    "1Цар": "9",
    "1царств": "9",
    "1Царств": "9",
    "2 езд": "76",
    "2 Езд": "76",
    "2 ездры": "76",
    "2 Ездры": "76",
    "2 ин": "63",
    "2 Ин": "63",
    "2 иоанна": "63",
    "2 Иоанна": "63",
    "2 кор": "47",
    "2 Кор": "47",
    "2 коринфянам": "47",
    "2 Коринфянам": "47",
    "2 ма": "82",
    "2 Ма": "82",
    "2 маккавеев": "82",
    "2 Маккавеев": "82",
    "2 пар": "14",
    "2 Пар": "14",
    "2 паралипоменон": "14",
    "2 Паралипоменон": "14",
    "2 пет": "61",
    "2 Пет": "61",
    "2 петра": "61",
    "2 Петра": "61",
    "2 тим": "55",
    "2 Тим": "55",
    "2 тимофею": "55",
    "2 Тимофею": "55",
    "2 фес": "53",
    "2 Фес": "53",
    "2 фессалоникийцам": "53",
    "2 Фессалоникийцам": "53",
    "2 цар": "10",
    "2 Цар": "10",
    "2 царств": "10",
    "2 Царств": "10",
    "2езд": "76",
    "2Езд": "76",
    "2ездры": "76",
    "2Ездры": "76",
    "2ин": "63",
    "2Ин": "63",
    "2иоанна": "63",
    "2Иоанна": "63",
    "2кор": "47",
    "2Кор": "47",
    "2коринфянам": "47",
    "2Коринфянам": "47",
    "2ма": "82",
    "2Ма": "82",
    "2маккавеев": "82",
    "2Маккавеев": "82",
    "2пар": "14",
    "2Пар": "14",
    "2паралипоменон": "14",
    "2Паралипоменон": "14",
    "2пет": "61",
    "2Пет": "61",
    "2петра": "61",
    "2Петра": "61",
    "2тим": "55",
    "2Тим": "55",
    "2тимофею": "55",
    "2Тимофею": "55",
    "2фес": "53",
    "2Фес": "53",
    "2фессалоникийцам": "53",
    "2Фессалоникийцам": "53",
    "2цар": "10",
    "2Цар": "10",
    "2царств": "10",
    "2Царств": "10",
    "3 езд": "77",
    "3 Езд": "77",
    "3 ездры": "77",
    "3 Ездры": "77",
    "3 ин": "64",
    "3 Ин": "64",
    "3 иоанна": "64",
    "3 Иоанна": "64",
    "3 ма": "83",
    "3 Ма": "83",
    "3 маккавеев": "83",
    "3 Маккавеев": "83",
    "3 цар": "11",
    "3 Цар": "11",
    "3 царств": "11",
    "3 Царств": "11",
    "3езд": "77",
    "3Езд": "77",
    "3ездры": "77",
    "3Ездры": "77",
    "3ин": "64",
    "3Ин": "64",
    "3иоанна": "64",
    "3Иоанна": "64",
    "3ма": "83",
    "3Ма": "83",
    "3маккавеев": "83",
    "3Маккавеев": "83",
    "3цар": "11",
    "3Цар": "11",
    "3царств": "11",
    "3Царств": "11",
    "4 ма": "84",
    "4 Ма": "84",
    "4 маккавеев": "84",
    "4 Маккавеев": "84",
    "4 цар": "12",
    "4 Цар": "12",
    "4 царств": "12",
    "4 Царств": "12",
    "4ма": "84",
    "4Ма": "84",
    "4маккавеев": "84",
    "4Маккавеев": "84",
    "4цар": "12",
    "4Цар": "12",
    "4царств": "12",
    "4Царств": "12",
    "авв": "35",
    "Авв": "35",
    "аввакум": "35",
    "Аввакум": "35",
    "авд": "31",
    "Авд": "31",
    "авдий": "31",
    "Авдий": "31",
    "агг": "37",
    "Агг": "37",
    "аггей": "37",
    "Аггей": "37",
    "ам": "30",
    "Ам": "30",
    "амос": "30",
    "Амос": "30",
    "быт": "1",
    "Быт": "1",
    "бытие": "1",
    "Бытие": "1",
    "вар": "70",
    "Вар": "70",
    "варух": "70",
    "Варух": "70",
    "втор": "5",
    "Втор": "5",
    "второзаконие": "5",
    "Второзаконие": "5",
    "гал": "48",
    "Гал": "48",
    "дан": "27",
    "Дан": "27",
    "даниил": "27",
    "Даниил": "27",
    "деян": "44",
    "Деян": "44",
    "деяния": "44",
    "Деяния": "44",
    "дополнения к даниила": "71",
    "Дополнения к Даниила": "71",
    "дополнения к есфирь": "78",
    "Дополнения к Есфирь": "78",
    "евр": "58",
    "Евр": "58",
    "езд": "15",
    "Езд": "15",
    "ездра": "15",
    "Ездра": "15",
    "еккл": "21",
    "Еккл": "21",
    "екклесиаст": "21",
    "Екклесиаст": "21",
    "есф": "17",
    "Есф": "17",
    "есфирь": "17",
    "Есфирь": "17",
    "еф": "49",
    "Еф": "49",
    "зах": "38",
    "Зах": "38",
    "захария": "38",
    "Захария": "38",
    "иак": "59",
    "Иак": "59",
    "иакова": "59",
    "Иакова": "59",
    "иез": "26",
    "Иез": "26",
    "иезекииль": "26",
    "Иезекииль": "26",
    "иер": "24",
    "Иер": "24",
    "иеремия": "24",
    "Иеремия": "24",
    "иисус навин": "6",
    "Иисус Навин": "6",
    "ин": "43",
    "Ин": "43",
    "иов": "18",
    "Иов": "18",
    "иоиль": "29",
    "Иоиль": "29",
    "ион": "32",
    "Ион": "32",
    "иона": "32",
    "Иона": "32",
    "ис": "23",
    "Ис": "23",
    "исаия": "23",
    "Исаия": "23",
    "исх": "2",
    "Исх": "2",
    "исход": "2",
    "Исход": "2",
    "иуд": "65",
    "Иуд": "65",
    "иудифь": "80",
    "Иудифь": "80",
    "иудф": "80",
    "Иудф": "80",
    "иуды": "65",
    "Иуды": "65",
    "к галатам": "48",
    "К Галатам": "48",
    "к евреям": "58",
    "К Евреям": "58",
    "к ефесянам": "49",
    "К Ефесянам": "49",
    "к колоссянам": "51",
    "К Колоссянам": "51",
    "к римлянам": "45",
    "К Римлянам": "45",
    "к титу": "56",
    "К Титу": "56",
    "к филимону": "57",
    "К Филимону": "57",
    "к филиппийцам": "50",
    "К Филиппийцам": "50",
    "кол": "51",
    "Кол": "51",
    "лев": "3",
    "Лев": "3",
    "левит": "3",
    "Левит": "3",
    "лк": "42",
    "Лк": "42",
    "мал": "39",
    "Мал": "39",
    "малахия": "39",
    "Малахия": "39",
    "ман": "85",
    "Ман": "85",
    "мих": "33",
    "Мих": "33",
    "михей": "33",
    "Михей": "33",
    "мк": "41",
    "Мк": "41",
    "молитва манассии": "85",
    "Молитва Манассии": "85",
    "мф": "40",
    "Мф": "40",
    "нав": "6",
    "Нав": "6",
    "наум": "34",
    "Наум": "34",
    "неем": "16",
    "Неем": "16",
    "неемия": "16",
    "Неемия": "16",
    "ос": "28",
    "Ос": "28",
    "осия": "28",
    "Осия": "28",
    "от иоанна": "43",
    "От Иоанна": "43",
    "от луки": "42",
    "От Луки": "42",
    "от марка": "41",
    "ОТ Марка": "41",
    "от матфея": "40",
    "ОТ Матфея": "40",
    "откр": "66",
    "Откр": "66",
    "откровение": "66",
    "Откровение": "66",
    "песн": "22",
    "Песн": "22",
    "песня песней": "22",
    "Песня Песней": "22",
    "плач иеремии": "25",
    "Плач Иеремии": "25",
    "плач": "25",
    "Плач": "25",
    "посл": "79",
    "Посл": "79",
    "послание иеремии": "79",
    "Послание Иеремии": "79",
    "прем": "89",
    "Прем": "89",
    "премудрость соломона": "89",
    "Премудрость Соломона": "89",
    "притч": "20",
    "Притч": "20",
    "притчи": "20",
    "Притчи": "20",
    "пс": "19",
    "Пс": "19",
    "псалмы соломона": "90",
    "Псалмы Соломона": "90",
    "псалмы": "19",
    "Псалмы": "19",
    "псалом 151": "86",
    "Псалом 151": "86",
    "рим": "45",
    "Рим": "45",
    "руфь": "8",
    "Руфь": "8",
    "сир": "87",
    "Сир": "87",
    "сирах": "87",
    "Сирах": "87",
    "соф": "36",
    "Соф": "36",
    "софония": "36",
    "Софония": "36",
    "суд": "7",
    "Суд": "7",
    "судьи": "7",
    "Судьи": "7",
    "сусанна": "75",
    "Сусанна": "75",
    "тит": "56",
    "Тит": "56",
    "тов": "88",
    "Тов": "88",
    "товит": "88",
    "Товит": "88",
    "флм": "57",
    "Флм": "57",
    "флп": "50",
    "Флп": "50",
    "чис": "4",
    "Чис": "4",
    "числа": "4",
    "Числа": "4",
*/
  };

  // constructor
  BibleParser(String abbreviations) {
    // set standard abbreviation
    var standardAbbreviations = {
      "ENG": this.standardAbbreviationENG,
      "TC": this.standardAbbreviationTC,
      "SC": this.standardAbbreviationSC,
    };
    this.standardAbbreviation = standardAbbreviations[abbreviations];
  }

  // function for converting b c v integers to verse reference string
  String bcvToVerseReference(List bcvList) {
    var b = bcvList[0];
    var c = bcvList[1];
    var v = bcvList[2];
    var c2, v2;
    if (bcvList.length == 5) {
      c2 = bcvList[3];
      v2 = bcvList[4];
    }

    var bookNo = "$b";
    if (this.standardAbbreviation.containsKey(bookNo)) {
      var abbreviation = this.standardAbbreviation[bookNo];
      if ((c2 != null) && (c2 == c) && (v2 > v)) {
        return "$abbreviation $c:$v-$v2";
      } else if ((c2 != null) && (c2 > c)) {
        return "$abbreviation $c:$v-$c2:$v2";
      } else {
        return "$abbreviation $c:$v";
      }
    } else {
      return "BOOK 0:0";
    }
  }

  String bcvToChapterReference(List bcvList) {
    var bcvRef;
    if (bcvList.length >= 3) {
      bcvRef = this.bcvToVerseReference(bcvList);
    } else if (bcvList.length == 2) {
      bcvRef = this.bcvToVerseReference([...bcvList, 1]);
    }
    return bcvRef.replaceAll(RegExp(r":.*?$"), "");
  }

  String parseText(String text) {

    // setup regexHelper
    var regex = RegexHelper();

    // add a space at the end of the text, to avoid indefinite loop in later steps
    // this extra space will be removed when parsing is finished.
    var taggedText = "$text ";

    // remove bcv tags, if any, to avoid duplication of tagging in later steps
    regex.patternString = r'<ref onclick="bcv\([^\(\)]*?\)">(.*?)</ref>';
    regex.searchPattern = RegExp(regex.patternString, multiLine: true);
    while (regex.searchPattern.hasMatch(taggedText)) {
      regex.searchReplace = [
        [regex.patternString, r'\1'],
      ];
      taggedText = regex.doSearchReplace(taggedText, multiLine: true);
    }

    // search for books; mark them with book numbers, used by https://marvel.bible
    // sorting books by alphabet
    var sortedBooks = this.bibleBookNo.keys.toList()..sort();
    // sorting books by length
    sortedBooks.sort((a, b) => b.length.compareTo(a.length));

    for (var book in sortedBooks) {
      // get the string of book name
      var bookString = book;

      regex.searchReplace = [
        ['\\.', r'[\.]*?'], // make dot "." optional for an abbreviation
        ['^([0-9]+?) ', r'\1[ ]*?'], // make space " " optional in some cases
        ['^([I]+?) ', r'\1[ ]*?'],
        ['^(IV) ', r'\1[ ]*?'],
      ];
      bookString = regex.doSearchReplace(bookString);

      // get assigned book number from dictionary
      var bookNumber = this.bibleBookNo[book];

      // search & replace for marking book
      regex.searchReplace = [
        ['($bookString) ([0-9])', '『$bookNumber｜\\1』 \\2'],
      ];
      taggedText = regex.doSearchReplace(taggedText, multiLine: true);
    }

    regex.searchReplace = [
      // add first set of taggings:
      ['『([0-9]+?)｜([^『』]*?)』 ([0-9]+?):([0-9]+?)([^0-9])', r'<ref onclick="bcv(\1,\3,\4)">\2 \3:\4</ref｝\5'],
      ['『([0-9]+?)｜([^『』]*?)』 ([0-9]+?)([^0-9])', r'<ref onclick="bcv(\1,\3,)">\2 \3</ref｝\4'],
      // fix references without verse numbers
      // fix books with chapter 1 ONLY; oneChapterBook = [31,57,63,64,65,72,73,75,79,85]
      [r'<ref onclick="bcv\((31|57|63|64|65|72|73|75|79|85),([0-9]+?),\)">', r'<ref onclick="bcv(\1,1,\2)">'],
      // fix references of chapters without verse number; assign verse number 1 in taggings
      [r'<ref onclick="bcv\(([0-9]+?),([0-9]+?),\)">', r'<ref onclick="bcv(\1,\2,1)">＊'],
    ];
    taggedText = regex.doSearchReplace(taggedText, multiLine: true);

    // check if verses following tagged references, e.g. Book 1:1-2:1; 3:2-4, 5; Jude 1
    regex.searchPattern = RegExp('</ref｝[,-–;][ ]*?[0-9]', multiLine: true);
    while (regex.searchPattern.hasMatch(taggedText)) {
      regex.searchReplace = [
        [r'<ref onclick="bcv\(([0-9]+?),([0-9]+?),([0-9]+?)\)">([^｝]*?)</ref｝([,-–;][ ]*?)([0-9]+?):([0-9]+?)([^0-9])', r'<ref onclick="bcv(\1,\2,\3)">\4</ref｝\5<ref onclick="bcv(\1,\6,\7)">\6:\7</ref｝\8'],
        [r'<ref onclick="bcv\(([0-9]+?),([0-9]+?),([0-9]+?)\)">([^＊][^｝]*?)</ref｝([,-–;][ ]*?)([0-9]+?)([^:0-9])', r'<ref onclick="bcv(\1,\2,\3)">\4</ref｝\5<ref onclick="bcv(\1,\2,\6)">\6</ref｝\7'],
        [r'<ref onclick="bcv\(([0-9]+?),([0-9]+?),([0-9]+?)\)">([^＊][^｝]*?)</ref｝([,-–;][ ]*?)([0-9]+?):([^0-9])', r'<ref onclick="bcv(\1,\2,\3)">\4</ref｝\5<ref onclick="bcv(\1,\2,\6)">\6</ref｝:\7'],
        [r'<ref onclick="bcv\(([0-9]+?),([0-9]+?),([0-9]+?)\)">(＊[^｝]*?)</ref｝([,-–;][ ]*?)([0-9]+?)([^:0-9])', r'<ref onclick="bcv(\1,\2,\3)">\4</ref｝\5<ref onclick="bcv(\1,\6,1)">＊\6</ref｝\7'],
        [r'<ref onclick="bcv\(([0-9]+?),([0-9]+?),([0-9]+?)\)">(＊[^｝]*?)</ref｝([,-–;][ ]*?)([0-9]+?):([^0-9])', r'<ref onclick="bcv(\1,\2,\3)">\4</ref｝\5<ref onclick="bcv(\1,\6,1)">＊\6</ref｝:\7'],
      ];
      taggedText = regex.doSearchReplace(taggedText, multiLine: true);
    }

    // clear special markers
    regex.searchReplace = [
      ['『[0-9]+?|([^『』]*?)』', r'\1'],
      [r'(<ref onclick="bcv\([0-9]+?,[0-9]+?,[0-9]+?\)">)＊', r'\1'],
      ['</ref｝', '</ref>'],
    ];
    taggedText = regex.doSearchReplace(taggedText, multiLine: true);

    // handling range of verses
    // e.g. John 3:16 is tagged as <ref onclick="bcv(43,3,16)">John 3:16</ref>
    // e.g. John 3:14-16 is tagged as <ref onclick="bcv(43,3,14,3,16)">John 3:14-16</ref>
    // e.g. John 3:14-4:3 is tagged as <ref onclick="bcv(43,3,14,4,3)">John 3:14-4:3</ref>
    regex.patternString = r'<ref onclick="bcv\(([0-9]+?),([0-9]+?),([0-9]+?)\)">([^<>]*?)</ref>([-–])<ref onclick="bcv\(\1,([0-9]+?),([0-9]+?)\)">';
    regex.searchPattern = RegExp(regex.patternString, multiLine: true);
    while (regex.searchPattern.hasMatch(taggedText)) {
      regex.searchReplace = [
        [regex.patternString, r'<ref onclick="bcv(\1,\2,\3,\6,\7)">\4\5'],
      ];
      taggedText = regex.doSearchReplace(taggedText, multiLine: true);
    }

    // remove the extra space, added at the beginning of this function
    taggedText = taggedText.substring(0, (taggedText.length -1));

    return taggedText;
  }

  List extractAllReferences(String text, {bool tagged = false}) {
    var taggedText;

    (!tagged) ? taggedText = this.parseText(text) : taggedText = text;

    var verseReferenceList = [];

    var searchPattern = RegExp(r'bcv\(([0-9]+?,[0-9]+?,[0-9]+?[^\)\(]*?)\)');
    for (var match in searchPattern.allMatches(taggedText)) {
      var stringList = match.group(1).split(",");
      verseReferenceList.add(stringList.map((i) => int.parse(i)).toList());
    }

    return verseReferenceList;
  }

  /*
  Future tagFiles(List filePaths) async {
    var fileIO = FileIOHelper();
    for (var filePath in filePaths) {
      var isInputFile = await fileIO.isFile(filePath);
      var fileBasename = fileIO.getBasename(filePath);
      if ((isInputFile) && (!fileBasename.startsWith("."))) {
        var outputFilePath = "${filePath}_output.txt";
        fileIO.formatTextFile(filePath, this.parseText, outputFilePath);
      }
    }
  }

  Future tagFilesInsideFolder(String folderPath) async {
    var fileList = await FileIOHelper().getFileListInFolder(folderPath);
    this.tagFiles(fileList);
  }
  */

}
