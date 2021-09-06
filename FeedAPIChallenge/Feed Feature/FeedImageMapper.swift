//
//  FeedImageMapper.swift
//  FeedAPIChallenge
//
//  Created by Hugo Cantanhede on 03/09/21.
//  Copyright © 2021 Essential Developer Ltd. All rights reserved.
//

import Foundation

internal final class FeedImageMapper {
	internal static func map(response: HTTPURLResponse) -> RemoteFeedLoader.Result {
		guard response.statusCode == 200 else {
			return .failure(RemoteFeedLoader.Error.invalidData)
		}
		return .failure(RemoteFeedLoader.Error.connectivity)
	}
}
