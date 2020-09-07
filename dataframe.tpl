{% extends 'markdown.tpl'%}


{% block output %}
    {% if '<table border="1" class="dataframe">' in cell.output %}
        <div class="dataframe-wrapper">
        {{ super() }}
        </div>
    {% else %}
        {{ super() }}
    {% endif %}
{% endblock output %}
