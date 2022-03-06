class PriceModel {
/*
{
  "high": "2686.64",
  "last": "2620.76",
  "timestamp": "1646579844",
  "bid": "2621.02",
  "vwap": "2639.11",
  "volume": "3563.41229441",
  "low": "2589.78",
  "ask": "2622.50",
  "open": "2664.06"
} 
*/

  String? high;
  String? last;
  String? timestamp;
  String? bid;
  String? vwap;
  String? volume;
  String? low;
  String? ask;
  String? open;

  PriceModel({
    this.high,
    this.last,
    this.timestamp,
    this.bid,
    this.vwap,
    this.volume,
    this.low,
    this.ask,
    this.open,
  });
  PriceModel.fromJson(Map<String, dynamic> json) {
    high = json['high']?.toString();
    last = json['last']?.toString();
    timestamp = json['timestamp']?.toString();
    bid = json['bid']?.toString();
    vwap = json['vwap']?.toString();
    volume = json['volume']?.toString();
    low = json['low']?.toString();
    ask = json['ask']?.toString();
    open = json['open']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['high'] = high;
    data['last'] = last;
    data['timestamp'] = timestamp;
    data['bid'] = bid;
    data['vwap'] = vwap;
    data['volume'] = volume;
    data['low'] = low;
    data['ask'] = ask;
    data['open'] = open;
    return data;
  }
}
