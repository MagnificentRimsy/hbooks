class Book {
  String title,
      author,
      image,
      description =
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio ab assumenda in quos natus eum blanditiis unde nemo neque, totam numquam placeat consequatur mollitia qui expedita, perferendis, nesciunt odit eius?';

  int page, comment;
  double rating;

  Book(this.title, this.author, this.image, this.page, this.comment,
      this.rating);
}

final List<Book> books = [
  Book('Corel', 'James Clark', 'assets/images/corel.jpg', 300, 10, 4.5),
  Book('Drafter', 'Joe Friend', 'assets/images/drafter.jpg', 37, 124, 3.5),
  Book('Indesign', 'James Mike', 'assets/images/indesign.jpg', 34, 124, 5.5),
  Book('Max 3D', 'Lawal Johnson', 'assets/images/max_3d.jpeg', 34, 124, 2.5),
  Book('Maya', 'Appiah M', 'assets/images/maya.jpeg', 52, 1224, 5.0),
  Book(
      'Photoshop', 'Doshima Ladow', 'assets/images/photoshop.jpg', 89, 98, 3.5),
  Book('Premier', 'Dag. H', 'assets/images/premier.jpg', 29, 432, 4.5),
  Book('Google Sketchup', 'Michael Samson', 'assets/images/sketchup.jpeg', 72,
      124, 4.5),
  Book('Webmaster', 'Collins Boyi', 'assets/images/webmaster.jpeg', 34, 124,
      4.5),
];
