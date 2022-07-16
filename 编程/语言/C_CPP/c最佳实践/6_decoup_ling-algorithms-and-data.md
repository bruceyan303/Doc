## 第六讲：解耦算法和数据

1. 使用宏定义字符串常量，避免手误产生的错误。
2. 使用编译期断言避免出现未有效维护的情形。

```c
static const char *type_names[] = {
    VARIANT_TYPE_NAME_UNDEFINED,
    VARIANT_TYPE_NAME_NULL,
    VARIANT_TYPE_NAME_BOOLEAN,
    VARIANT_TYPE_NAME_NUMBER,
    VARIANT_TYPE_NAME_LONGINT,
    VARIANT_TYPE_NAME_ULONGINT,
    VARIANT_TYPE_NAME_LONGDOUBLE,
    VARIANT_TYPE_NAME_ATOMSTRING,
    VARIANT_TYPE_NAME_STRING,
    VARIANT_TYPE_NAME_BYTESEQUENCE,
    VARIANT_TYPE_NAME_DYNAMIC,
    VARIANT_TYPE_NAME_NATIVE,
    VARIANT_TYPE_NAME_OBJECT,
    VARIANT_TYPE_NAME_ARRAY,
    VARIANT_TYPE_NAME_SET,
};
//PURC_VARIANT_TYPE_NR 最大值
/* Make sure the number of variant types matches the size of `type_names` */
#define _COMPILE_TIME_ASSERT(name, x)               \
       typedef int _dummy_ ## name[(x) * 2 - 1]

_COMPILE_TIME_ASSERT(types, PCA_TABLESIZE(type_names) == PURC_VARIANT_TYPE_NR);

#undef _COMPILE_TIME_ASSERT

static purc_variant_t
type_getter (purc_variant_t root, size_t nr_args, purc_variant_t *argv)
{
    UNUSED_PARAM(root);

    if ((argv == NULL) || (nr_args == 0)) {
        pcinst_set_error (PURC_ERROR_WRONG_ARGS);
        return PURC_VARIANT_INVALID;
    }

    assert (argv[0] != PURC_VARIANT_INVALID);

    /* make sure that the first one is `undefined` */
    assert (strcmp (type_names[PURC_VARIANT_TYPE_FIRST],
                VARIANT_TYPE_NAME_UNDEFINED) == 0);
    /* make sure that the last one is `set` */
    assert (strcmp (type_names[PURC_VARIANT_TYPE_LAST],
                VARIANT_TYPE_NAME_SET) == 0);

    return purc_variant_make_string_static (
            type_names [purc_variant_get_type (argv[0])], false);
}
```
