//
//  Post.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 02.04.2022.
//

import Foundation


public struct Post {
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
}

public let post_1 = Post(author: "Lee",
                  description: "Как создать персонажа: процесс и рекомендации",
                  image: "post_1", likes: 1, views: 300)

public let post_2 = Post(author: "F3ar",
                  description: "Как сделать интерфейс мобильной игры и не задохнуться под завалами элементов",
                  image: "post_2", likes: 200, views: 500)

public let post_3 = Post(author: "Lemon",
                  description: "Unity показала фотореалистичную технодемоверсию Enemies — с улучшенной анимацией волос",
                  image: "post_3", likes: 20, views: 600)

public let post_4 = Post(author: "Apple",
                  description: "Облачный гейминг обречен из-за физики? Или подробнее о задержках ввода, откуда они берутся и как с ними бороться",
                  image: "post_4", likes: 30, views: 50)

public let posts_array: [Post] = [post_1, post_2, post_3, post_4]
