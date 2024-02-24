import '../models/leilao.dart';

class LeilaoAdapter {
  LeilaoAdapter._();

  static Leilao fromJson(dynamic data) => Leilao(
        id: data["id"],
        name: data["name"],
        description: data["description"],
        date: data["date"],
        time: data["time"],
        type: data["type"],
        contact: data["contact"],
        channel: data["channel"],
        link: data["link"],
        address: data["address"],
        zipCode: data["zipCode"],
        image: data["image"],
        video: data["video"],
        buttonText: data["buttonText"],
        catalog: data["catalog"],
        isEnabled: data["isEnabled"],
        isFeatured: data["isFeatured"],
        auctionHouseId: data["auctionHouseId"],
        cityId: data["cityId"],
        player: data["player"],
        local: data["local"],
        status: data["status"],
        phone: data["phone"],
        createdAt: data["createdAt"],
        updatedAt: data["updatedAt"],
        auctionhouse: data["auctionhouse"],
        city: data["city"],
        catalogUrl: data["catalogUrl"],
      );
}
