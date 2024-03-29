

import Foundation

enum ProductCategories: String, CaseIterable {
    case Ahsap
    case Dokumacilik
    case Seramik
    case Dekor
    case Urgancilik
}

struct Product: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var price: Int
    var description: String
    var supplier: String
    var image: String
    var category: ProductCategories
    var gender: GenderCategory
}



var productList = [
    Product(title: "Ahşap Avize",
            price: 185,
            description: "Modern Ahşap Salon Avize",
            supplier: "Ahşap Ürünler", image: "ahşap1",
            category: .Ahsap,
            gender: .Home
           ),
    Product(title: "Ayna",
            price: 21,
            description: "Makrome Dekor Ayna",
            supplier: "Dekorasyon", image: "ayna",
            category: .Dokumacilik,
            gender: .Home
           ),
    Product(title: "Çilek Reçeli",
            price: 20,
            description: "Yöresel Çilek Reçeli 700 Cc",
            supplier: "Yiyecek", image: "reçel",
            category: .Seramik,
            gender: .Food
           ),
    Product(title: "Bebek",
            price: 100,
            description: "Örgü Oyuncak Bebek ",
            supplier: "Oyuncak", image: "bebek",
            category: .Dekor,
            gender: .Clothing
           ),
    Product(title: "Turşu",
            price: 50,
            description: "Organik çeşit çeşit ev yapımı turşu",
            supplier: "Yiyecek", image: "turşu",
            category: .Urgancilik,
            gender: .Food
           ),
    Product(title: "Ahşap Sehpa",
            price: 205,
            description: "El Yapımı İşlemeli Oymalı Çay Kahve Sehbası",
            supplier: "Dekorasyon", image: "ahşap2",
            category: .Seramik,
            gender: .Home
           ),
    Product(title: "Salça",
            price: 300,
            description: "Ev Yapımı Organik Domatez Salçası",
            supplier: "Yiyecek", image: "salça",
            category: .Ahsap,
            gender: .Food
           ),
    Product(title: "Makrome Çanta",
            price: 300,
            description: "Yazlık Kroşe Makrome Örgü Kadın Omuz Çantası",
            supplier: "Giyim", image: "makromeCanta",
            category: .Urgancilik,
            gender: .Clothing
           ),
    Product(title: "Makrome",
            price: 45,
            description: "El Yapımı İşlemeli Makrome Dekorasyon",
            supplier: "Dekorasyon", image: "makrome",
            category: .Dekor,
            gender: .Home
           ),
    Product(title: "Battaniye",
            price: 89,
            description: "Örgü Battaniye",
            supplier: "Ev Ürünleri", image: "battaniye",
            category: .Dekor,
            gender: .Home
           ),
    Product(title: "Halı",
            price: 150,
            description: "İşlemeli El Yapımı Halı",
            supplier: "Ev ", image: "halı1",
            category: .Dekor,
            gender: .Home
           ),
    Product(title: "Hırka",
            price: 900,
            description: "Örgü Kadın Hırkası",
            supplier: "Giyim", image: "hırka",
            category: .Dekor,
            gender: .Clothing
           ),
    Product(title: "Sarma",
            price: 105,
            description: "Ev Yapımı Yemekler",
            supplier: "Yiyecek", image: "sarma",
            category: .Dekor,
            gender: .Food
           ),
    Product(title: "Seramik",
            price: 400,
            description: "Ssramik Çeşitleri",
            supplier: "Ev", image: "seramik",
            category: .Dekor,
            gender: .Home
           )
    
    ]

