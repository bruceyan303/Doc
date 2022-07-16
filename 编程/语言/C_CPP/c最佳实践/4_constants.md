## 第四讲：常量的定义和使用

- 常量 constant
- 不区分类型的使用常量

```c
#include <stdbool.h>
static inline bool istab(char  c)
{
    return (c==0x09);//推荐使用 return (c=='\t');
}
```

- 直接用常量定义数组等大小

```c
char buf[1024];
sprintf(buf,"home/%s/%s",user_name,file_name);
...
```

XXX 正确用法：让编译器帮我们计算常量 sizeof在预编译后就计算完了

```c
#include <stdlib.h>// for PATH_MAX and NAME_MAX
char buf[PATH_MAX+NAME_MAX];
snprintf(buf,sizeof(buf),"home/%s/%s",user_name,file_name);
...
```

- 直接用使用常量进行位运行算

```c
static inline bool is_xxx(unsigned int x){
    return x&0x01;//使用宏不用使用常量
}
static inline bool is_yyy(unsigned int y){
    return y&0x02;//使用宏不用使用常量
}
```

- 对重复出现的字符串常量，不使用宏定义

```c
static struct pcdvojbs_dvobjs text[]={
   {"head", text_head_getter,null},
    {"tail", text_head_getter,null}
};
static struct pcdvojbs_dvobjs bin[]={
   {"head", text_head_getter,null},
    {"tai1", text_head_getter,null}//l写成了数字1 使用宏字符串
};
```

- 不善管理长字符串常量
- 在 case 语句中使用常量而不是枚举量

```c
#if defined(__LP64__)
#   define DEF_NR_TIMERS   64
#else
#   define DEF_NR_TIMERS   32
#endif

static int first_slot;
static unsigned long expired_timer_mask;

    ...

    int slot = first_slot;
    do {
        if (expired_timer_mask & (0x01 << slot))//0x01默认位数位32 64位系统就出问题了，正确是0x01UL
        break;

        slot++;
        slot %= DEF_NR_TIMERS;
        if (slot == first_timer_slot) {
            slot = -1;
            break;
        }
    } while (1);

    first_timer_slot++;
    first_timer_slot %= DEF_NR_TIMERS;

    ...
```
