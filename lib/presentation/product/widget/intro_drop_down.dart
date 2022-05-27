import 'package:beans_instapay/presentation/home/product/drop_box_event.dart';
import 'package:beans_instapay/presentation/home/product/product_event.dart';
import 'package:beans_instapay/presentation/product/widget/product_intro_view_model.dart';

import 'package:beans_instapay/ui/on_hover_detect.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum DropDownValueType {
  string,
  int,
}

class IntroDropDown extends StatefulWidget {
  final List<String> items;
  final String initValue;
  final DropDownValueType type;
  final String name;
  Function? removeOverlay;
  Function? onEvent;

  IntroDropDown({
    Key? key,
    required this.items,
    required this.initValue,
    required this.type,
    required this.name,
    this.onEvent,
    this.removeOverlay,
  }) : super(key: key);

  @override
  State<IntroDropDown> createState() => _IntroDropDownState();
}

class _IntroDropDownState extends State<IntroDropDown> {
  String _dropdownValue = '';

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final double _dropdownWidth = 300;
  final double _dropdownHeight = 48;

  void _createOverlay(ProductIntroViewModel viewModel) {
    if (_overlayEntry == null) {
      _overlayEntry = _introDropdown(viewModel);
      Overlay.of(context)?.insert(_overlayEntry!);
    } else {
      removeOverlay();
    }
  }

  void removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  void initState() {
    _dropdownValue = widget.initValue;
    widget.removeOverlay = removeOverlay;
    super.initState();
  }

  @override
  void dispose() {
    _overlayEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = (context).watch<ProductIntroViewModel>();

    return Center(
      child: InkWell(
        onTap: () {
          _createOverlay(viewModel);
          viewModel.onDropBoxEvent(DropBoxEvent.tapped(widget.name));
        },
        child: CompositedTransformTarget(
          link: _layerLink,
          child: Container(
            width: _dropdownWidth,
            height: _dropdownHeight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.zero,
            ),
            child: Stack(
              children: [
                // 선택값.
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      _dropdownValue,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 22 / 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                // 아이콘.
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry _introDropdown(ProductIntroViewModel viewModel) {
    return OverlayEntry(
      maintainState: true,
      builder: (context) => Positioned(
        width: _dropdownWidth,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0, _dropdownHeight),
          child: Material(
            color: Colors.white,
            child: Container(
              height: (widget.items.length > 5)
                  ? (22.0 * 5) + (21 * (5 - 1)) + 20
                  : (22.0 * widget.items.length) + (21 * (widget.items.length - 1)) + 20,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.zero,
              ),
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final weight =
                      (widget.items.elementAt(index) == _dropdownValue)
                          ? FontWeight.bold
                          : FontWeight.normal;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (widget.type == DropDownValueType.int) {
                          _dropdownValue = widget.items.elementAt(index);
                          viewModel.onEvent(ProductEvent.selectProductCount(
                              int.parse(_dropdownValue)));
                        } else {
                          _dropdownValue = widget.items.elementAt(index);
                          viewModel.onEvent(
                              ProductEvent.selectProductValue(_dropdownValue));
                        }
                      });
                      removeOverlay();
                    },
                    child: OnHoverDetect(
                      builder: (isHovered) {
                        final color = (isHovered)
                            ? Colors.grey.withOpacity(0.2)
                            : Colors.white;
                        return Container(
                          color: color,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                widget.items.elementAt(index),
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 22 / 16,
                                  color: Colors.black,
                                  fontWeight: weight,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                    height: 1,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
