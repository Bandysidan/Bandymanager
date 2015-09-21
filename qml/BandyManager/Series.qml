import QtQuick 2.0

import linkan.bandymanager 1.0

Rectangle {
    Serie {
        uid: "SwedenAllsvSodra"
        name: "Allsvenskan Södra"
        countryUid: "sweden"
        timesEach: 2
        teamUid: ["Jonkopingherrar","TranasBoisherrar","Frillesasherrar","LidkopingsAIKHerrar","NassjoIFHerrar","BlasutHerrar","NitroNoraHerrar","BolticHerrar","IFKMotalaHerrar","SurteHerrar","OrebroSKHerrar"]
/*        matchUid: [
            "SweAllSR01M01"
        ]*/
    }
    Serie {
        uid: "SwedenAllsvNorra"
        name: "Allsvenskan Norra"
        countryUid: "sweden"
        timesEach: 2
        teamUid: ["Ljusdalherrar","Katrineholmherrar","Rattvikherrar","Västanforsherrar","SpångaDjurgardenHerrar","FaluBSHerrar","GustavsbergHerrar","HaparandaHerrar","BorlangeHerrar","HelenelundHerrar","UnikHerrar","TellusHerrar"]
        matchUid: [
            "SweAllNR01M01",
            "SweAllNR01M02",
            "SweAllNR01M03",
            "SweAllNR01M04",
            "SweAllNR01M05",
            "SweAllNR01M06"
        ]
    }
    Serie {
        uid: "SwedenElitserien"
        name: "Elitserien"
        countryUid: "sweden"
        timesEach: 2
        teamUid: ["Bollnasherrar","Brobergherrar","Edsbynherrar","Bajenbandyherrar","Gripenherrar","Kalixbandyherrar","IFKKungalvherrar","SAIKbandyherrar","Siriusherrar","Tillbergabandyherrar","Vanersborgbandyherrar","VetlandaBKherrar","Villabandyherrar","VSKbandyherrar"]
/*        matchUid: [
            "SweElitR01M01",
            "SweElitR01M02",
            "SweElitR01M03",
            "SweElitR01M04",
            "SweElitR01M05",
            "SweElitR01M06",
            "SweElitR01M07",
            "SweElitR02M01",
            "SweElitR02M02",
            "SweElitR02M03",
            "SweElitR02M04",
            "SweElitR02M05",
            "SweElitR02M06",
            "SweElitR02M07"
        ]*/
    }
    Serie {
        uid: "NorwayEliteserien"
        name: "Eliteserien"
        countryUid: "norway"
        timesEach: 3
        teamUid: ["Stabaekherrar","Mjondalenherrar","Readyherrar","Solbergherrar","Ullevålherrar","Høvikherrar","Sarpsborgherrar","Drammenherrar"]
        matchUid: [
            "NorElitR01M01",
            "NorElitR01M02",
            "NorElitR01M03",
            "NorElitR01M04"
        ]
    }
    Serie {
        uid: "RussiaSuperLeague"
        name: "Superligan"
        countryUid: "russia"
        timesEach: 2
        teamUid:["Dynamomoscowherrar","Jenisejherrar","Vodnikherrar","Zorkijherrar","Dynamokazanherrar","Rodinaherrar"]
        matchUid: [
            "RusSuperR01M01",
            "RusSuperR01M02"
        ]
    }
    Serie {
        uid: "FinlandBandyliiga"
        name: "Bandyliiga"
        countryUid: "finland"
        timesEach: 2
        teamUid:["Helsinkiherrar","Narukeraherrar","OLSherrar","Veiteraherrar"]
        matchUid: [
            "FinBandyR01M01",
            "FinBandyR01M02"
        ]
    }
    Serie {
        uid: "USADivision1"
        name: "Division 1"
        countryUid: "usa"
        timesEach: 2
        teamUid: ["Bandolierherrar","Dinkytownherrar","DynamoDuluthherrar","Minisotabladesherrar","Mississippiherrar","IceTigersherrar"]
    }
}
