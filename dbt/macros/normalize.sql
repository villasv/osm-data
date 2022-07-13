{%- macro normalize(column_name) -%}
  trim(regexp_replace(regexp_replace(
    regexp_replace(lower({{ column_name }}), '[éè]', 'e'),
    '(caffe|cafe|coffee|\')',
    ''
  ), r'\s+' , ' '))
{%- endmacro -%}
