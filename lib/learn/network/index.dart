import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> _list = [];

  @override
  void initState() {
    super.initState();
    // 在这里开始发起网络请求
    _getChannels();
  }

  void _getChannels() async {
    DioUtil dioUtil = DioUtil();
    Response<dynamic> response = await dioUtil.get('/channels');
    Map<String, dynamic> result = response.data as Map<String, dynamic>;
    List data = result['data']['channels'] as List;
    _list = data.cast<Map<String, dynamic>>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Dio案例"))),
        body: GridView.extent(
          maxCrossAxisExtent: 200,
          padding: EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2,
          children: List.generate(_list.length, (index) {
            return ChannelItem(
              item: _list[index],
              callback: (item) {
                setState(() {
                  _list.remove(item);
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

class ChannelItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(Map<String, dynamic> item) callback;

  const ChannelItem({super.key, required this.item, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            item['name'] ?? '--',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        IconButton(
          color: Colors.black,
          onPressed: () {
            callback(item);
          },
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}

class DioUtil {
  final Dio _dio = Dio();

  DioUtil() {
    // _dio.options.baseUrl = 'https://geek.itheima.net/v1_0/';
    // _dio.options.connectTimeout = Duration(seconds: 10);
    // _dio.options.receiveTimeout = Duration(seconds: 10);
    // _dio.options.sendTimeout = Duration(seconds: 10);

    // 连续赋值
    _dio.options
      ..baseUrl = 'https://geek.itheima.net/v1_0'
      ..connectTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10);

    // 拦截器
    _addInterceptors();
  }

  // 构造拦截器
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return handler.next(response);
          }
          return handler.reject(
            DioException(requestOptions: response.requestOptions),
          );
        },
        onError: (error, handler) {
          return handler.reject(error);
        },
      ),
    );
  }

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}
