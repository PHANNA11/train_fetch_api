import 'package:fetch_aip/constant/aip_route.dart';
import 'package:fetch_aip/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController {
  Future getProduct() async {
    var response = await http.get(Uri.parse(productRout));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return [];
    }
  }
}
