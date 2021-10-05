- dashboard: disputes
  title: Disputes
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Disputes This Week
    name: Disputes This Week
    model: block_braintree_v2
    explore: transaction
    type: single_value
    fields: [disputes_this_week, disputes_last_week]
    limit: 500
    dynamic_fields: [{measure: disputes_this_week, based_on: dispute.count, type: count_distinct,
        label: Disputes This Week, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${dispute.opened_week}\
          \ = ${transaction.today_week}"}, {measure: disputes_last_week, based_on: dispute.count,
        type: count_distinct, label: Disputes Last Week, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${dispute.opened_week_of_year}\
          \ = ${transaction.today_week_of_year}-1 AND ${dispute.opened_year} = ${transaction.today_year}"},
      {table_calculation: disputes_last_week_2, label: Disputes Last Week, expression: "${disputes_this_week}\
          \ - ${disputes_last_week}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    hidden_fields: [disputes_last_week]
    row: 0
    col: 0
    width: 7
    height: 4
  - title: Dispute Acceptance Rate
    name: Dispute Acceptance Rate
    model: block_braintree_v2
    explore: transaction
    type: single_value
    fields: [dispute.count, accepted_disputes, accepted_amount]
    filters:
      dispute.reason: "-NULL"
    sorts: [accepted_amount desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: dispute_acceptance_rate, label: Dispute Acceptance
          Rate, expression: "${accepted_disputes} / if(${dispute.count} = 0, null,\
          \ ${dispute.count})", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}, {measure: accepted_disputes, based_on: dispute.count,
        type: count_distinct, label: Accepted Disputes, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: '${dispute.status}
          = "Accepted"'}, {measure: accepted_amount, based_on: dispute.total_dispute_amount,
        type: count_distinct, label: Accepted Amount, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: '${dispute.status}
          = "Accepted"'}, {table_calculation: accepted_amount_viz, label: Accepted
          Amount (Viz), expression: "${accepted_amount}", value_format: !!null '',
        value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Total Accepted Amount
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
    x_axis_reversed: true
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
    y_axes: [{label: '', orientation: left, series: [{axisId: accepted_amount, id: accepted_amount,
            name: Accepted Amount}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: dispute_acceptance_rate, id: dispute_acceptance_rate,
            name: Dispute Acceptance Rate}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: dispute_acceptance_rate
    series_types: {}
    series_colors:
      accepted_amount: "#282828"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: Average Acceptance Amount}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dispute.count, accepted_disputes, accepted_amount]
    interpolation: linear
    listen:
      Date: dispute.opened_date
    row: 0
    col: 7
    width: 7
    height: 4
  - title: Disputes By Type
    name: Disputes By Type
    model: block_braintree_v2
    explore: transaction
    type: looker_column
    fields: [dispute.total_dispute_amount, dispute.count, dispute.opened_month, dispute.kind]
    pivots: [dispute.kind]
    fill_fields: [dispute.opened_month]
    filters:
      dispute.opened_date: ''
      dispute.kind: "-NULL"
    sorts: [dispute.opened_month desc, dispute.kind]
    limit: 500
    column_limit: 50
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
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      custom:
        id: 650a57b3-e085-85db-7947-55f9bbc9e844
        label: Custom
        type: discrete
        colors:
        - "#282828"
        - "#0092E5"
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: dispute.count, id: Chargeback
              - dispute.count, name: Chargeback - Dispute Number of Disputes}, {axisId: dispute.count,
            id: PreArbitration - dispute.count, name: PreArbitration - Dispute Number
              of Disputes}, {axisId: dispute.count, id: Retrieval - dispute.count,
            name: Retrieval - Dispute Number of Disputes}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: '', orientation: right,
        series: [{axisId: dispute.total_dispute_amount, id: Chargeback - dispute.total_dispute_amount,
            name: Chargeback - Dispute Total Dispute Amount}, {axisId: dispute.total_dispute_amount,
            id: PreArbitration - dispute.total_dispute_amount, name: PreArbitration
              - Dispute Total Dispute Amount}, {axisId: dispute.total_dispute_amount,
            id: Retrieval - dispute.total_dispute_amount, name: Retrieval - Dispute
              Total Dispute Amount}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    hide_legend: true
    trellis_rows: 1
    series_types:
      dispute.total_dispute_amount: area
      Chargeback - dispute.total_dispute_amount: area
      PreArbitration - dispute.total_dispute_amount: area
      Retrieval - dispute.total_dispute_amount: area
    series_colors:
      Retrieval - dispute.total_dispute_amount: "#282828"
      Retrieval - dispute.count: "#0092E5"
      PreArbitration - dispute.count: "#0092E5"
      PreArbitration - dispute.total_dispute_amount: "#282828"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Date: dispute.opened_month
    row: 0
    col: 14
    width: 10
    height: 17
  - title: Open Disputes
    name: Open Disputes
    model: block_braintree_v2
    explore: transaction
    type: looker_grid
    fields: [dispute.reason, dispute.opened_date, dispute.kind, transaction.id, registered_customer.email,
      registered_customer.phone, registered_customer.first_name, registered_customer.last_name,
      dispute.total_dispute_amount]
    filters:
      dispute.reason: "-NULL"
      dispute.status: Open
    sorts: [dispute.opened_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
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
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", dispute.opened_date, dispute.reason, dispute.kind,
      dispute.total_dispute_amount, transaction.id, registered_customer.first_name,
      registered_customer.last_name, registered_customer.phone, registered_customer.email]
    show_totals: true
    show_row_totals: true
    series_labels:
      transaction.id: Transaction ID
    series_cell_visualizations:
      dispute.total_dispute_amount:
        is_active: true
        palette:
          palette_id: da093063-9587-b275-2c4e-7ec744eb73fa
          collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
          custom_colors:
          - "#ffffff"
          - "#F36254"
    series_value_format:
      transaction.id:
        name: id
        format_string: '0'
        label: ID
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    size_by_field: dispute.total_dispute_amount
    hide_legend: false
    font_size: '12'
    series_types: {}
    series_colors:
      dispute.count: "#F57237"
    interpolation: linear
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    listen:
      Date: dispute.opened_date
    row: 4
    col: 0
    width: 14
    height: 13
  - title: Disputes in Need of Reply
    name: Disputes in Need of Reply
    model: block_braintree_v2
    explore: transaction
    type: looker_grid
    fields: [dispute.days_to_reply, dispute.reason, transaction.id, dispute.opened_date,
      dispute.reply_by_date, registered_customer.first_name, registered_customer.last_name,
      registered_customer.email, dispute.kind]
    filters:
      dispute.reply_by_date: ''
      dispute.days_to_reply: ">=0"
    sorts: [dispute.days_to_reply]
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", dispute.reply_by_date, dispute.opened_date,
      dispute.reason, dispute.kind, transaction.id, dispute.days_to_reply, registered_customer.first_name,
      registered_customer.last_name, registered_customer.email]
    show_totals: true
    show_row_totals: true
    series_labels:
      transaction.id: Transaction ID
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, custom: {
            id: 64ecfba4-2949-f1b7-c89b-c70a5a0fcf77, label: Custom, type: continuous,
            stops: [{color: "#f21812", offset: 0}, {color: "#ffffff", offset: 100}]},
          options: {steps: 5, reverse: false}}, bold: false, italic: false, strikethrough: false,
        fields: [dispute.days_to_reply]}]
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
      Date: dispute.opened_date
    row: 17
    col: 8
    width: 16
    height: 14
  - title: Accepted Disputes By Reason
    name: Accepted Disputes By Reason
    model: block_braintree_v2
    explore: transaction
    type: looker_scatter
    fields: [dispute_ndt.count, dispute.count, accepted_disputes, accepted_amount,
      dispute.reason_display]
    pivots: [dispute.reason_display]
    filters:
      dispute.reason: "-NULL"
      accepted_amount: ">0"
    sorts: [dispute.reason_label 0, dispute_ndt.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: dispute_acceptance_rate, label: Dispute Acceptance
          Rate, expression: "${accepted_disputes} / if(${dispute.count} = 0, null,\
          \ ${dispute.count})", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}, {measure: accepted_disputes, based_on: dispute.count,
        type: count_distinct, label: Accepted Disputes, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: '${dispute.status}
          = "Accepted"'}, {measure: accepted_amount, based_on: dispute.total_dispute_amount,
        type: count_distinct, label: Accepted Amount, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: '${dispute.status}
          = "Accepted"'}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: accepted_amount, id: Canceled
              Recurring Transaction - accepted_amount, name: Canceled Recurring Transaction},
          {axisId: accepted_amount, id: Credit Not Processed - accepted_amount, name: Credit
              Not Processed}, {axisId: accepted_amount, id: Duplicate - accepted_amount,
            name: Duplicate}, {axisId: accepted_amount, id: Fraud - accepted_amount,
            name: Fraud}, {axisId: accepted_amount, id: General - accepted_amount,
            name: General}, {axisId: accepted_amount, id: Invalid Account - accepted_amount,
            name: Invalid Account}, {axisId: accepted_amount, id: Not Recognized -
              accepted_amount, name: Not Recognized}, {axisId: accepted_amount, id: Product
              Not Received - accepted_amount, name: Product Not Received}, {axisId: accepted_amount,
            id: Product Unsatisfactory - accepted_amount, name: Product Unsatisfactory},
          {axisId: accepted_amount, id: Transaction Amount Differs - accepted_amount,
            name: Transaction Amount Differs}], showLabels: true, showValues: true,
        minValue: 1, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Number of Disputes
    size_by_field: dispute_acceptance_rate
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hidden_series: []
    hide_legend: false
    series_types: {}
    series_colors: {}
    reference_lines: []
    swap_axes: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [accepted_disputes, dispute.count]
    interpolation: linear
    listen:
      Date: dispute.opened_date
    row: 17
    col: 0
    width: 8
    height: 14
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 12 months
    allow_multiple_values: true
    required: false