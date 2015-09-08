import QtQuick 2.0

import linkan.bandymanager 1.0

Rectangle {
    Serie {
        uid: "SwedenAllsvSodra"
        name: "Allsvenskan Södra"
        countryUid: "sweden"
        teamUid: ["Jonkopingherrar","TranasBoisherrar"]
        matchUid: [
            "SweAllSR01M01"
        ]
    }
    Serie {
        uid: "SwedenAllsvNorra"
        name: "Allsvenskan Norra"
        countryUid: "sweden"
        teamUid: ["Ljusdalherrar","Katrineholmherrar","Rattvikherrar","Västanforsherrar"]
    }
    Serie {
        uid: "SwedenElitserien"
        name: "Elitserien"
        countryUid: "sweden"
        teamUid: ["Bollnasherrar","Brobergherrar","Edsbynherrar","Bajenbandyherrar","Gripenherrar","Kalixbandyherrar","IFKKungalvherrar","SAIKbandyherrar","Siriusherrar","Tillbergabandyherrar","Vanersborgbandyherrar","VetlandaBKherrar","Villabandyherrar","VSKbandyherrar"]
        matchUid: [
            "SweElitR01M01",
            "SweElitR01M02",
            "SweElitR01M03",
            "SweElitR01M04",
            "SweElitR01M05",
            "SweElitR01M06",
            "SweElitR01M07",
            "SweElitR01M02"
        ]
    }
    Serie {
        uid: "NorwayEliteserien"
        name: "Eliteserien"
        countryUid: "norway"
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
        teamUid:["Dynamomoscowherrar","Jenisejherrar","Vodnikherrar","Zorkijherrar"]
        matchUid: [
            "RusSuperR01M01",
            "RusSuperR01M02"
        ]
    }
    Serie {
        uid: "FinlandBandyliiga"
        name: "Bandyliiga"
        countryUid: "finland"
        teamUid:["Helsinkiherrar","Narukeraherrar","OLSherrar","Veiteräherrar"]
    }
    Serie {
        uid: "USADivision1"
        name: "Division 1"
        countryUid: "usa"
        teamUid: ["Bandolierherrar","Dinkytownherrar","DynamoDuluthherrar","Minisotabladesherrar","Mississippiherrar","IceTigersherrar"]
    }
}