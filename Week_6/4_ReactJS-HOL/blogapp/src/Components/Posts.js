import React from "react";
import Post from "./Post";

class Posts extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			posts: [],
			hasError: false,
		};
	}

	loadPosts() {
		fetch("https://jsonplaceholder.typicode.com/posts")
			.then((res) => res.json())
			.then((data) => {
				const postObjects = data.map(
					(item) => new Post(item.id, item.title, item.body)
				);
				this.setState({ posts: postObjects });
			})
			.catch((err) => {
				console.error("Failed to fetch posts:", err);
				this.setState({ hasError: true });
			});
	}

	componentDidMount() {
		this.loadPosts();
	}

	componentDidCatch(error, info) {
		alert("An error occurred in the Posts component.");
		console.error("Error:", error);
		console.error("Info:", info);
	}

	render() {
		return (
			<div>
				<h1>Blog Posts</h1>
				{this.state.posts.map((post) => (
					<div key={post.id}>
						<h2>{post.title}</h2>
						<p>{post.body}</p>
					</div>
				))}
			</div>
		);
	}
}

export default Posts;
