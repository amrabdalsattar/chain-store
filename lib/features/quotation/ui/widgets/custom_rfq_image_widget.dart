part of '../screens/new_quotation_screen.dart';

class CustomRFQImageWidget extends StatelessWidget {
  final NewQuotationCubit cubit;
  const CustomRFQImageWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        if (cubit.images.isEmpty) {
          return InkWell(
            onTap: () {
              ImagePickerHelper.pickImage(
                maxImages: 1,
                currentImages: [],
                onImagePicked: (image) {
                  cubit.addImage(image);
                  setState(() {}); // To update the UI
                },
                onError: (error) {
                  DialogsHelper.showErrorDialog(context, error);
                },
              );
            },
            child: DottedBorder(
              color: ColorsHelper.semiGray,
              dashPattern: const [8],
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              padding: const EdgeInsets.all(6),
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: ColorsHelper.semiGray, size: 30.w),
                    verticalSpace(8),
                    Text(
                      'Add images',
                      style: AppTextStyles.robotoDarkGrayMedium14.copyWith(
                        color: ColorsHelper.semiGray,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  cubit.images[0],
                  fit: BoxFit.cover,
                  height: 100.h,
                  width: 100.w,
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () {
                    cubit.removeImage();
                    setState(() {}); // To update the UI
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
