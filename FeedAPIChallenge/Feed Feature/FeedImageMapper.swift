//
//  FeedImageMapper.swift
//  FeedAPIChallenge
//
//  Created by Hugo Cantanhede on 03/09/21.
//  Copyright © 2021 Essential Developer Ltd. All rights reserved.
//

import Foundation

enum FeedImageMapper {
	private struct ImageSet: Decodable {
		let items: [Image]

		var feedImage: [FeedImage] {
			return items.map { $0.item }
		}
	}

	private struct Image: Decodable {
		let id: UUID
		let description: String?
		let location: String?
		let url: URL

		var item: FeedImage {
			return FeedImage(id: id, description: description, location: location, url: url)
		}

		enum CodingKeys: String, CodingKey {
			case id = "image_id"
			case description = "image_desc"
			case location = "image_loc"
			case url = "image_url"
		}
	}

	private static var statusCode200: Int { return 200 }

	static func map(data: Data, response: HTTPURLResponse) -> RemoteFeedLoader.Result {
		guard response.statusCode == statusCode200,
		      let imageSet = try? JSONDecoder().decode(ImageSet.self, from: data) else {
			return .failure(RemoteFeedLoader.Error.invalidData)
		}
		return .success(imageSet.feedImage)
	}
}
