class MovieModel {
  late int id;
  late String url;
  late String name;
  late List<String> genres;
  late String status;
  late String premiered;

  late String rating;
  Image image;
  late String summary;


  MovieModel(
      {
        required this.id,
        required this.url,
        required this.name,
        required this.genres,
        required this.status,
        required this.premiered,

        required this.rating,
        required this.image,
        required this.summary,
      });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    var generes = json['genres'];
    List<String> generesList = generes.cast<String>();
    return MovieModel(
        id: json['id'],
        url: json['url'],
        name: json['name'],
        genres: generesList,
        status: json['status'],
        premiered: json['premiered'],
        rating: json['rating']["average"] != null? json['rating']["average"].toString() : "No rating",
        image: Image.fromJson(json['image']),
        summary: json['summary'].replaceAll("<p>", '').replaceAll("</p>", '').replaceAll("<b>", '').replaceAll("</b>", '').replaceAll("<i>", '').replaceAll("</i>", '').replaceAll("<br>", '').replaceAll("<br/>", '').replaceAll("<br />", '').replaceAll("<strong>", '').replaceAll("</strong>", '').replaceAll("<em>", '').replaceAll("</em>", '').replaceAll("<u>", '').replaceAll("</u>", '').replaceAll("<a>", '').replaceAll("</a>", '').replaceAll("<ul>", '').replaceAll("</ul>", '').replaceAll("<li>", '').replaceAll("</li>", '').replaceAll("<ol>", '').replaceAll("</ol>", '').replaceAll("<blockquote>", '').replaceAll("</blockquote>", '').replaceAll("<h1>", '').replaceAll("</h1>", '').replaceAll("<h2>", '').replaceAll("</h2>", '').replaceAll("<h3>", '').replaceAll("</h3>", '').replaceAll("<h4>", '').replaceAll("</h4>", '').replaceAll("<h5>", '').replaceAll("</h5>", '').replaceAll("<h6>", '').replaceAll("</h6>", '').replaceAll("<hr>", '').replaceAll("<hr/>", '').replaceAll("<hr />", '').replaceAll("<div>", '').replaceAll("</div>", '').replaceAll("<span>", '').replaceAll("</span>", '').replaceAll("<img>", '').replaceAll("</img>", '').replaceAll("<table>", '').replaceAll("</table>", '').replaceAll("<tr>", '').replaceAll("</tr>", '').replaceAll("<td>", '').replaceAll("</td>", '').replaceAll("<th>", '').replaceAll("</th>", '').replaceAll("<tbody>", '').replaceAll("</tbody>", '').replaceAll("<thead>", '').replaceAll("</thead>", '').replaceAll("<tfoot>", '').replaceAll("</tfoot>", '').replaceAll("<caption>", '').replaceAll("</caption>", '').replaceAll("<pre>", '').replaceAll("</pre>", '').replaceAll("<code>", '').replaceAll("</code>", '').replaceAll("<sup>", '').replaceAll("</sup>", '').replaceAll("<sub>", '').replaceAll("</sub>", '').replaceAll("<p/>", '').replaceAll("<p />", '').replaceAll("<b/>", '').replaceAll("<b />", '').replaceAll("<i/>", '').replaceAll("<i />", '').replaceAll("<strong/>", '').replaceAll("<strong />", '').replaceAll("<em/>", '').replaceAll("<em />", '').replaceAll("<u/>", '').replaceAll("<u />", '').replaceAll("<a/>", '').replaceAll("<a />", '').replaceAll("<ul/>", '').replaceAll("<ul />", '').replaceAll("<li/>", '').replaceAll("<li />", '').replaceAll("<ol/>", '').replaceAll("<ol />", '').replaceAll("<blockquote/>", '').replaceAll("<blockquote />", '').replaceAll("<h1/>", '').replaceAll("<h1 />","")
    );
  }

}



class Image {
  String medium;
  String? original;

  Image({required this.medium,this.original});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      medium: json['medium'],
      original: json['original'],
    );
  }

}
