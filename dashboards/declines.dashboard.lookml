- dashboard: declines
  title: Declines
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Declines By Status
    name: Declines By Status
    model: block_braintree_v2
    explore: transaction
    type: looker_column
    fields: [transaction.status, transaction.amount_of_decline, transaction.created_month,
      transaction.count_declines]
    pivots: [transaction.status]
    filters:
      transaction.count_declines: ">0"
    sorts: [transaction.created_month desc, transaction.status]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: pivot
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      custom:
        id: 1cd70b0b-3ecc-908c-1a21-7c70eec72594
        label: Custom
        type: discrete
        colors:
        - "#282828"
        - "#0092E5"
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: transaction.count_declines,
            id: AuthorizationExpired - transaction.count_declines, name: AuthorizationExpired
              - Transaction Number of Declines}, {axisId: transaction.count_declines,
            id: Failed - transaction.count_declines, name: Failed - Transaction Number
              of Declines}, {axisId: transaction.count_declines, id: GatewayRejected
              - transaction.count_declines, name: GatewayRejected - Transaction Number
              of Declines}, {axisId: transaction.count_declines, id: ProcessorDeclined
              - transaction.count_declines, name: ProcessorDeclined - Transaction
              Number of Declines}, {axisId: transaction.count_declines, id: SettlementDeclined
              - transaction.count_declines, name: SettlementDeclined - Transaction
              Number of Declines}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: transaction.amount_of_decline, id: AuthorizationExpired
              - transaction.amount_of_decline, name: AuthorizationExpired - Transaction
              Amount of Decline}, {axisId: transaction.amount_of_decline, id: Failed
              - transaction.amount_of_decline, name: Failed - Transaction Amount of
              Decline}, {axisId: transaction.amount_of_decline, id: GatewayRejected
              - transaction.amount_of_decline, name: GatewayRejected - Transaction
              Amount of Decline}, {axisId: transaction.amount_of_decline, id: ProcessorDeclined
              - transaction.amount_of_decline, name: ProcessorDeclined - Transaction
              Amount of Decline}, {axisId: transaction.amount_of_decline, id: SettlementDeclined
              - transaction.amount_of_decline, name: SettlementDeclined - Transaction
              Amount of Decline}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    trellis_rows: 1
    series_types:
      GatewayRejected - transaction.amount_of_decline: area
      ProcessorDeclined - transaction.amount_of_decline: area
      SettlementDeclined - transaction.amount_of_decline: area
      Failed - transaction.amount_of_decline: area
      AuthorizationExpired - transaction.amount_of_decline: area
    series_colors:
      AuthorizationExpired - transaction.amount_of_decline: "#282828"
      AuthorizationExpired - transaction.count_declines: "#0092E5"
      Failed - transaction.amount_of_decline: "#282828"
      Failed - transaction.count_declines: "#0092E5"
      GatewayRejected - transaction.amount_of_decline: "#282828"
      GatewayRejected - transaction.count_declines: "#0092E5"
      ProcessorDeclined - transaction.count_declines: "#0092E5"
      SettlementDeclined - transaction.amount_of_decline: "#282828"
      SettlementDeclined - transaction.count_declines: "#0092E5"
    defaults_version: 1
    listen:
      Date: transaction.created_month
    row: 0
    col: 14
    width: 10
    height: 19
  - title: Declined Transactions This Week
    name: Declined Transactions This Week
    model: block_braintree_v2
    explore: transaction
    type: single_value
    fields: [declines_this_week, transactions_this_week, number_of_declines_last_week,
      transactions_last_week]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: decline_percentage_this_week, label: Decline
          Percentage This Week, expression: "${declines_this_week}/if(${transactions_this_week}\
          \ = 0, null, ${transactions_this_week})", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}, {measure: declines_this_week, based_on: transaction.count_declines,
        type: count_distinct, label: Declines This Week, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_week}\
          \ = ${transaction.today_week}"}, {measure: transactions_this_week, based_on: transaction.count,
        type: count_distinct, label: Transactions This Week, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_week}\
          \ = ${transaction.today_week}"}, {measure: number_of_declines_last_week,
        based_on: transaction.count_declines, type: count_distinct, label: Number
          of Declines Last Week, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_week_of_year}\
          \ = ${transaction.today_week_of_year} -1 AND ${transaction.created_year}\
          \ = ${transaction.today_year}"}, {measure: transactions_last_week, based_on: transaction.count,
        type: count_distinct, label: Transactions Last Week, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_week_of_year}\
          \ = ${transaction.today_week_of_year} -1 AND ${transaction.created_year}\
          \ = ${transaction.today_year}"}, {table_calculation: percent_of_declines_last_week,
        label: Percent of Declines Last Week, expression: "${number_of_declines_last_week}/if(${transactions_last_week}\
          \ = 0, null, ${transactions_last_week})", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}, {table_calculation: comparison,
        label: Comparison, expression: "${decline_percentage_this_week} - ${percent_of_declines_last_week}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Compared to Last Week
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [declines_this_week, transactions_this_week, transactions_last_week,
      number_of_declines_last_week, percent_of_declines_last_week]
    row: 0
    col: 0
    width: 7
    height: 4
  - title: Declined Transaction Amount This Week
    name: Declined Transaction Amount This Week
    model: block_braintree_v2
    explore: transaction
    type: single_value
    fields: [amount_of_decline_this_week, amount_of_decline_last_week]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: comparison, label: Comparison, expression: "${amount_of_decline_this_week}\
          \ - ${amount_of_decline_last_week}", value_format: !!null '', value_format_name: usd,
        is_disabled: false, _kind_hint: measure, _type_hint: number}, {measure: amount_of_decline_this_week,
        based_on: transaction.amount_of_decline, type: count_distinct, label: Amount
          of Decline This Week, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_week}\
          \ = ${transaction.today_week}"}, {measure: transactions_this_week, based_on: transaction.count,
        type: count_distinct, label: Transactions This Week, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_week}\
          \ = ${transaction.today_week}"}, {measure: amount_of_decline_last_week,
        based_on: transaction.amount_of_decline, type: count_distinct, label: Amount
          of Decline Last Week, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_week_of_year}\
          \ = ${transaction.today_week_of_year} -1 AND ${transaction.created_year}\
          \ = ${transaction.today_year}"}, {measure: transactions_last_week, based_on: transaction.count,
        type: count_distinct, label: Transactions Last Week, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_week_of_year}\
          \ = ${transaction.today_week_of_year} -1 AND ${transaction.created_year}\
          \ = ${transaction.today_year}"}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Compared to Last Week
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [declines_this_week, number_of_declines_last_week, amount_of_decline_last_week]
    row: 0
    col: 7
    width: 7
    height: 4
  - title: Declined Transactions
    name: Declined Transactions
    model: block_braintree_v2
    explore: transaction
    type: looker_grid
    fields: [transaction.updated_date, transaction.id, transaction.tender_display,
      transaction.billing_address_first_name, transaction.billing_address_last_name,
      registered_customer.email, registered_customer.phone, transaction.amount_of_decline,
      transaction.status]
    filters:
      transaction.status: ''
      transaction.denied: 'Yes'
    sorts: [transaction.updated_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", transaction.updated_date, transaction.id,
      transaction.status, transaction.tender_display, transaction.amount_of_decline,
      transaction.billing_address_first_name, transaction.billing_address_last_name,
      registered_customer.email, registered_customer.phone]
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      transaction.amount_of_decline:
        is_active: true
        palette:
          palette_id: 39507a8a-752e-25e7-c27f-e11cad20be34
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#F36254"
    series_value_format:
      transaction.id:
        name: id
        format_string: '0'
        label: ID
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: transaction.updated_date
    row: 4
    col: 0
    width: 14
    height: 15
  - title: Frequently Declined Customers
    name: Frequently Declined Customers
    model: block_braintree_v2
    explore: transaction
    type: looker_grid
    fields: [registered_customer.first_name, registered_customer.last_name, registered_customer.email,
      registered_customer.company, registered_customer.website, registered_customer.phone,
      transaction.count_declines, transaction.amount_of_decline]
    filters:
      transaction.denied: 'Yes'
      registered_customer.email: "-NULL"
    sorts: [transaction.count_declines desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", registered_customer.company, registered_customer.first_name,
      registered_customer.last_name, registered_customer.email, registered_customer.website,
      registered_customer.phone, transaction.count_declines, transaction.amount_of_decline]
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      transaction.count_declines:
        is_active: true
        palette:
          palette_id: ea80a1d3-c847-dcca-b619-6f299d08fdc6
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#F36254"
      transaction.amount_of_decline:
        is_active: true
        palette:
          palette_id: 519c3a79-bd3c-7a61-a6b0-d8943df0f64c
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#F36254"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: transaction.created_date
    row: 19
    col: 8
    width: 16
    height: 12
  - title: Declined Transactions By Type
    name: Declined Transactions By Type
    model: block_braintree_v2
    explore: transaction
    type: looker_scatter
    fields: [transaction.tender_display, transaction.count_declines, transaction_ndt.count_declines,
      transaction.amount_of_decline, transaction.count]
    pivots: [transaction.tender_display]
    sorts: [transaction.count_declines desc 0, transaction.tender_display]
    limit: 500
    dynamic_fields: [{table_calculation: decline_rate, label: Decline Rate, expression: "${transaction.count_declines}/if(${transaction.count}=0,null,\
          \ ${transaction.count})", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: transaction.amount_of_decline,
            id: Android Pay - transaction.amount_of_decline, name: Android Pay}, {
            axisId: transaction.amount_of_decline, id: Apple Pay - transaction.amount_of_decline,
            name: Apple Pay}, {axisId: transaction.amount_of_decline, id: Credit Card
              - transaction.amount_of_decline, name: Credit Card}, {axisId: transaction.amount_of_decline,
            id: MasterPass card - transaction.amount_of_decline, name: MasterPass
              card}, {axisId: transaction.amount_of_decline, id: Paypal - transaction.amount_of_decline,
            name: Paypal}, {axisId: transaction.amount_of_decline, id: Samsung Pay
              - transaction.amount_of_decline, name: Samsung Pay}, {axisId: transaction.amount_of_decline,
            id: US Bank - transaction.amount_of_decline, name: US Bank}, {axisId: transaction.amount_of_decline,
            id: Venmo - transaction.amount_of_decline, name: Venmo}, {axisId: transaction.amount_of_decline,
            id: Visa Checkout - transaction.amount_of_decline, name: Visa Checkout}],
        showLabels: true, showValues: true, minValue: 1, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_label: Number of Declines
    size_by_field: decline_rate
    hidden_series: []
    hide_legend: false
    font_size: '12'
    trellis_rows: 2
    series_types: {}
    series_colors: {}
    series_labels:
      transaction.amount_of_decline: Declined Transaction Amount
    value_labels: labels
    label_type: labPer
    inner_radius: 40
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    interpolation: linear
    defaults_version: 1
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [transaction.count_declines, transaction.count]
    listen:
      Date: transaction.created_date
    row: 19
    col: 0
    width: 8
    height: 12
  - title: Declined Transaction Distribution
    name: Declined Transaction Distribution
    model: block_braintree_v2
    explore: transaction
    type: block-braintree::block-braintree-sankey
    fields: [transaction.risk_data_decision, transaction.processor_authorization_type,
      transaction.status, transaction.count]
    filters:
      transaction.denied: 'Yes'
      transaction.processor_authorization_type: "-Approved"
    sorts: [transaction.count desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    color_range: ["#294987", "#5a1038", "#ff947c", "#1f6b62", "#764173", "#910303",
      "#b2947c", "#192d54", "#a31e67", "#a16154", "#0f544b", "#ffd9ba"]
    label_type: name
    show_null_points: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    series_types: {}
    listen:
      Date: transaction.created_date
    row: 43
    col: 0
    width: 24
    height: 12
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false