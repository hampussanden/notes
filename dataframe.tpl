{% extends 'markdown.tpl'%}


{% block output %}
{% if 'nodataframe' in cell['metadata'].get('tags', []) %}
    {{ super() }}
{% else %} 
<div class="dataframe-wrapper">
    {{ super() }}
</div>
{% endif %}
{% endblock output %}
