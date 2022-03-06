class OrderBook {
/*
{
  "timestamp": "1646580100",
  "microtimestamp": "1646580100576784",
  "bids": [
    [
      "2614.27"
    ]
  ],
  "asks": [
    [
      "2615.95"
    ]
  ]
} 
*/

  String? timestamp;
  String? microtimestamp;
  List<List<String?>?>? bids;
  List<List<String?>?>? asks;

  OrderBook({
    this.timestamp,
    this.microtimestamp,
    this.bids,
    this.asks,
  });
  OrderBook.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp']?.toString();
    microtimestamp = json['microtimestamp']?.toString();
    if (json['bids'] != null && (json['bids'] is List)) {
      final v = json['bids'];
      final arr0 = <List<String>>[];
      v.forEach((v) {
        final arr1 = <String>[];
        v.forEach((v) {
          arr1.add(v.toString());
        });
        arr0.add(arr1);
      });
      bids = arr0;
    }
    if (json['asks'] != null && (json['asks'] is List)) {
      final v = json['asks'];
      final arr0 = <List<String>>[];
      v.forEach((v) {
        final arr1 = <String>[];
        v.forEach((v) {
          arr1.add(v.toString());
        });
        arr0.add(arr1);
      });
      asks = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['microtimestamp'] = microtimestamp;
    if (bids != null) {
      final v = bids;
      final arr0 = [];
      v!.forEach((v) {
        final arr1 = [];
        v!.forEach((v) {
          arr1.add(v);
        });
        arr0.add(arr1);
      });
      data['bids'] = arr0;
    }
    if (asks != null) {
      final v = asks;
      final arr0 = [];
      v!.forEach((v) {
        final arr1 = [];
        v!.forEach((v) {
          arr1.add(v);
        });
        arr0.add(arr1);
      });
      data['asks'] = arr0;
    }
    return data;
  }
}
