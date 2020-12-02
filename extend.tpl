{% extends 'markdown.tpl'%}

{% block any_cell %}
{% if 'important-note' in cell['metadata'].get('tags', []) %}
<div class="important-note">
    <p>
        {{ super() }}
    </p>
</div>
{% else %} 
{{ super() }}
{% endif %}
{% endblock any_cell %}

{% block output %}
{% if 'dataframe' in cell['metadata'].get('tags', []) %}
<div class="dataframe-wrapper">
    {{ super() }}
</div>
{% else %}
{{ super() }}
{% endif %}
{% endblock output %}
