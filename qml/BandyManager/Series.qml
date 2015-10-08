import QtQuick 2.0

import linkan.bandymanager 1.0

Rectangle {
    Serie {
        uid: "SwedenAllsvSodra"
        name: "Allsvenskan Södra"
        countryUid: "sweden"
        startMonth: 11
        endMonth: 2
        timesEach: 2
        teamUid: ["Jonkopingherrar","TranasBoisherrar","Frillesasherrar","LidkopingsAIKHerrar","NassjoIFHerrar","BlasutHerrar","NitroNoraHerrar","BolticHerrar","IFKMotalaHerrar","SurteHerrar","OrebroSKHerrar"]
    }
    Serie {
        uid: "SwedenAllsvNorra"
        name: "Allsvenskan Norra"
        countryUid: "sweden"
        startMonth: 11
        endMonth: 2
        timesEach: 2
        teamUid: ["Ljusdalherrar","Katrineholmherrar","Rattvikherrar","Västanforsherrar","SpångaDjurgardenHerrar","FaluBSHerrar","GustavsbergHerrar","HaparandaHerrar","BorlangeHerrar","HelenelundHerrar","UnikHerrar","TellusHerrar"]
/*        matchUid: [
            "SweAllNR01M01",
            "SweAllNR01M02",
            "SweAllNR01M03",
            "SweAllNR01M04",
            "SweAllNR01M05",
            "SweAllNR01M06"
        ]*/
    }
    Serie {
        uid: "SwedenElitserien"
        name: "Elitserien"
        countryUid: "sweden"
        timesEach: 2
        startMonth: 11
        endMonth: 2
        teamUid: ["Bollnasherrar","Brobergherrar","Edsbynherrar","Bajenbandyherrar","Gripenherrar","Kalixbandyherrar","IFKKungalvherrar","SAIKbandyherrar","Siriusherrar","Tillbergabandyherrar","Vanersborgbandyherrar","VetlandaBKherrar","Villabandyherrar","VSKbandyherrar"]
    }
    Serie {
        uid: "NorwayEliteserien"
        name: "Eliteserien"
        countryUid: "norway"
        startMonth: 11
        endMonth: 2
        timesEach: 2
        teamUid: ["Stabaekherrar","Mjondalenherrar","Readyherrar","Solbergherrar","Ullevålherrar","Høvikherrar","Sarpsborgherrar","Drammenherrar","Hamarherrar2","Ullernherrar2"]
/*        matchUid: [
            "NorElitR01M01",
            "NorElitR01M02",
            "NorElitR01M03",
            "NorElitR01M04"
        ]*/
    }
    Serie {
        uid: "RussiaSuperLeague"
        name: "Superligan"
        countryUid: "russia"
        startMonth: 11
        endMonth: 2
        timesEach: 2
        teamUid:["Dynamomoscowherrar","Jenisejherrar","Vodnikherrar","Zorkijherrar","Dynamokazanherrar","Rodinaherrar","Kuzbassherrar","Neftyanikherrar","Baykalherrar","Sibselmachherrar","Volgaherrar","Startherrar","Trubnikherrar"]
    }
    Serie {
        uid: "FinlandBandyliiga"
        name: "Bandyliiga"
        countryUid: "finland"
        startMonth: 11
        endMonth: 2
        timesEach: 2
        teamUid:["Helsinkiherrar","Narukeraherrar","OLSherrar","Veiteraherrar","Botniaherrar","Akillesherrar","JPSherrar","Kampparitherrar","WP35herrar"]
    }
    Serie {
        uid: "USADivision1"
        name: "Division 1"
        countryUid: "usa"
        timesEach: 2
        startMonth: 12
        endMonth: 2
        teamUid: ["Bandolierherrar","Dinkytownherrar","DynamoDuluthherrar","Minisotabladesherrar","Mississippiherrar","IceTigersherrar"]
    }
}
