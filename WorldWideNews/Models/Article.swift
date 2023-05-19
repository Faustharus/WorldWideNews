//
//  Article.swift
//  WorldWideNews
//
//  Created by Damien Chailloleau on 12/05/2023.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article: Identifiable, Codable, Hashable {
    var id: String { url }
    
    var source: Source
    
    var title: String
    var url: String
    var publishedAt: String
    
    var author: String?
    var description: String?
    var urlToImage: String?
    
    var content: String?
    
    var authorName: String {
        author ?? "No author found"
    }
    
    var descriptionText: String {
        description ?? "No description"
    }
    
    var articleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
    
    var releaseDate: String {
        let dateString = publishedAt
        let inputFormatter = ISO8601DateFormatter()
        inputFormatter.formatOptions = [
            .withFractionalSeconds,
            .withFullDate
        ]
        let date = inputFormatter.date(from: dateString)
        return relativeDateFormatter.localizedString(for: date!, relativeTo: Date())
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM.YYYY"
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .short
//        dateFormatter.timeZone = .current
//        return dateFormatter.string(from: date!)
    }
}

extension Article {
    
    static let dummyNews: [Article] = [
        Article(source: Source.init(name: "Konbini France"), title: "Elon Musk aurait trouvé une remplaçante pour son poste de CEO de Twitter", url: "https://www.konbini.com/internet/elon-musk-aurait-trouve-une-remplacante-pour-son-poste-de-ceo-de-twitter/", publishedAt: "2023-05-12T08:36:28Z", author: "Konbini avec AFP", description: "Elon Musk a indiqué sur Twitter jeudi qu’il avait embauché une directrice générale pour le remplacer à la tête de la plateforme, sans donner son identité, mais en précisant qu’il garderait le contrôle du réseau...", urlToImage: "https://cdn-www.konbini.com/files/2022/10/feat-twitter.jpg", content: "Elon Musk a indiqué sur Twitter jeudi quil avait embauché une directrice générale pour le remplacer à la tête de la plateforme, sans donner son identité, mais en précisant quil garderait le contrôle … [+4387 chars]"),
        Article(source: Source.init(name: "Meilleure-innovation.com"), title: "Internet par satellite : comment Elon Musk et Starlink révolutionne le monde des télécoms", url: "https://www.meilleure-innovation.com/starlink-elon-musk-forfait-mobile/", publishedAt: "2023-05-12T08:39:13Z", author: "Pierre Berthoux", description: "Au milieu des différentes annonces d’Elon Musk – offre payante pour Twitter et les baisses de prix des voitures Tesla – le multimilliardaire s’occupe d’un autre grand projet : offrir un réseau mobile mondial directement connecté à sa flotte de satellites en o…", urlToImage: "https://www.meilleure-innovation.com/wp-content/uploads/2023/03/starlink-reseau-telephone.png", content: "<!DOCTYPE html>\n\nAu milieu des différentes annonces d’Elon Musk – offre payante pour Twitter et les baisses de prix des voitures Tesla – le multimilliardaire s’occupe d’un autre grand projet : offrir… [+4750 chars]"),
        Article(source: Source.init(name: "CNN"), title: "Tesla to recall 1.1 million cars in China over potential safety risks, Chinese regulator says", url: "https://www.cnn.com/2023/05/12/economy/china-tesla-recall-intl-hnk/index.html", publishedAt: "2023-05-12T08:27:51Z", author: "Laura He", description: "Tesla will recall more than 1.1 million cars in China due to potential safety risks, the country's top market regulator said on Friday.", urlToImage: "https://media.cnn.com/api/v1/images/stellar/prod/230106094429-02-tesla-factory-china.jpg?c=16x9&q=w_800,c_fill", content: "Tesla will recall more than 1.1 million cars in China due to potential safety risks, the countrys top market regulatorsaid on Friday.\r\nStarting May 29, the US company will take back 1,104,622 vehicle… [+866 chars]"),
        Article(source: Source.init(name: "Phonandroid"), title: "L’Australie veut construire une arme laser capable de détruire des tanks", url: "https://www.phonandroid.com/laustralie-veut-construire-une-arme-laser-capable-de-detruire-des-tanks.html", publishedAt: "2023-05-12T08:12:57Z", author: "William Zimmer", description: "Le ministère australien de la Défense a chargé QinetiQ Australia de mettre au point un laser à haute énergie suffisamment puissant pour détruire des véhicules blindés, tels que les chars d'assaut. L'Australie s'est lancée dans la course à la mise...", urlToImage: "https://img.phonandroid.com/2023/05/Char-dassaut.jpg", content: "Le ministère australien de la Défense a chargé QinetiQ Australia de mettre au point un laser à haute énergie suffisamment puissant pour détruire des véhicules blindés, tels que les chars d'assaut.\r\nL… [+2536 chars]"),
        Article(source: Source.init(name: "Génération NT"), title: "Elon Musk ne sera bientôt plus seul aux commandes de Twitter", url: "https://www.generation-nt.com/actualites/twitter-elon-musk-nouvelle-dirigeante-ceo-2036295", publishedAt: "2023-05-12T07:45:01Z", description: "GNT est le portail Hi-Tech français consacré aux nouvelles technologies (internet, logiciel, matériel, mobilité, entreprise) et au jeu vidéo PC et consoles.", urlToImage: "https://img.generation-nt.com/twitter_0298000001686427.jpg", content: "Depuis son rachat à 44 milliards de dollars, Elon Musk ne ménage pas ses efforts pour transformer Twitter selon sa propre vision des réseaux sociaux et avec une ambition plus large de constituer une … [+2346 chars]")
    ]
    
}


struct Source: Codable, Hashable {
    var id: String?
    var name: String
}
