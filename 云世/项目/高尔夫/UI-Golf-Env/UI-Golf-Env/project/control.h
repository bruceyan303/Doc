#ifndef UI_CONTROL_H
#define UI_CONTROL_H
#define UI_ID int
#define UI_INT_8 char
#define UI_INT_16 short
#define UI_INT_32 int
#define UI_ENUM char
#define UI_TEXT int
#define UI_TEXT_PIC int
#define UI_TEXT_STR char
#define UI_IMAGE int
#define UI_PICLIST int
#define UI_RECT struct RECT
#define UI_COLOR int
#define UI_BACKGROUND_COLOR int
#define UI_BORDER struct css_border

struct RECT
{
	int x;
	int y;
	int height;
	int width;
};

struct css_border
{
	u8 left;
	u8 top;
	u8 right;
	u8 bottom;
	int color;
};
#endif //UI_CONTROL_H
