import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymobCheckoutView extends StatefulWidget {
  final String checkoutUrl;
  final Function(Map<String, dynamic> params) onSuccess;
  final Function(String error) onError;
  final Function() onCancel;
  final String note;

  const PaymobCheckoutView({
    Key? key,
    required this.checkoutUrl,
    required this.onSuccess,
    required this.onError,
    required this.onCancel,
    this.note = '',
  }) : super(key: key);

  @override
  State<PaymobCheckoutView> createState() => _PaymobCheckoutViewState();
}

class _PaymobCheckoutViewState extends State<PaymobCheckoutView> {
  InAppWebViewController? _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  void _handleUrlChange(String url) {
    debugPrint('URL changed: $url');

    if (url.contains('success') || url.contains('approved')) {
      final uri = Uri.parse(url);
      final params = <String, dynamic>{};

      uri.queryParameters.forEach((key, value) {
        params[key] = value;
      });

      widget.onSuccess(params);
    } else if (url.contains('cancel') || url.contains('cancelled')) {
      widget.onCancel();
    } else if (url.contains('fail') || url.contains('error')) {
      final uri = Uri.parse(url);
      final error = uri.queryParameters['error'] ?? 'Payment failed';
      widget.onError(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدفع - Paymob'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: widget.onCancel,
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(widget.checkoutUrl),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
              ),
            ),
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            onLoadStart: (controller, url) {
              if (url != null) {
                _handleUrlChange(url.toString());
              }
              setState(() => _isLoading = true);
            },
            onLoadStop: (controller, url) async {
              if (url != null) {
                _handleUrlChange(url.toString());
              }
              setState(() => _isLoading = false);
            },
            onProgressChanged: (controller, progress) {
              if (progress == 100) {
                setState(() => _isLoading = false);
              }
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          if (widget.note.isNotEmpty)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.note,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
