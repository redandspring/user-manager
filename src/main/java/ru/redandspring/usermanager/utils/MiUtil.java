package ru.redandspring.usermanager.utils;

public class MiUtil
{
    public static int getOffset(final int page, final int pageSize)
    {
        return pageSize * (page - 1);
    }
}
