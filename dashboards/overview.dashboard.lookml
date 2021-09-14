- dashboard: overview
  title: Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Most Used Tender Types MTD
    name: Most Used Tender Types MTD
    model: block_braintree_v2
    explore: transaction
    type: looker_pie
    fields: [transaction.tender_display, transaction.count]
    filters:
      transaction.created_date: 1 months
    sorts: [transaction.count desc]
    limit: 8
    dynamic_fields: [{table_calculation: number_of_transactions, label: Number of
          Transactions, expression: 'row()*rand()*${transaction.count}', value_format: !!null '',
        value_format_name: decimal_0, is_disabled: false, _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: lab
    inner_radius: 50
    color_application:
      collection_id: legacy
      custom:
        id: bad07ff8-aaca-28a1-0e56-4a3c00022f49
        label: Custom
        type: continuous
        stops:
        - color: "#282828"
          offset: 0
        - color: "#f2f2f2"
          offset: 50
        - color: "#0092E5"
          offset: 100
      options:
        steps: 5
        reverse: false
    series_colors: {}
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
    hidden_fields: [transaction.count]
    listen: {}
    row: 12
    col: 0
    width: 10
    height: 9
  - title: Average Transaction by Tender Type
    name: Average Transaction by Tender Type
    model: block_braintree_v2
    explore: transaction
    type: looker_bar
    fields: [transaction.average_amount, transaction.tender_display]
    sorts: [transaction.average_amount desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: transaction.average_amount,
            id: transaction.average_amount, name: Average Transaction}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hide_legend: false
    series_types: {}
    series_colors:
      transaction.average_amount: "#0092E5"
    reference_lines: [{reference_type: line, line_value: mean, range_start: mean,
        range_end: median, margin_top: variance, margin_value: mean, margin_bottom: deviation,
        label_position: left, color: "#000000", label: '', value_format: "$#.## \\\
          A\\v\\e\\r\\a\\g\\e"}]
    show_dropoff: false
    defaults_version: 1
    listen: {}
    row: 21
    col: 16
    width: 8
    height: 9
  - title: Average Transaction by Month
    name: Average Transaction by Month
    model: block_braintree_v2
    explore: transaction
    type: looker_column
    fields: [transaction.average_amount, transaction.month_linker]
    filters:
      transaction.created_month: 12 months
    sorts: [transaction.month_linker]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    hide_legend: false
    series_colors:
      transaction.average_amount: "#0092E5"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", value_format: "$#.## \\A\\v\\e\\r\\a\\g\\e"}]
    show_dropoff: false
    defaults_version: 1
    listen: {}
    row: 21
    col: 0
    width: 8
    height: 9
  - title: Global Transactions Heatmap
    name: Global Transactions Heatmap
    model: block_braintree_v2
    explore: transaction
    type: looker_map
    fields: [transaction.count, transaction.shipping_address_country_name]
    limit: 5000
    dynamic_fields: [{table_calculation: average_transaction, label: Average Transaction,
        expression: "${transaction.total_amount}/${transaction.count}", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true}]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: dark_no_labels
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 37.78699608830537
    map_longitude: -2.7232360839843754
    map_zoom: 2
    map_value_colors: ["#FFF", "#0092E5"]
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
    map: auto
    map_projection: ''
    quantize_colors: false
    listen: {}
    row: 12
    col: 10
    width: 14
    height: 9
  - title: Tender Monthly Breakdown
    name: Tender Monthly Breakdown
    model: block_braintree_v2
    explore: transaction
    type: looker_donut_multiples
    fields: [transaction.total_amount, transaction.tender_display, transaction.month_linker]
    pivots: [transaction.tender_display]
    filters:
      transaction.created_month: 4 months
    sorts: [transaction.tender_display 0]
    limit: 500
    show_value_labels: false
    font_size: 14
    charts_across: 2
    color_application:
      collection_id: legacy
      custom:
        id: 8978b4be-4d90-c81e-f0ac-5c686bca3fad
        label: Custom
        type: continuous
        stops:
        - color: "#282828"
          offset: 0
        - color: "#ebf2ff"
          offset: 50
        - color: "#0092E5"
          offset: 100
      options:
        steps: 5
    series_colors: {}
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 21
    col: 8
    width: 8
    height: 9
  - title: Historical Transactions
    name: Historical Transactions
    model: block_braintree_v2
    explore: transaction
    type: looker_line
    fields: [transaction.total_amount, transaction.count, transaction.month_linker]
    sorts: [transaction.month_linker]
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
    interpolation: linear
    color_application:
      collection_id: legacy
      palette_id: black_to_gray
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: transaction.total_amount,
            id: transaction.total_amount, name: Total Amount}], showLabels: true,
        showValues: true, maxValue: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: transaction.count, id: transaction.count, name: Number of
              Transactions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      transaction.count: column
      transaction.total_amount: area
    series_colors:
      transaction.total_amount: "#3b3b3b"
      transaction.count: "#0092E5"
    swap_axes: false
    defaults_version: 1
    listen: {}
    row: 4
    col: 0
    width: 14
    height: 8
  - title: 30 Day Credit/Debit Waterfall
    name: 30 Day Credit/Debit Waterfall
    model: block_braintree_v2
    explore: transaction
    type: looker_waterfall
    fields: [transaction.type, transaction.total_amount, transaction.created_date]
    filters:
      transaction.type: olive,aqua
      transaction.created_date: 180 days
    sorts: [transaction.created_date desc]
    limit: 500
    column_limit: 30
    dynamic_fields: [{table_calculation: total_amount, label: Total Amount, expression: 'if(${transaction.type}="aqua",
          ${transaction.total_amount}*-1, ${transaction.total_amount})', value_format: !!null '',
        value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    up_color: "#0092E5"
    down_color: "#282828"
    total_color: "#0092E5"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: false
    x_axis_scale: auto
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_gridlines: false
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: [transaction.total_amount, transaction.type]
    listen: {}
    row: 4
    col: 14
    width: 10
    height: 8
  - title: Subscriptions MTD
    name: Subscriptions MTD
    model: block_braintree_v2
    explore: transaction
    type: single_value
    fields: [subscription.created_month, subscriptions]
    pivots: [subscription.created_month]
    fill_fields: [subscription.created_month]
    sorts: [subscription.created_month desc]
    limit: 500
    dynamic_fields: [{measure: subscriptions, based_on: subscription.count, type: count_distinct,
        label: Subscriptions, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${subscription.created_day_of_month}\
          \ < ${transaction.today_day_of_month}"}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#282828"
    single_value_title: Subscriptions MTD
    comparison_label: Previous MTD
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
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 4
  - title: New Tile
    name: New Tile
    model: block_braintree_v2
    explore: transaction
    type: single_value
    fields: [transaction_amount, transaction.created_month]
    pivots: [transaction.created_month]
    fill_fields: [transaction.created_month]
    sorts: [transaction.created_month desc]
    limit: 500
    dynamic_fields: [{measure: transaction_amount, based_on: transaction.total_amount,
        type: count_distinct, label: Transaction Amount, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_day_of_month}\
          \ < ${transaction.today_day_of_month}"}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#282828"
    single_value_title: Transactions Total MTD
    comparison_label: Previous MTD
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
    listen: {}
    row: 0
    col: 6
    width: 6
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: block_braintree_v2
    explore: transaction
    type: single_value
    fields: [number_of_transactions, transaction.created_month]
    pivots: [transaction.created_month]
    fill_fields: [transaction.created_month]
    sorts: [transaction.created_month desc]
    limit: 500
    dynamic_fields: [{measure: number_of_transactions, based_on: transaction.count,
        type: count_distinct, label: Number of Transactions, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${transaction.created_day_of_month}\
          \ < ${transaction.today_day_of_month}"}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#282828"
    single_value_title: Transactions MTD
    comparison_label: Previous MTD
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
    listen: {}
    row: 0
    col: 12
    width: 6
    height: 4
  - title: New Tile
    name: New Tile (3)
    model: block_braintree_v2
    explore: transaction
    type: single_value
    fields: [disputes, transaction.created_month]
    pivots: [transaction.created_month]
    fill_fields: [transaction.created_month]
    sorts: [transaction.created_month desc]
    limit: 500
    dynamic_fields: [{measure: disputes, based_on: dispute.count, type: count_distinct,
        label: Disputes, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: "${transaction.created_day_of_month}\
          \ < ${transaction.today_day_of_month}"}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#282828"
    single_value_title: Disputes MTD
    comparison_label: Previous MTD
    conditional_formatting: [{type: not null, value: !!null '', background_color: '',
        font_color: "#0092E5", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 4